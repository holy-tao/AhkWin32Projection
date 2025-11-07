#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains DVD YUV subpicture data.
 * @remarks
 * 
 * This structure is contained within the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvdmedia/ns-dvdmedia-am_property_sppal">AM_PROPERTY_SPPAL</a> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dvdmedia/ns-dvdmedia-am_dvd_yuv
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_DVD_YUV extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Y color data.
     * @type {Integer}
     */
    Y {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * U color data.
     * @type {Integer}
     */
    U {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * V color data.
     * @type {Integer}
     */
    V {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }
}
