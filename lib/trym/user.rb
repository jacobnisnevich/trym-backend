class User
  def initialize 
    host = 'jacob-aws.cksaafhhhze5.us-west-1.rds.amazonaws.com'
    client = Mysql12::Client.new(:host => "localhost", :username => "root")

  end

  def login_user(email, password)

  end

  def register_user(email, password, first_name, last_name)

  end

end
