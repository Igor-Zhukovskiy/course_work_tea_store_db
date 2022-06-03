# База данных чайного магазина.
Данная база данных предстовляет собов возможную структуру магазина по продаже чая и сопутсвующей продукции.

<br>

# Типовые запросы к базе данных.

Показать 3 клиента с самым большим числом баллов.

```sql
select name, bonus_points
from clients
order by bonus_points desc
limit 3;
```

<br>

Показать все продажи, которые сделал сотрудник «Александр Александрович» в которых значение покупателя не равняется нулю.

```sql
select employees.name, orders.employee_id, count(orders.employee_id) as amount_of_sales
from orders
left join employees on employees.id = orders.employee_id
where employees.id = 3
group by employees.name;
```

<br>

Показать самый часто покупаемый чай от производителя «Tess».

```sql
select items.title, brands.id, brands.title, count(sales.item_id) as bought_times
from items
left join brands on brands.id = items.brand_id
left join sales on sales.item_id = items.id
where sales.item_id is not null and brands.id = 1
group by items.title
order by bought_times desc
limit 1;
```

<br>

Вывести название только тех чаев которые находятся в категории «Пуэр» и id чека, в котором он фигурирует.

```sql
select items.title, categories.id, categories.title, sales.order_id
from items
left join categories on categories.id = items.category_id
left join sales on sales.item_id = items.id
where categories.id = 3;
```

<br>

Внести в таблицу «items» черный чай от бренда «Айзерчай» с названием «классический черный чай» с количеством 220 грамм и ценой в 140 р за 100 грамм.

```sql
insert into items(title, brand_id, category_id, amount, units, price_per_unit) values
("Классический черный", 7, 1, 220 1 140);
```

<br>

Внести клиента «Егор Чайник» с номером телефона «79190724450» и количеством баллов равным 32.

```sql
insert into clients(name, phone_number, bonus_points) values
("Егор Чайник", 79190724450, 32);
```

<br>

Начислит клиенту с именем «Егор Чайник» 100 баллов.

```sql
update clients
set bonus_points = bonus_points + 100
where id = 5;
```

<br>

Посчитать сколько раз был куплен чай каждого из брендов за май месяц этого года, отсортировать по возрастанию.

```sql
select items.title, count(sales.item_id) as bougth_times, orders.date as date
from sales
left join items on items.id = sales.item_id
left join orders on orders.id = sales.order_id
where month(date) = 5
group by items.title;
```