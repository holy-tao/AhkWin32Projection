#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputForceFeedbackMagnitude.ahk" { GameInputForceFeedbackMagnitude }
#Import ".\GameInputForceFeedbackEnvelope.ahk" { GameInputForceFeedbackEnvelope }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputForceFeedbackPeriodicParams {
    #StructPack 8

    envelope : GameInputForceFeedbackEnvelope

    magnitude : GameInputForceFeedbackMagnitude

    frequency : Float32

    phase : Float32

    bias : Float32

}
