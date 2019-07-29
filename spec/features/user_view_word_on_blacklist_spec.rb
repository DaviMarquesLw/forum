require 'rails_helper'

feature 'User view word on blacklist' do
  scenario 'successfully' do
    Blacklist.create(word: 'Primeira')

    visit root_path
    click_on 'Blacklist'

    expect(current_path).to eq(current_path)
    expect(page).to have_content('Primeira')
  end

  scenario 'and add a word' do
    visit root_path
    click_on 'Blacklist'
    click_on 'Nova Palavra'
    fill_in 'Digite a palavra', with: 'Primeira palavra'
    click_on 'Enviar'

    expect(current_path).to eq(current_path)
    expect(page).to have_content('Primeira palavra')
  end

  scenario 'and must fill in topic' do
    visit new_blacklist_path
    fill_in 'Digite a palavra', with: ''
    click_on 'Enviar'

    expect(current_path).to eq(current_path)
    expect(page).to have_content('O campo não pode ficar em branco')
  end

  scenario 'and must not be case sensitive' do
    Blacklist.create(word: 'Primeira palavra')

    visit new_blacklist_path
    fill_in 'Digite a palavra', with: 'PRIMEIRA PALAVRA'
    click_on 'Enviar'

    expect(current_path).to eq(current_path)
    expect(page).to have_content('Essa palavra já existe')
  end
end
