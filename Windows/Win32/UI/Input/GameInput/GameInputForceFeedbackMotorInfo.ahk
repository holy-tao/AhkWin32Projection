#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputLocation.ahk" { GameInputLocation }
#Import ".\GameInputFeedbackAxes.ahk" { GameInputFeedbackAxes }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputForceFeedbackMotorInfo {
    #StructPack 4

    supportedAxes : GameInputFeedbackAxes

    location : GameInputLocation

    locationId : UInt32

    maxSimultaneousEffects : UInt32

    isConstantEffectSupported : Int8

    isRampEffectSupported : Int8

    isSineWaveEffectSupported : Int8

    isSquareWaveEffectSupported : Int8

    isTriangleWaveEffectSupported : Int8

    isSawtoothUpWaveEffectSupported : Int8

    isSawtoothDownWaveEffectSupported : Int8

    isSpringEffectSupported : Int8

    isFrictionEffectSupported : Int8

    isDamperEffectSupported : Int8

    isInertiaEffectSupported : Int8

}
