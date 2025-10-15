#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HDC.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * The PAINTSTRUCT structure contains information for an application. This information can be used to paint the client area of a window owned by that application.
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-paintstruct
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class PAINTSTRUCT extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * A handle to the display DC to be used for painting.
     * @type {HDC}
     */
    hdc{
        get {
            if(!this.HasProp("__hdc"))
                this.__hdc := HDC(this.ptr + 0)
            return this.__hdc
        }
    }

    /**
     * Indicates whether the background must be erased. This value is nonzero if the application should erase the background. The application is responsible for erasing the background if a window class is created without a background brush. For more information, see the description of the <b>hbrBackground</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-wndclassa">WNDCLASS</a> structure.
     * @type {BOOL}
     */
    fErase{
        get {
            if(!this.HasProp("__fErase"))
                this.__fErase := BOOL(this.ptr + 8)
            return this.__fErase
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the upper left and lower right corners of the rectangle in which the painting is requested, in device units relative to the upper-left corner of the client area.
     * @type {RECT}
     */
    rcPaint{
        get {
            if(!this.HasProp("__rcPaint"))
                this.__rcPaint := RECT(this.ptr + 16)
            return this.__rcPaint
        }
    }

    /**
     * Reserved; used internally by the system.
     * @type {BOOL}
     */
    fRestore{
        get {
            if(!this.HasProp("__fRestore"))
                this.__fRestore := BOOL(this.ptr + 32)
            return this.__fRestore
        }
    }

    /**
     * Reserved; used internally by the system.
     * @type {BOOL}
     */
    fIncUpdate{
        get {
            if(!this.HasProp("__fIncUpdate"))
                this.__fIncUpdate := BOOL(this.ptr + 36)
            return this.__fIncUpdate
        }
    }

    /**
     * Reserved; used internally by the system.
     * @type {Array<Byte>}
     */
    rgbReserved{
        get {
            if(!this.HasProp("__rgbReservedProxyArray"))
                this.__rgbReservedProxyArray := Win32FixedArray(this.ptr + 40, 32, Primitive, "char")
            return this.__rgbReservedProxyArray
        }
    }
}
