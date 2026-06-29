#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINTL.ahk" { POINTL }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Receives information about a band object. This structure is used with the deprecated IDeskBand::GetBandInfo method.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-deskbandinfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct DESKBANDINFO {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     */
    dwMask : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a> structure that receives the minimum size of the band object. The minimum width is given in the <b>POINTL</b> structure's <b>x</b> member and the minimum height is given in the <b>y</b> member.
     */
    ptMinSize : POINTL

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a> structure that receives the maximum size of the band object. The maximum height is given in the <b>POINTL</b> structure's <b>y</b> member and the <b>x</b> member is ignored. If the band object has no limit for its maximum height, (LONG)-1 should be used.
     */
    ptMaxSize : POINTL

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a> structure that receives the sizing step value (increment) in which the band object is resized. The vertical step value is given in the <b>POINTL</b> structure's <b>y</b> member and the <b>x</b> member is ignored.
     * 
     * The <b>dwModeFlags</b> member must contain the DBIMF_VARIABLEHEIGHT flag; otherwise, <b>ptIntegral</b> is ignored.
     */
    ptIntegral : POINTL

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-pointl">POINTL</a> structure that receives the ideal size of the band object. The ideal width is given in the <b>POINTL</b> structure's <b>x</b> member and the ideal height is given in the <b>y</b> member. The band container attempts to use these values, but the band is not guaranteed to be this size.
     */
    ptActual : POINTL

    /**
     * Type: <b>WCHAR[256]</b>
     * 
     * A <b>WCHAR</b> buffer that receives the title of the band.
     */
    wszTitle : WCHAR[256]

    /**
     * Type: <b>DWORD</b>
     */
    dwModeFlags : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> structure that receives the background color of the band. The <b>dwModeFlags</b> member must contain the <b>DBIMF_BKCOLOR</b> flag; otherwise, <b>crBkgnd</b> is ignored.
     */
    crBkgnd : COLORREF

}
