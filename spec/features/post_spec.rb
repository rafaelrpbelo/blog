require 'spec_helper'

feature 'Post' do
  scenario 'main' do
    visit '/posts'

    expect(page).to have_content title('post.index')
  end

  scenario 'create' do
    visit '/posts'

    click_link t('link.action.new', resource: 'post')
    expect(page).to have_content title('post.new')

    fill_in label('title'), with: 'Post 1'
    fill_in label('body'), with: 'Body 1'
    click_button submit('post')

    expect(page).to have_content flash('post.create.notice')
    expect(page).to have_content 'Post 1'
    expect(page).to have_content 'Body 1'
  end

  scenario 'index' do
    pending
  end

  scenario 'update' do
    pending
  end

  scenario 'destroy' do
    pending
  end
end
