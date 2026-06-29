#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputForceFeedbackMagnitude {
    #StructPack 4

    linearX : Float32

    linearY : Float32

    linearZ : Float32

    angularX : Float32

    angularY : Float32

    angularZ : Float32

    normal : Float32

}
