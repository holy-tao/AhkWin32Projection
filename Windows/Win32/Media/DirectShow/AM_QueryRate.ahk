#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AM_QueryRate structure is used to query the decoder's maximum full-frame rate for forward and reverse playback.
 * @remarks
 * 
  * Rate is the inverse of speed. For example, if the playback speed is 2x, the rate is 1/2, so the <b>Rate</b> member is set to 5000. Reverse rates are negative.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dvdmedia/ns-dvdmedia-am_queryrate
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_QueryRate extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the maximum forward full-frame rate, as rate x 10000.
     * @type {Integer}
     */
    lMaxForwardFullFrame {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies the maximum reverse full-frame rate, as rate x 10000.
     * @type {Integer}
     */
    lMaxReverseFullFrame {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
