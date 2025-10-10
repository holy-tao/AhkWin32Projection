#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AM_ExactRateChange structure is not supported. Use AM_SimpleRateChange.
 * @see https://docs.microsoft.com/windows/win32/api//dvdmedia/ns-dvdmedia-am_exactratechange
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_ExactRateChange extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Reserved.
     * @type {Integer}
     */
    OutputZeroTime {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Rate {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
