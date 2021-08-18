global record KeyboardModifiers
	ctrl: boolean
	shift: boolean
end

global record CameraState
	mode: number
	flipped: integer
end

global record Game
  gameVersion: string
end

global record Spring
	GetCameraState: function(): CameraState
	SetCameraState: function(state: CameraState, n: number)
  IsCheatingEnabled: function(): boolean
  GetGameFrame: function(): number
  SendCommands: function(command: string)
  Echo: function(input: any)
end

global record WidgetInfo
  name: string
  desc: string
  author: string
  date: string
  license: string
  layer: integer
  enabled: boolean
end

global record widget
  GetInfo: function(self: widget): WidgetInfo
  KeyPress: function(self: widget, key:integer,mods: KeyboardModifiers,isRepeat: boolean): any
  GameFrame: function(self: widget, frameNumber: number, something: boolean)
  Initialize: function(self: widget)
end

global record widgetHandler
  UpdateCallIn: function(self: widgetHandler, callIn: string)
  RemoveCallIn: function(self: widgetHandler, callIn: string)
end