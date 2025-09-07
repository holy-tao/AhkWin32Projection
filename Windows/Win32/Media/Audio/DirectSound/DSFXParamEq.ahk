#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class DSFXParamEq extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Float}
     */
    fCenter {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * @type {Float}
     */
    fBandwidth {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * @type {Float}
     */
    fGain {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }
}
