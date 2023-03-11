execute at @s anchored eyes run summon area_effect_cloud ^ ^ ^1 {Tags:[tnt.ray],Duration:111}
execute as @a store result score @s tnt.x run data get entity @s Pos[0]
execute as @a store result score @s tnt.z run data get entity @s Pos[2]
execute as @e[tag=tnt.ray] at @s unless entity @s[tag=tnt.log] facing entity @p eyes run tp @s ^ ^ ^-.5
execute as @e[tag=tnt.ray] at @p if entity @s[distance=111..] run kill @s
execute as @e[tag=tnt.ray] at @p unless entity @s[tag=tnt.log] if entity @e[tag=tnt.log,distance=..5] run kill @s
execute as @e[tag=tnt.ray] at @s if block ~ ~ ~ birch_log unless entity @e[tag=tnt.log,distance=..5] run tag @s add tnt.log
execute as @e[tag=tnt.log] at @s store result score @p tnt.distancex run data get entity @s Pos[0]
execute as @e[tag=tnt.log] at @s as @p at @s run scoreboard players operation @s tnt.distancex -= @s tnt.x
execute as @e[tag=tnt.log] at @s store result score @p tnt.distancez run data get entity @s Pos[2]
execute as @e[tag=tnt.log] at @s as @p at @s run scoreboard players operation @s tnt.distancez -= @s tnt.z
execute as @e[tag=tnt.log] at @s unless entity @s[tag=tnt.finish] as @p at @s run function tnt:go
tag @e[tag=tnt.log] add tnt.finish
execute as @e[tag=tnt.finish] at @s as @e[tag=tnt.ray,distance=..5] unless entity @s[tag=tnt.finish] run kill @s
execute as @e[tag=tnt.ray] at @s if entity @e[tag=tnt.log,distance=..3] unless entity @s[tag=tnt.finish] run kill @s

execute at @e[tag=tnt.launch] unless block ~ ~-.5 ~ air run summon tnt ~ ~ ~
execute as @e[tag=tnt.launch] at @s if entity @e[type=tnt,distance=..1] run kill @s