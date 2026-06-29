#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputForceFeedbackMagnitude.ahk" { GameInputForceFeedbackMagnitude }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputForceFeedbackConditionParams {
    #StructPack 4

    magnitude : GameInputForceFeedbackMagnitude

    positiveCoefficient : Float32

    negativeCoefficient : Float32

    maxPositiveMagnitude : Float32

    maxNegativeMagnitude : Float32

    deadZone : Float32

    bias : Float32

}
