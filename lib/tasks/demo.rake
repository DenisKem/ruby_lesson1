namespace :demo do

  desc 'демонстрация возможностей системы после 4 занятия'
  task employees_position: :environment do

    position = Position.create! name: 'торговец черным деревом'

    employee = Employee.new full_name: 'себастьян перейро',
                            position: position


    employee.job_start = DateTime.now
    employee.save!
  end

  desc 'Проверка создания связей между сотрудником и проектами'
  task employees_projects: :environment do
    position = Position.create! name: 'философ'

    employee = Employee.create! full_name: 'Гегель',
                            position: position

    projects = (1..10).to_a.map do
      Project.create! name: Faker::Hacker.say_something_smart
    end

    rand(2..3).times do
      employee.projects << projects.sample
    end
    
    position.employees.create!  full_name: 'Феербах'
    
    employee.projects.each do |p|
      puts "Project name = #{p.name}"
    end

  end
  
  desc 'Отсортировать сотрудников'
  def employee_sort
    # первыми идут новички
	puts Employee.order(:job_start => :desc).map(&:job_start)
	
	# Первыми покажем тех, кто дольше всех работает.
	puts Employee.order(:job_start).map(&:job_start)
  end
end
