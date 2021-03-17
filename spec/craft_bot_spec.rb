# frozen_string_literal: true

RSpec.describe CraftBot do
  it "has a version number" do
    expect(CraftBot::VERSION).not_to be nil
  end
end
