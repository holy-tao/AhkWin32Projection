#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class DMUS_WAVES_REVERB_PARAMS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Float}
     */
    fInGain {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * @type {Float}
     */
    fReverbMix {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * @type {Float}
     */
    fReverbTime {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * @type {Float}
     */
    fHighFreqRTRatio {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}
