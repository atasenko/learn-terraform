### Задание 1  
Проект инициализирован, выполнен, вот скриншот созданных правил Групп безопасности:  
![Security rules](img/tf3-t1.png)  

### Задание 2  
#### 1  
Создан файл [count-vm.tf](src/count-vm.tf) создающий две одинаковые машины с именами web-1 и web-2, назначена сделанная в первом задании группа безопасности.  
#### 2  
В файле [for_each-vm.tf](src/for_each-vm.tf) описано создание еще двух разных ВМ с именами main и replica используя мета-аргумент for_each loop. Общая переменная - vm_for_resources в файле [variables.tf](src/variables.tf)  
Я пытался, но, к сожалению, не осилил создать переменную типа list. Даже IDE была не против, но terraform стоял на своем и каждый раз при запуске terraform plan выдавал следующую ошибку:  
![No list, map or set only](img/tf3-t2-error.png)
Подкрепляю выдержкой из [документации](https://developer.hashicorp.com/terraform/language/meta-arguments/for_each)  
![Doc](img/tf3-t2-doc.png)
#### 3  
ВМ из пункта 2.2 будут создаваться после ВМ из 2.1 благодаря мета-аргументу depends_on  
#### 4  
В файл [locals.tf](src/locals.tf) добавлена функция считывающая публичную часть ключа из ~/.ssh/id_ed25519.pub  
#### 5  
Проект инициализирован, код выполнен:  
![VM`s done](img/tf3-t2-done.png)  

### Задание 3  
Три одинаковых диска и ВМ с ними созданы в файле [disk_vm.tf](src/disk_vm.tf)  
Машина создана  
![Storage VM](img/tf3-t3-storage.png)  

### Задание 4  
В файле [ansible.tf](src/ansible.tf) создал inventory-файл для ansible. IP отличаются от вывода предыдущих заданий, т.к. делались в разное время.  
На выходе получен [hosts.cfg](src/hosts.cfg) и его скриншот:  
![hosts.cfg](img/tf3-t4.png)
