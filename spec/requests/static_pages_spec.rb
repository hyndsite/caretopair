require 'spec_helper'

describe "StaticPages" do
  
  describe "Home Page" do
    before { visit root_path}
    it "Should have the base title 'Care To Pair |'" do
      expect(page).to have_title('Care To Pair |')
    end

  	it "Should have the right Title" do
			expect(page).to have_title('Home')
  	end
  end
end
