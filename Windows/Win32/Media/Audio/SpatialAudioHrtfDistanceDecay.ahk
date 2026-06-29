#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SpatialAudioHrtfDistanceDecayType.ahk" { SpatialAudioHrtfDistanceDecayType }

/**
 * Represents the decay model that is applied over distance from the position of an ISpatialAudioObjectForHrtf to the position of the listener.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiohrtf/ns-spatialaudiohrtf-spatialaudiohrtfdistancedecay
 * @namespace Windows.Win32.Media.Audio
 */
export default struct SpatialAudioHrtfDistanceDecay {
    #StructPack 4

    /**
     * The type of decay, natural or custom. The default value for this field is  <b>SpatialAudioHrtfDistanceDecay_NaturalDecay</b>.
     */
    Type : SpatialAudioHrtfDistanceDecayType

    MaxGain : Float32

    MinGain : Float32

    UnityGainDistance : Float32

    CutoffDistance : Float32

}
