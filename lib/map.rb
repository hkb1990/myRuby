class Room 

	attr_accessor :name, :description, :paths

	def initialize(name, description)
		@name = name
		@description = description
		@paths = {}
	end

	def go(direction)
		@paths[direction]
	end

	def add_paths(paths)
		@paths.update(paths)
	end
end

Central_corridor = Room.new("Central Corridor",
%q{
	The Gothons of Planet Percal #25 have invaded your ship and destroyed
	your entire crew. ...
})

Laser_weapon_armory = Room.new("Laser Weapon Armory",
%q{
	Lucky for you they made you learn Gotnon insults in the academy.
	You tell the one Gothon joke you know: ...
})

The_bridge = Room.new("The Bridge",
%q{
	The container clicks open and the seal breaks, letting gas out.
	Youu grab the neutron bomb and run as fast as you can to the 
	bridge where you must place it in the right spot. ...
})

Escape_pod = Room.new("Escape Pod",
%q{
	You point yout blaster at the bomb under your arm and 
	the Gothons put their hands up and start to sweat.
	You inch backword to the door, open it, and then carefully 
	place teh bomb on the floor, pointing yout blaster at it. ...
})

The_end_winner = Room.new("The End",
%q{
	You jump int pod 2 and hit the eject button. The
	pod easily slides out into space heading to the 
	planet below. As it flies to the planet, you look
	back and see your ship implode then explode like a 
	bright star, taking out the Gothon ship at the same 
	time. You Won!
})

The_end_loser = Room.new("The End",
%q{
	You jump into a random pod and hit the eject button.
	The pod escape out into the void of space, then 
	implodes as the hull ruptures, crushing your body
	into jam jelly.
})

Escape_pod.add_paths({
	'2' => The_end_winner,
	'*' => The_end_loser
})

Generic_death = Room.new("death","You died.")

The_bridge.add_paths({
	'throw the bomb' => Generic_death,
	'slowly place the bomb' => Escape_pod
})

Laser_weapon_armory.add_paths({
	'0123' => The_bridge,
	'*' => Generic_death
})

Central_corridor.add_paths({
	'shoot!' => Generic_death,
	'dodge!' => Generic_death,
	'tell a joke!' => Laser_weapon_armory
})

START = Central_corridor
