#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of decay applied over distance from the position of an ISpatialAudioObjectForHrtf to the position of the listener.
 * @see https://learn.microsoft.com/windows/win32/api/spatialaudiohrtf/ne-spatialaudiohrtf-spatialaudiohrtfdistancedecaytype
 * @namespace Windows.Win32.Media.Audio
 */
export default struct SpatialAudioHrtfDistanceDecayType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
