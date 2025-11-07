#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies an offset as a fixed-point real number.
 * @remarks
 * 
 * The value of the number is <b>value</b> + (<b>fract</b> / 65536.0f).
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/ns-mfobjects-mfoffset
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFOffset extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * The fractional part of the number.
     * @type {Integer}
     */
    fract {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The integer part of the number.
     * @type {Integer}
     */
    value {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }
}
