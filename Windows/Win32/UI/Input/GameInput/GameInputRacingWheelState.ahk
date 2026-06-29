#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputRacingWheelButtons.ahk" { GameInputRacingWheelButtons }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputRacingWheelState {
    #StructPack 4

    buttons : GameInputRacingWheelButtons

    patternShifterGear : Int32

    wheel : Float32

    throttle : Float32

    brake : Float32

    clutch : Float32

    handbrake : Float32

}
