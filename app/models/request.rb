class Request < ActiveRecord::Base
  serialize  :headers, Hash
  serialize  :cookies, Hash
  serialize  :query_params, Hash

  after_save :notify_watcher

  def self.watch_new_requests(trap_id)
    begin
      connection.execute "LISTEN #{trap_id}_channel"
      loop do
        connection.raw_connection.wait_for_notify do |event, pid, request_id|
          yield request_id
        end
      end
    ensure
      connection.execute "UNLISTEN #{trap_id}_channel"
    end
  end

  def self.channel(trap_id)
    "#{trap_id}_channel"
  end

  private

  def notify_watcher
    connection.execute "NOTIFY #{channel}, #{connection.quote self.id.to_s}"
  end

  # Esablish connection to Postgres db
  def connection
    ActiveRecord::Base.connection
  end

  def channel
    "#{trap_id}_channel"
  end
end
