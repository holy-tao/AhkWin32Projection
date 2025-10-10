#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a band site. This structure is used with the IBandSite::GetBandSiteInfo and IBandSite::SetBandSiteInfo methods.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ns-shobjidl_core-bandsiteinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class BANDSITEINFO extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The mask values that determine the other fields in this structure that are being requested or set.
     * @type {Integer}
     */
    dwMask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Bits that specify the state of the band.
     * @type {Integer}
     */
    dwState {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Bit flags that specify the style of the band.
     * @type {Integer}
     */
    dwStyle {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
