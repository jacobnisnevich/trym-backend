class User
  def initialize 
    host = 'jacob-aws.cksaafhhhze5.us-west-1.rds.amazonaws.com'
    @client = Mysql2::Client.new(
      :adapter  => 'mysql2',
      :host     => 'jacob-aws.cksaafhhhze5.us-west-1.rds.amazonaws.com',
      :username => ENV['MYSQL_USERNAME'],
      :password => ENV['MYSQL_PASSWORD'],
      :database => 'jacob'
    )
  end

  def login_user(email, password)
    password_hash = Digest::SHA2.hexdigest password

    login_query = "SELECT password FROM trym_users WHERE email='#{email}'"
    query_output = @client.query(login_query)

    validate_result = {}
    if query_output.first.nil? || query_output.first["password"] != password_hash
      validate_result["valid"] = false
    else
      validate_result["valid"] = true
    end

    validate_result.to_json
  end

  def register_user(email, password, first_name, last_name)
    password_hash = Digest::SHA2.hexdigest password

    resister_query = "INSERT INTO trym_users (user_id, email, password, first_name, last_name) VALUES (NULL, '#{email}', '#{password_hash}', '#{first_name}', '#{last_name}')"

    validate_result = {}
    begin
      @client.query(register_user)
      validate_result["valid"] = true
    rescue Exception => e
      validate_result["valid"] = false
      validate_result["message"] = "#{e.class}"
    end

    validate_result.to_json
  end
end
