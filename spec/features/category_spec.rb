require 'spec_helper'

feature 'Category' do
  scenario 'index' do
    visit '/categories'

    expect(page).to have_content(title('category.index'))
  end

  scenario 'new' do
    visit '/categories'

    click_link t('link.action.new', resource: 'categoria')

    expect(page).to have_content(title('category.new'))
    fill_in label('name'), with: 'Category 1'
    click_button submit('categoria')

    expect(current_path).to eq(categories_path)
    expect(page).to have_content(flash('category.create.notice'))
  end

  scenario 'edit' do
    pending
  end
end


