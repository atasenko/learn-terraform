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
![vm_is_ready](img/tf-vm-done.png)
![ssh_is_ok](img/tf-ssh-done.png)

## Задание 2  
![all_is_ok](img/tf_plan_with_vars.png)

## Задание 3  
![db_is_here](img/tf-web-db.png)

### Задание 4  
![ips_here](img/tf-output.png)

### Задание 5  
Выполнено.

### Задание 6  
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
