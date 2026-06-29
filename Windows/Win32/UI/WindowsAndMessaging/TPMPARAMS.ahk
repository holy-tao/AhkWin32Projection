#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Contains extended parameters for the TrackPopupMenuEx function.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-tpmparams
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct TPMPARAMS {
    #StructPack 4

    /**
     * Type: <b>UINT</b>
     * 
     * The size of structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * The rectangle to be excluded when positioning the window, in screen coordinates.
     */
    rcExclude : RECT

}
