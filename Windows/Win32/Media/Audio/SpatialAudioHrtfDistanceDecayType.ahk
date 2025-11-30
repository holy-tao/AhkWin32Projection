#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of decay applied over distance from the position of an ISpatialAudioObjectForHrtf to the position of the listener.
 * @see https://docs.microsoft.com/windows/win32/api//spatialaudiohrtf/ne-spatialaudiohrtf-spatialaudiohrtfdistancedecaytype
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class SpatialAudioHrtfDistanceDecayType extends Win32Enum{

    /**
     * A natural decay  over distance, as constrained by minimum and maximum gain distance limits. The output drops to silent at the distance specified by <a href="https://docs.microsoft.com/windows/desktop/api/spatialaudiohrtf/ns-spatialaudiohrtf-spatialaudiohrtfdistancedecay">SpatialAudioHrtfDistanceDecay.CutoffDistance</a>.
     * @type {Integer (Int32)}
     */
    static SpatialAudioHrtfDistanceDecay_NaturalDecay => 0

    /**
     * A custom gain curve, within the maximum and minimum gain limit.
     * @type {Integer (Int32)}
     */
    static SpatialAudioHrtfDistanceDecay_CustomDecay => 1
}
