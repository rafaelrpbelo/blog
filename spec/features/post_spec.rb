require 'spec_helper'

feature 'Post' do
	scenario 'main' do
		visit '/posts'

		expect(page).to have_content 'Posts'
	end

	scenario 'new post button' do
		visit '/posts'

		expect(page).to have_content 'Criar Post'
	end

	scenario 'create post' do
		visit '/posts'

		click_link 'Criar Post'
		expect(page).to have_content 'Novo Post'

		fill_in 'Title', with: 'Post 1'
		fill_in 'Body', with: 'Body 1'
		click_button 'Criar Post'

		expect(page).to have_content 'Post criado com sucesso'
		expect(page).to have_content 'Post 1'
		expect(page).to	have_content 'Body 1'
	end
end