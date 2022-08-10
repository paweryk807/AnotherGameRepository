extends Node2D

const CARD = preload("res://Card/Card.tscn")
#const CARD_SIZE = Vector2(125, 175)
var deck = []

# card oval is the oval along which cards are held in player hand
onready var card_oval_center = get_viewport().size * Vector2(0.4, 1.25) # TODO should be 0.5 instead of 0.4
onready var horizonatal_radius = get_viewport().size.x * 0.45
onready var vertical_radius = get_viewport().size.y * 0.65
var angle = deg2rad(90) - 0.2
var card_oval_angle_vector = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	_initialize_deck(3)


func _input(event):
	if Input.is_action_just_released("leftclick") and deck.size() > 0:
		var new_card = CARD.instance()
		new_card.card_name = deck.pop_front()
		new_card.rect_scale *= 0.8
		card_oval_angle_vector = Vector2(horizonatal_radius * cos(angle), - vertical_radius * sin(angle))
		new_card.rect_position = card_oval_center + card_oval_angle_vector - new_card.rect_size / 2
		new_card.rect_rotation = 90 - rad2deg(angle)
		angle += 0.2
		$Cards.add_child(new_card)

		
func _initialize_deck(player_count):
	match player_count:
		3:
			deck = ["Yellow", "Yellow", "Green", "Green", "Red", "Red", "GreenOrange"]
	deck.shuffle()
