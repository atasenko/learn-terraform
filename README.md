## Задание 1  
### Ошибки:  
main.tf
resource "yandex_compute_instance" "platform"
- platform_id = "standart-v4"  
У Yandex Cloud доступно всего 3 стандартных платформы и слово standart пишется как standard. Исправляю на standard-v1.  
- cores = 1  
Минимально допустимое количество ядер - 2.  

### Значение параметров:  
- preemptible = true  
Делает виртуальную машину "прерываемой". Такая ВМ дешевле стоит, а кроме того, автоматически остановится спустя 24 часа работы или может быть принудительно выключена в случае нехватки ресурсов в той же зоне доступности.  
- core_fraction=5  
Задает минимальный гарантированный уровень производительности используемых ядер CPU. При значении 5 ВМ будет иметь доступ к физическим ядрам как минимум 5% времени. Подходит для нетребовательных к ресурсам и задержкам ВМ. Всё что меньше 100 стоит дешевле.  

### Пруфы Terraform.  
Скриншот ЛК Yandex Cloud с созданной ВМ  
![vm_is_ready](img/tf-vm-done.png)
Скриншот успешного подключения к консоли ВМ через ssh
![ssh_is_ok](img/tf-ssh-done.png)

## Задание 2  
Все хардкод значения yandex_compute_image и yandex_compute_instance заменены на отдельные переменные, переменные объявлены в файле variables.tf.  
[Здесь](https://github.com/atasenko/learn-terraform/blob/d46ad5df57ca74d2e678f9e817bab35b54e0ce71/02/src/variables.tf) файл с переменными для этого задания.
Изменений в terraform plan нет.  
![all_is_ok](img/tf_plan_with_vars.png)

## Задание 3  
Создан файл vms_platform.tf, в него перенесены все переменные первой ВМ, создана вторая ВМ.  
Код в [коммите](https://github.com/atasenko/learn-terraform/blob/cbdbb0c9c842aa4b9efd6e45cc3bd1b54dfdc930/02/src/vms_platform.tf).  
Есть недостаток, не перенес переменные первой машины в файл vms_platform.tf, сделал это только в задании 5.
![db_is_here](img/tf-web-db.png)

### Задание 4  
В файле [outputs.tf](https://github.com/atasenko/learn-terraform/blob/terraform-02/src/outputs.tf) объявить output типа map с внешним IP адресом для каждой ВМ.  
![ips_here](img/tf-output.png)

### Задание 5  
В файле [locals.tf](https://github.com/atasenko/learn-terraform/blob/terraform-02/src/locals.tf) описать в одном блоке имя каждой ВМ используя интерполяцию, заменить переменные из файла variables.tf на новые. Выполнено.  

### Задание 6  
Вместо использования трех переменных в блоке resources объединить их в переменные типа map в файле [vms_platform.tf](https://github.com/atasenko/learn-terraform/blob/terraform-02/src/vms_platform.tf). То же самое с блоком metadata. Удалить переменные ставшие ненужными.  
Далеко не сразу, но получилось.  

### Задание 7  
1. Какой командой отобразить второй элемент списка test_list?  
local.test_list[1]  
2. Длина списка test_list  
length(local.test_list)  
3. Отобразить значение ключа admin из map test_map  
local.test_map.admin
4. Interpolation выражение  
"${local.test_map.admin} is admin for ${local.test_list[2]} server based on OS ${local.servers.production.image} with ${local.servers.production.cpu} vcpu, ${local.servers.production.ram} ram and ${length(local.servers.production.disks)} virtual disks"
