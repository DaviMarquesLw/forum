require 'rails_helper'

feature 'New Description' do
  scenario 'successfully' do
    topic = Topic.create(title: 'Primeiro teste')
    Description.create(desc: 'Resposta', topic_id: 1)

    visit topic_path(topic)
    click_on 'Responder Comentário'
    fill_in 'Novo Comentário', with: 'Resposta Primeiro Teste'
    click_on 'Enviar'

    expect(current_path).to eq(topic_path(topic))
    expect(page).to have_content('Voltar')
    expect(page).to have_content('Resposta')
    expect(page).to have_content('Resposta Primeiro Teste')
  end

  scenario 'and must fill in description' do
    topic = Topic.create(title: 'Primeiro teste')
    Description.create(desc: 'Resposta', topic_id: 1)

    visit topic_path(topic)
    click_on 'Responder Comentário'
    fill_in 'Novo Comentário', with: ''
    click_on 'Enviar'

    expect(current_path).to eq(current_path)
    expect(page).to have_content('O campo não pode ficar em branco')
  end

  scenario 'and doesn\'t have descriptions' do
    Topic.create(title: 'Primeiro teste')

    visit root_path
    click_on 'Responder Comentário'

    expect(page).to have_content('Ainda não temos nenhuma resposta. '\
                                 'Que tal enviar uma?')
  end
end
