require_relative 'Schedule.rb'

class Command
  def initialize
    @schedule = Schedule.new
  end

  def menu
    puts "AGENDA TELEFONICA\n"
    puts "1 - Adicionar contato\n2 - Listar contatos\n3 - Editar Contato\n4 - Deletar Contato\n0 - SAIR\n"
    print "opcao: "
    @option = gets.chomp.to_i
  end

  def execute
    case @option
      when 0
        abort("Saindo do programa")
      when 1
        add_contact
      when 2
        list_contact
      when 3
        edit_contact
      when 4
        delete_contact
      else
        puts "Opção inválida"
    end
  end

  def add_contact
    puts "Adicionar contato"
    puts "--" * 10
    print "Nome: "
    name = gets.chomp
    print "Telefone: "
    phone = gets.chomp
    @schedule.add(name, phone)
  end

  def list_contact
    puts "Contatos encontrados:"
    puts "--" * 10
    puts @schedule.list
  end

  def edit_contact
    print "Nome do contato que será editado: "
    name = gets.chomp
    @schedule.edit(name)
  end

  def delete_contact
    print "Nome do contato que será deletado: "
    name = gets.chomp
    @schedule.remove(name)
  end


end