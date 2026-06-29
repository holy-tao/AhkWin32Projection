#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputLocation.ahk" { GameInputLocation }
#Import ".\GameInputRumbleMotors.ahk" { GameInputRumbleMotors }
#Import ".\GameInputHapticWaveformInfo.ahk" { GameInputHapticWaveformInfo }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputHapticFeedbackMotorInfo {
    #StructPack 8

    mappedRumbleMotors : GameInputRumbleMotors

    location : GameInputLocation

    locationId : UInt32

    waveformCount : UInt32

    waveformInfo : GameInputHapticWaveformInfo.Ptr

}
