#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputForceFeedbackEnvelope.ahk" { GameInputForceFeedbackEnvelope }
#Import ".\GameInputForceFeedbackMagnitude.ahk" { GameInputForceFeedbackMagnitude }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputForceFeedbackConstantParams {
    #StructPack 8

    envelope : GameInputForceFeedbackEnvelope

    magnitude : GameInputForceFeedbackMagnitude

}
