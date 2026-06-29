#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HDC.ahk" { HDC }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The PAINTSTRUCT structure contains information for an application. This information can be used to paint the client area of a window owned by that application.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-paintstruct
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct PAINTSTRUCT {
    #StructPack 8

    /**
     * A handle to the display DC to be used for painting.
     */
    hdc : HDC

    /**
     * Indicates whether the background must be erased. This value is nonzero if the application should erase the background. The application is responsible for erasing the background if a window class is created without a background brush. For more information, see the description of the <b>hbrBackground</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-wndclassa">WNDCLASS</a> structure.
     */
    fErase : BOOL

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the upper left and lower right corners of the rectangle in which the painting is requested, in device units relative to the upper-left corner of the client area.
     */
    rcPaint : RECT

    /**
     * Reserved; used internally by the system.
     */
    fRestore : BOOL

    /**
     * Reserved; used internally by the system.
     */
    fIncUpdate : BOOL

    /**
     * Reserved; used internally by the system.
     */
    rgbReserved : Int8[32]

}
