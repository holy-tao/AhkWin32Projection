#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputHapticFeedbackParams {
    #StructPack 8

    waveformIndex : UInt32

    duration : Int64

    intensity : Float32

    playCount : UInt32

    repeatDelay : Int64

}
