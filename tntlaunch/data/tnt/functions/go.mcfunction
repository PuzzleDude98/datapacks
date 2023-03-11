#calc x
scoreboard players operation @s tnt.distancex *= #mil tnt.constants
scoreboard players operation @s tnt.speedx = @s tnt.distancex
scoreboard players operation @s tnt.speedx += #m tnt.constants
scoreboard players operation @s tnt.speedx += #b tnt.constants

#calc z
scoreboard players operation @s tnt.distancez *= #mil tnt.constants
scoreboard players operation @s tnt.speedz = @s tnt.distancez
scoreboard players operation @s tnt.speedz += #m tnt.constants
scoreboard players operation @s tnt.speedz += #b tnt.constants

#calc y
scoreboard players operation @s tnt.speedx /= #tho tnt.constants
scoreboard players operation @s tnt.speedz /= #tho tnt.constants
scoreboard players operation @s tnt.speedx *= @s tnt.speedx
scoreboard players operation @s tnt.speedz *= @s tnt.speedz
scoreboard players operation @s tnt.speedy = @s tnt.speedx
scoreboard players operation @s tnt.speedy += @s tnt.speedz

#sqrt stuff
scoreboard players set @a sqrtI 1
scoreboard players set @a sqrtX 0
scoreboard players set @a realDistance 0
execute as @s if score @s tnt.speedy > @s sqrtX run function tnt:sqrt
scoreboard players operation @s tnt.speedy /= #tho tnt.constants

#recalc x
scoreboard players operation @s tnt.speedx = @s tnt.distancex
scoreboard players operation @s tnt.speedx += #m tnt.constants
scoreboard players operation @s tnt.speedx += #b tnt.constants

#recalc z
scoreboard players operation @s tnt.speedz = @s tnt.distancez
scoreboard players operation @s tnt.speedz += #m tnt.constants
scoreboard players operation @s tnt.speedz += #b tnt.constants


summon armor_stand ~ ~1 ~ {Tags:[tnt.launch]}
execute as @e[tag=tnt.launch] store result entity @s Motion[0] double .0000001 run scoreboard players get @p tnt.speedx
execute as @e[tag=tnt.launch] store result entity @s Motion[1] double .00001 run scoreboard players get @p tnt.speedy
execute as @e[tag=tnt.launch] store result entity @s Motion[2] double .0000001 run scoreboard players get @p tnt.speedz
scoreboard players operation @s tnt.distance /= #mil tnt.constants
execute as @a run tellraw @a ["",{"score":{"name":"@s","objective":"tnt.speedx"}},{"text":", "},{"score":{"name":"@s","objective":"tnt.speedy"}},{"text":", "},{"score":{"name":"@s","objective":"tnt.speedz"}}]