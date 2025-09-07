#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AM_WST_PAGE structure identifies a World Standard Teletext (WST) page.
 * @see https://learn.microsoft.com/windows/win32/api/iwstdec/ns-iwstdec-am_wst_page
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_WST_PAGE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The page number.
     * @type {Integer}
     */
    dwPageNr {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The sub-page number.
     * @type {Integer}
     */
    dwSubPageNr {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to the page data.
     * @type {Pointer<Byte>}
     */
    pucPageData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
