# frozen_string_literal: true

RSpec.describe VersionGem::Version do
  it 'is a module' do
    expect(described_class).is_a?(Module)
  end

  it 'has a VERSION' do
    expect(described_class.const_defined?('VERSION')).to eq(true)
  end

  it 'has a version number' do
    expect(described_class::VERSION).not_to be_nil
  end

  it 'can be a string' do
    expect(described_class.to_s).to be_a(String)
  end

  it 'allows Constant access' do
    expect(described_class::VERSION).to be_a(String)
  end

  it 'is greater than 0.1.0' do
    expect(Gem::Version.new(described_class) > Gem::Version.new('0.1.0')).to be(true)
  end

  it 'is greater than 1.0.0' do
    expect(Gem::Version.new(described_class) > Gem::Version.new('1.0.0')).to be(true)
  end

  it 'major version is an integer' do
    expect(described_class.major).to be_a(Integer)
  end

  it 'minor version is an integer' do
    expect(described_class.minor).to be_a(Integer)
  end

  it 'patch version is an integer' do
    expect(described_class.patch).to be_a(Integer)
  end

  it 'returns a Hash' do
    expect(described_class.to_h.keys).to match_array(%i[major minor patch pre])
  end

  it 'returns an Array' do
    expect(described_class.to_a).to be_a(Array)
  end
end