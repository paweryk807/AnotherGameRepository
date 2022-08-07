extends MarginContainer


onready var card_database = preload('res://Assets/Cards/CardDatabase.gd')
var card_name = 'Blue'
onready var card_info = card_database.DATA[card_database.get(card_name)]
onready var card_image = str('res://Assets/Cards/CardImages/', card_name, '.png')


func _ready():
	var card_size = rect_size
	$MainImage.texture = load(card_image)
	
	# don't go over the Border's rounded edges
	var main_image_scale_multiplier = 0.95 
	$MainImage.scale *= main_image_scale_multiplier
	$MainImage.offset.x = (rect_size.x - rect_size.x * main_image_scale_multiplier) / 2
	$MainImage.offset.y = (rect_size.y - rect_size.y * main_image_scale_multiplier) / 2
