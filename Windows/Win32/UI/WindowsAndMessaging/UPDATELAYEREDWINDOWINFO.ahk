#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Gdi\BLENDFUNCTION.ahk" { BLENDFUNCTION }
#Import ".\UPDATE_LAYERED_WINDOW_FLAGS.ahk" { UPDATE_LAYERED_WINDOW_FLAGS }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Graphics\Gdi\HDC.ahk" { HDC }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * Used by UpdateLayeredWindowIndirect to provide position, size, shape, content, and translucency information for a layered window.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-updatelayeredwindowinfo
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct UPDATELAYEREDWINDOWINFO {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>HDC</b>
     * 
     * A handle to a DC for the screen. This handle is obtained by specifying <b>NULL</b> in this member when calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms633557(v=vs.85)">UpdateLayeredWindowIndirect</a>. The handle is used for palette color matching when the window contents are updated. If <b>hdcDst</b> is <b>NULL</b>, the default palette is used.
     * 
     *                     
     * 
     * If <b>hdcSrc</b> is <b>NULL</b>, <b>hdcDst</b> must be <b>NULL</b>.
     */
    hdcDst : HDC

    /**
     * Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a>*</b>
     * 
     * The new screen position of the layered window. If the new position is unchanged from the current position, <b>pptDst</b> can be <b>NULL</b>.
     */
    pptDst : POINT.Ptr

    /**
     * Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-size">SIZE</a>*</b>
     * 
     * The new size of the layered window. If the size of the window will not change, this parameter can be <b>NULL</b>. If <b>hdcSrc</b> is <b>NULL</b>, <b>psize</b> must be <b>NULL</b>.
     */
    psize : SIZE.Ptr

    /**
     * Type: <b>HDC</b>
     * 
     * A handle to the DC for the surface that defines the layered window. This handle can be obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createcompatibledc">CreateCompatibleDC</a> function. If the shape and visual context of the window will not change, <b>hdcSrc</b> can be <b>NULL</b>.
     */
    hdcSrc : HDC

    /**
     * Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a>*</b>
     * 
     * The location of the layer in the device context. If <b>hdcSrc</b> is <b>NULL</b>, <b>pptSrc</b> should be <b>NULL</b>.
     */
    pptSrc : POINT.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * The color key to be used when composing the layered window. To generate a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a>, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     */
    crKey : COLORREF

    /**
     * Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-blendfunction">BLENDFUNCTION</a>*</b>
     * 
     * The transparency value to be used when composing the layered window.
     */
    pblend : BLENDFUNCTION.Ptr

    /**
     * Type: <b>DWORD</b>
     */
    dwFlags : UPDATE_LAYERED_WINDOW_FLAGS

    /**
     * Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * The area to be updated. This parameter can be <b>NULL</b>. If it is non-NULL, only the area in this rectangle is updated from the source DC.
     */
    prcDirty : RECT.Ptr

}
