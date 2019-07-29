require 'rails_helper'

feature 'User insert word on blacklist' do
  scenario 'successfully' do
    Blacklist.create(word: 'Primeira')

    visit blacklists_path
    click_on 'Editar'
    fill_in 'Digite a palavra', with: 'Primeira edição'
    click_on 'Enviar'

    expect(current_path).to eq(current_path)
    expect(page).to have_content('Primeira edição')
  end

  scenario 'and must fill in blacklist' do
    Blacklist.create(word: 'Primeira')

    visit blacklists_path
    click_on 'Editar'
    fill_in 'Digite a palavra', with: ''
    click_on 'Enviar'

    expect(current_path).to eq(current_path)
    expect(page).to have_content('O campo não pode ficar em branco')
  end
end
