primeiro_topico = Topic.create(title: 'Primeiro Tópico')
segundo_topico = Topic.create(title: 'Segundo Tópico')
terceiro_topico = Topic.create(title: 'Terceiro Tópico')

primeira_resposta = Description.create(desc: 'Primeira resposta',
                                        topic_id: terceiro_topico.id)
segunda_resposta = Description.create(desc: 'Segunda resposta',
                                       topic_id: primeiro_topico.id)
terceira_resposta = Description.create(desc: 'Terceira resposta',
                                        topic_id: segundo_topico.id)

Blacklist.create(word: 'Primeiro')
Blacklist.create(word: 'Batata')
Blacklist.create(word: 'Teste')
