#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINTL.ahk

/**
 * Receives information about a band object. This structure is used with the deprecated IDeskBand::GetBandInfo method.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-deskbandinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DESKBANDINFO extends Win32Struct
{
    static sizeof => 560

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwMask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a> structure that receives the minimum size of the band object. The minimum width is given in the <b>POINTL</b> structure's <b>x</b> member and the minimum height is given in the <b>y</b> member.
     * @type {POINTL}
     */
    ptMinSize{
        get {
            if(!this.HasProp("__ptMinSize"))
                this.__ptMinSize := POINTL(8, this)
            return this.__ptMinSize
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a> structure that receives the maximum size of the band object. The maximum height is given in the <b>POINTL</b> structure's <b>y</b> member and the <b>x</b> member is ignored. If the band object has no limit for its maximum height, (LONG)-1 should be used.
     * @type {POINTL}
     */
    ptMaxSize{
        get {
            if(!this.HasProp("__ptMaxSize"))
                this.__ptMaxSize := POINTL(16, this)
            return this.__ptMaxSize
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a> structure that receives the sizing step value (increment) in which the band object is resized. The vertical step value is given in the <b>POINTL</b> structure's <b>y</b> member and the <b>x</b> member is ignored.
     * 
     * The <b>dwModeFlags</b> member must contain the DBIMF_VARIABLEHEIGHT flag; otherwise, <b>ptIntegral</b> is ignored.
     * @type {POINTL}
     */
    ptIntegral{
        get {
            if(!this.HasProp("__ptIntegral"))
                this.__ptIntegral := POINTL(24, this)
            return this.__ptIntegral
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a> structure that receives the ideal size of the band object. The ideal width is given in the <b>POINTL</b> structure's <b>x</b> member and the ideal height is given in the <b>y</b> member. The band container attempts to use these values, but the band is not guaranteed to be this size.
     * @type {POINTL}
     */
    ptActual{
        get {
            if(!this.HasProp("__ptActual"))
                this.__ptActual := POINTL(32, this)
            return this.__ptActual
        }
    }

    /**
     * Type: <b>WCHAR[256]</b>
     * 
     * A <b>WCHAR</b> buffer that receives the title of the band.
     * @type {String}
     */
    wszTitle {
        get => StrGet(this.ptr + 40, 255, "UTF-16")
        set => StrPut(value, this.ptr + 40, 255, "UTF-16")
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwModeFlags {
        get => NumGet(this, 552, "uint")
        set => NumPut("uint", value, this, 552)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> structure that receives the background color of the band. The <b>dwModeFlags</b> member must contain the <b>DBIMF_BKCOLOR</b> flag; otherwise, <b>crBkgnd</b> is ignored.
     * @type {COLORREF}
     */
    crBkgnd {
        get => NumGet(this, 556, "uint")
        set => NumPut("uint", value, this, 556)
    }
}
