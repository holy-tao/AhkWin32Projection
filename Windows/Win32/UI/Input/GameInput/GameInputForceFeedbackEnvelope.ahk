#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputForceFeedbackEnvelope {
    #StructPack 8

    attackDuration : Int64

    sustainDuration : Int64

    releaseDuration : Int64

    attackGain : Float32

    sustainGain : Float32

    releaseGain : Float32

    playCount : UInt32

    repeatDelay : Int64

}
