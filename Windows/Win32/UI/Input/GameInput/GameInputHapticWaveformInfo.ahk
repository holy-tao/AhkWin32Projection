#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputUsage.ahk" { GameInputUsage }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputHapticWaveformInfo {
    #StructPack 8

    usage : GameInputUsage

    isDurationSupported : Int8

    isIntensitySupported : Int8

    isRepeatSupported : Int8

    isRepeatDelaySupported : Int8

    defaultDuration : Int64

}
