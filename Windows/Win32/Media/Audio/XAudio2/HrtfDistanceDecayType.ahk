#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates a distance-based decay type applied to a sound.
 * @see https://docs.microsoft.com/windows/win32/api//hrtfapoapi/ne-hrtfapoapi-hrtfdistancedecaytype
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class HrtfDistanceDecayType{

    /**
     * Simulates natural decay with distance, as constrained by minimum and maximum gain distance limits. Drops to silence at rolloff distance.
     * @type {Integer (Int32)}
     */
    static NaturalDecay => 0

    /**
     * Used to set up a custom gain curve, within the maximum and minimum gain limit.
     * @type {Integer (Int32)}
     */
    static CustomDecay => 1
}
