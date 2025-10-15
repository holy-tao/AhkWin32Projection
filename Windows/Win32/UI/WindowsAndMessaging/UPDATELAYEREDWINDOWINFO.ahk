#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Gdi\HDC.ahk
#Include ..\..\Foundation\COLORREF.ahk

/**
 * Used by UpdateLayeredWindowIndirect to provide position, size, shape, content, and translucency information for a layered window.
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-updatelayeredwindowinfo
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class UPDATELAYEREDWINDOWINFO extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>HDC</b>
     * 
     * A handle to a DC for the screen. This handle is obtained by specifying <b>NULL</b> in this member when calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms633557(v=vs.85)">UpdateLayeredWindowIndirect</a>. The handle is used for palette color matching when the window contents are updated. If <b>hdcDst</b> is <b>NULL</b>, the default palette is used.
     * 
     *                     
     * 
     * If <b>hdcSrc</b> is <b>NULL</b>, <b>hdcDst</b> must be <b>NULL</b>.
     * @type {HDC}
     */
    hdcDst{
        get {
            if(!this.HasProp("__hdcDst"))
                this.__hdcDst := HDC(this.ptr + 8)
            return this.__hdcDst
        }
    }

    /**
     * Type: <b>const <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a>*</b>
     * 
     * The new screen position of the layered window. If the new position is unchanged from the current position, <b>pptDst</b> can be <b>NULL</b>.
     * @type {Pointer<POINT>}
     */
    pptDst {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>const <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a>*</b>
     * 
     * The new size of the layered window. If the size of the window will not change, this parameter can be <b>NULL</b>. If <b>hdcSrc</b> is <b>NULL</b>, <b>psize</b> must be <b>NULL</b>.
     * @type {Pointer<SIZE>}
     */
    psize {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>HDC</b>
     * 
     * A handle to the DC for the surface that defines the layered window. This handle can be obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createcompatibledc">CreateCompatibleDC</a> function. If the shape and visual context of the window will not change, <b>hdcSrc</b> can be <b>NULL</b>.
     * @type {HDC}
     */
    hdcSrc{
        get {
            if(!this.HasProp("__hdcSrc"))
                this.__hdcSrc := HDC(this.ptr + 32)
            return this.__hdcSrc
        }
    }

    /**
     * Type: <b>const <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a>*</b>
     * 
     * The location of the layer in the device context. If <b>hdcSrc</b> is <b>NULL</b>, <b>pptSrc</b> should be <b>NULL</b>.
     * @type {Pointer<POINT>}
     */
    pptSrc {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a></b>
     * 
     * The color key to be used when composing the layered window. To generate a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a>, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     * @type {COLORREF}
     */
    crKey{
        get {
            if(!this.HasProp("__crKey"))
                this.__crKey := COLORREF(this.ptr + 48)
            return this.__crKey
        }
    }

    /**
     * Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-blendfunction">BLENDFUNCTION</a>*</b>
     * 
     * The transparency value to be used when composing the layered window.
     * @type {Pointer<BLENDFUNCTION>}
     */
    pblend {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * The area to be updated. This parameter can be <b>NULL</b>. If it is non-NULL, only the area in this rectangle is updated from the source DC.
     * @type {Pointer<RECT>}
     */
    prcDirty {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 80
    }
}
