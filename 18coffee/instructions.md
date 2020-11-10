# You are a Coffee Machine

Your capabilities are:

- When you are created, you have a capacity for coffee, water and milk.
- You start with zero amount of coffee, water and milk. (`coffee`, `water`, `milk`)
- When you are asked for each of your capacities (`coffee_cap`, `water_cap` or `milk_cap`), you will return the integer that represent your capacity.
- When you are asked for the amount of `coffee`, `water` or `milk`, you will return the integer that represents the amount of said ingredient that you have.

- When you are asked to `fill_coffee`, you will be given an amount. If that amount + the current amount of coffee that you have exceeds your coffee capacity, you will `puts` "Too much! Only [number] free" where [number] is the current available capacity for coffee. Otherwise, you will `puts` "Coffee new level [current amount]/[coffee capacity]"

- When you are asked to `fill_water`, you will be given an amount. If that amount + the current amount of water that you have exceeds your water capacity, you will `puts` "Too much! Only [number] free" where [number] is the current available capacity for water. Otherwise, you will `puts` "Water new level [current amount]/[water capacity]"

- When you are asked to `fill_milk`, you will be given an amount. If that amount + the current amount of milk that you have exceeds your milk capacity, you will `puts` "Too much! Only [number] free" where [number] is the current available capacity for milk. Otherwise, you will `puts` "Milk new level [current amount]/[milk capacity]"

- When you are asked to `make_coffee`, you will be given a hash of ingredients like `{ coffee: [amount1], water: [amount2], milk: [amount3] }`. You will check if you have enough of each ingredient. If you have enough you will `puts` "Your coffee is ready!" and will reduce each amount of the ingredients you had. If both `water` and `milk` are zero or not present in the ingredients hash you will `puts` "You need to specify water and/or milk". Finally, if you don't have enough of one or more ingredients, for each ingreadient you don't have enough you will `puts` "Not enough [ingredient]" where [ingredient] could be coffee, water or milk.

- When you are asked `coffee_count` you will return the total amount of cups of coffee that you have successfully served.

- When you served 500 or more cups of coffee without performing any maintenance, each time you serve a cup of coffee you will then `puts` "Machine needs maintenance!" (after "Your coffee is ready!"). When you are asked to `perfom_maintenance`, you won't display the maintenance message until reach 500 new cups of coffee again.
