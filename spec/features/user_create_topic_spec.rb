require 'rails_helper'

feature 'New topic' do
  scenario 'successfully' do
    visit new_topic_path

    click_on 'Cadastrar Tópico'
    fill_in 'Tópico', with: 'Primeiro Teste'
    click_on 'Enviar'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Primeiro Teste')
  end

  scenario 'and must fill in topic' do
    visit new_topic_path
    fill_in 'Tópico', with: ''
    click_on 'Enviar'

    expect(current_path).to eq(current_path)
    expect(page).to have_content('Você deve informar um tópico')
  end

  scenario 'and must be unique' do
    Topic.create(title: 'Primeiro teste')

    visit new_topic_path
    fill_in 'Tópico', with: 'Primeiro teste'
    click_on 'Enviar'

    expect(current_path).to eq(current_path)
    expect(page).to have_content('Esse tópico já existe')
  end

  scenario 'and must not be case sensitive' do
    Topic.create(title: 'Primeiro teste')

    visit new_topic_path
    fill_in 'Tópico', with: 'PRIMEIRO TESTE'
    click_on 'Enviar'

    expect(current_path).to eq(current_path)
    expect(page).to have_content('Esse tópico já existe')
  end

  scenario 'and view just topics descriptions' do
    topic = Topic.create(title: 'Primeiro teste', id: 1)
    other_topic = Topic.create(title: 'Segundo teste', id: 2)
    description = Description.create(desc: 'Resposta', topic_id: 1)

    visit topic_path(topic)

    expect(current_path).to eq(topic_path(topic))
    expect(page).to have_content(description.desc)
    expect(page).not_to have_css('tr', text: other_topic)
  end
end
