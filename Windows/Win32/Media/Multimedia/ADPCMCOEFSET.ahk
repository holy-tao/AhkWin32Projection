#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
class ADPCMCOEFSET extends Win32Struct {
    static sizeof => 4

    static packingSize => 2

    /**
     * @type {Integer}
     */
    iCoef1 {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    iCoef2 {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }
}
