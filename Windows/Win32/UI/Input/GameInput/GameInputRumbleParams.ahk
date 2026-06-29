#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputRumbleParams {
    #StructPack 4

    lowFrequency : Float32

    highFrequency : Float32

    leftTrigger : Float32

    rightTrigger : Float32

}
