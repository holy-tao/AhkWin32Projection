#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the decay model that is applied over distance from the position of an ISpatialAudioObjectForHrtf to the position of the listener.
 * @see https://docs.microsoft.com/windows/win32/api//spatialaudiohrtf/ns-spatialaudiohrtf-spatialaudiohrtfdistancedecay
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class SpatialAudioHrtfDistanceDecay extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The type of decay, natural or custom. The default value for this field is  <b>SpatialAudioHrtfDistanceDecay_NaturalDecay</b>.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * 
     * @type {Float}
     */
    MaxGain {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * 
     * @type {Float}
     */
    MinGain {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * 
     * @type {Float}
     */
    UnityGainDistance {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * 
     * @type {Float}
     */
    CutoffDistance {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }
}
