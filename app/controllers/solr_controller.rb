require 'remote_server'

class SolrController < ApplicationController
  def core
  end

  def create
    @dest_path = params[:dest_path]
    @index_name = @dest_path.split('/').last
    @dest_server = params[:dest_server]
    @port = params[:port] || '8360'

    remote_server = RemoteServer.new(@dest_server)
    @result = remote_server.create_core(@port, @dest_path, @index_name)
  end

  def copy_schema
    @index_name = params[:hdfs_src].split('/').last
    @hdfs_src = params[:hdfs_src]
    @dest_path = params[:dest_path]
    @dest_server = params[:dest_server]

    remote_server = RemoteServer.new(@dest_server)
    remote_server.copy_schema_files(@hdfs_src, @dest_path)
  end

end
