#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputForceFeedbackMagnitude.ahk" { GameInputForceFeedbackMagnitude }
#Import ".\GameInputForceFeedbackEnvelope.ahk" { GameInputForceFeedbackEnvelope }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputForceFeedbackRampParams {
    #StructPack 8

    envelope : GameInputForceFeedbackEnvelope

    startMagnitude : GameInputForceFeedbackMagnitude

    endMagnitude : GameInputForceFeedbackMagnitude

}
