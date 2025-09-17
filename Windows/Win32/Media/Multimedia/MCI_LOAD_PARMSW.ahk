#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 * @charset Unicode
 */
class MCI_LOAD_PARMSW extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    dwCallback {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<Char>}
     */
    lpfilename {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
