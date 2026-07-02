#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputFlightStickButtons.ahk" { GameInputFlightStickButtons }
#Import ".\GameInputSwitchPosition.ahk" { GameInputSwitchPosition }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputFlightStickState {
    #StructPack 4

    buttons : GameInputFlightStickButtons

    hatSwitch : GameInputSwitchPosition

    roll : Float32

    pitch : Float32

    yaw : Float32

    throttle : Float32

}
