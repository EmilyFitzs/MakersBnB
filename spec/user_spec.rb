require_relative '../models/user'

describe User do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'test1@example.com', password: 'password123')
      expect(user).to be_a User
      expect(user.email).to eq 'test1@example.com'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      User.create(email: 'test2@example.com', password: 'password123')
    end
  end

  describe '.find' do
    it 'returns the user' do
      user = User.create(email: 'test3@example.com', password: 'password123')
      result = User.find(id: user.id)
      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
    
    it 'returns nil if there is no ID given' do
      expect(User.find(id: nil)).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create(email: 'test4@example.com', password: 'password123')
      authenticated_user = User.authenticate(email: 'test4@example.com', password: 'password123')
      expect(authenticated_user.id).to eq(user.id)
    end

    it 'returns nil given an incorrect email address' do
      user = User.create(email: 'test5@example.com', password: 'password123')
      expect(User.authenticate(email: 'nottherightemail@me.com', password: 'password123')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      user = User.create(email: 'test6@example.com', password: 'password123')
      expect(User.authenticate(email: 'test6@example.com', password: 'wrongpassword')).to be_nil
    end
  end
end
