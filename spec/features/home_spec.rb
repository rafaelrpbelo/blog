require 'spec_helper'

feature 'Home' do
	scenario 'Blog' do
		visit '/'

		expect(page).to have_content 'Blog'
	end
end