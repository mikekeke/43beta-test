extends Node2D

var box = GridContainer.new()

var thread = Thread.new()

var frames = Label.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var btn = Button.new()
	btn.text = "Start thread"
	btn.pressed.connect(test_print)
	add_child(box)
	box.add_child(btn)
	box.add_child(frames)
	prints("Wasm in ready: ", _TextExt._get_n())

func test_print():
	print("Starting the thread")
	thread.start(prt)
	print("Thread ID: ", thread.get_id())

func prt():
	await get_tree().create_timer(3).timeout
	print("Awaited 3 seconds")
	prints("Wasm in thread: ", _TextExt._get_n())

var cnt = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	cnt += 1
	frames.text = str(cnt)
