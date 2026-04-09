#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\AM_DVD_YUV.ahk

/**
 * Specifies the DVD subpicture palette.
 * @remarks
 * The AM_PROPERTY_DVDSUBPIC_PALETTE property uses this structure.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ns-dvdmedia-am_property_sppal
 * @namespace Windows.Win32.Media.DirectShow
 */
class AM_PROPERTY_SPPAL extends Win32Struct {
    static sizeof => 64

    static packingSize => 1

    /**
     * Array of 16 YUV elements that correspond to the 4-bit color numbers requested within the subpicture command stream. The YUV elements are of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvdmedia/ns-dvdmedia-am_dvd_yuv">AM_DVD_YUV</a>.
     * @type {AM_DVD_YUV}
     */
    sppal {
        get {
            if(!this.HasProp("__sppalProxyArray"))
                this.__sppalProxyArray := Win32FixedArray(this.ptr + 0, 16, AM_DVD_YUV, "")
            return this.__sppalProxyArray
        }
    }
}
