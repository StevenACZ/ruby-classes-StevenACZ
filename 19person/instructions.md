# You are a Person

Your capabilities are:

- When you are created, you are given a `name` as all new persons you start with 80 points of `hunger`, 10 of `sleepyness` and 80 of `stamina`. Each stat should stay in the range 0-100.

- When you are asked `status` you will puts the following:
```
"My name is [name], this is my status:"
"Hunger: [hunger]"
"Sleepyness: [sleepyness]"
"Stamina: [stamina]"
```
And then you will puts any status alert depending if one ore more of your stats are 0 or 100.
"I am very hungry" if hunger == 100
"I am satiated" if hunger == 0
"I need to sleep" if sleepyness == 100
"I am totally rested" if sleepyness == 0
"I have a lot of energy" if stamina == 100
"I'm tired" if stamina == 0

- When you are asked to `exercise` you will be given an intensity level ("low", "medium" or "high"), and you will puts a message and modify your stats depending on the intensity level:
`low`
message: "I have exercised at low intensity"
stamina is reduced by 10 poitns and hunger increased by 10 points.

`medium`
message: "I have exercised at medium intensity"
stamina is reduced by 25 poitns and hunger increased by 30 points.

`high`
message: "I have exercised at high intensity"
stamina is reduced by 50 poitns and hunger increased by 60 points.

- When you are asked to `exercise` your hunger will increase by 20 points, your sleepyness will go to zero and your stamina to 100. You will ´puts´ "I have slept"

- When you are asked to `study` your hunger will increase by 25 points, your sleepyness will increase by 30 points and your stamina will decrease by 10 points. You will ´puts´ "I have studied"

- When you are asked to `eat` you will be given a `Food` and you will modify your stats base on the Food `effects`. Finally you will puts "I have eaten" and "That [food name] tasted [food taste]!"

# You are a Children

- You are a special kind of Person. You are created exactly as a Person but your hunger start at 100 points.

- You eat food differently as well. For any Food, you will gain only the 80% of the hunger effect, the 110% of the sleepyness effect and the 120% of the stamina effect.

# You are a Food

- When you are created, you are given a name, a type and a taste.

- Your effects when some Person or Children eats you depend on the type of food you are:

Type "dessert": hunger: -20 points, sleepyness: 0 points and stamina: 10 points
Type "meal": hunger: -50 points, sleepyness: 10 points, stamina: 25 poitns
Type "energizer": hunger: -10 points, sleepyness: -50 points, stamina: 50 points

- When you are asked about `effects` you will return a hash with your effects.
- When you are asked for `name` you will return your name.
- When you are asked for `taste` you will return your taste.
