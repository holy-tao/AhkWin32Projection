#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HrtfDistanceDecayType.ahk" { HrtfDistanceDecayType }

/**
 * Describes a distance-based decay behavior.
 * @see https://learn.microsoft.com/windows/win32/api/hrtfapoapi/ns-hrtfapoapi-hrtfdistancedecay
 * @namespace Windows.Win32.Media.Audio.XAudio2
 */
export default struct HrtfDistanceDecay {
    #StructPack 4

    /**
     * The type of decay behavior, natural or custom.
     */
    type : HrtfDistanceDecayType

    /**
     * The maximum gain limit applied at any distance. Applies to both natural and custom decay. This value is specified in dB, with a range from -96 to 12 inclusive. The default value is 12 dB.
     */
    maxGain : Float32

    /**
     * The minimum gain limit applied at any distance. Applies to both natural and custom decay. This value is specified in dB, with a range from -96 to 12 inclusive. The default value is -96 dB.
     */
    minGain : Float32

    /**
     * The distance at which the gain is 0dB. Applies to natural decay only. This value is specified in meters, with a range from 0.05 to infinity (FLT_MAX). The default value is 1 meter.
     */
    unityGainDistance : Float32

    /**
     * The distance at which output is silent. Applies to natural decay only. This value is specified in meters, with a range from zero (non-inclusive) to infinity (FLT_MAX). The default value is infinity.
     */
    cutoffDistance : Float32

}
