#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class CDROM_SEEK_AUDIO_MSF extends Win32Struct
{
    static sizeof => 3

    static packingSize => 1

    /**
     * @type {Integer}
     */
    M {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    S {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    F {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }
}
