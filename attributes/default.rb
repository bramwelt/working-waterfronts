default['whats_fresh']['application_dir'] = "/opt/whats_fresh"
default['whats_fresh']['venv_owner'] = 'root'
default['whats_fresh']['venv_group'] = 'root'
default['postgis']['template_name'] = nil
default['whats_fresh']['make_db'] = false

default['whats_fresh']['debug'] = true
default['whats_fresh']['git_branch'] = 'develop'

default['postgresql']['password']['postgres'] = 'postgres'
override['python']['pip_location'] = "#{node['python']['prefix_dir']}/bin/pip2.7"

if platform_family?("rhel")
  override['postgresql']['enable_pgdg_yum'] = true
  override['postgresql']['version'] = '9.3'
  override['postgresql']['server']['packages'] = %W[
  	postgresql#{node['postgresql']['version'].gsub('.','')}-server]
  override['postgresql']['client']['packages'] = %W[
     postgresql#{node['postgresql']['version'].gsub('.','')}-devel
     libpqxx-devel]
  override['postgresql']['server']['service_name'] = "postgresql-9.3"
end

default['postgis']['package'] = 'postgis2_93'

override['build-essential']['compile_time'] = true
