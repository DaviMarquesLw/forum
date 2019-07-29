require 'rails_helper'

feature 'Visit homepage' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_content('Fórum R7')
    expect(page).to have_css('p', text: 'Seja bem vindo ao melhor fórum online')
  end

  scenario 'and view topic' do
    topic = Topic.create(title: 'Primeiro Teste')

    visit root_path

    expect(page).to have_css('td', text: topic.title)
  end

  scenario 'and view topics list' do
    topic = Topic.create(title: 'Primeiro Teste')
    second_topic = Topic.create(title: 'Segundo Teste')

    visit root_path

    expect(page).to have_css('td', text: topic.title)
    expect(page).to have_css('td', text: second_topic.title)
  end

  scenario 'and doesn\'t have topics' do
    visit root_path

    expect(page).to have_content('Ainda não temos nenhum Tópico. '\
                                 'Que tal enviar um?')
  end
end
