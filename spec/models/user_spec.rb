require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { User.new(name: 'Peter', photo: '_url_', bio: 'Brewer', posts_counter: 0) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Should be valid' do
    expect(subject).to be_valid
  end

  it 'post_counter should be a greter than or equal to 0' do
    expect(subject.posts_counter).to be >= 0
  end
end
