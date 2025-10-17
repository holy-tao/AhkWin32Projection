#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Contains window information.
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-windowinfo
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class WINDOWINFO extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure, in bytes. The caller must set this member to <c>sizeof(WINDOWINFO)</c>.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * The coordinates of the window.
     * @type {RECT}
     */
    rcWindow{
        get {
            if(!this.HasProp("__rcWindow"))
                this.__rcWindow := RECT(8, this)
            return this.__rcWindow
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * The coordinates of the client area.
     * @type {RECT}
     */
    rcClient{
        get {
            if(!this.HasProp("__rcClient"))
                this.__rcClient := RECT(24, this)
            return this.__rcClient
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The window styles. For a table of window styles, see <a href="https://docs.microsoft.com/windows/desktop/winmsg/window-styles">Window Styles</a>.
     * @type {Integer}
     */
    dwStyle {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The extended window styles. For a table of extended window styles, see <a href="https://docs.microsoft.com/windows/desktop/winmsg/extended-window-styles">Extended Window Styles</a>.
     * @type {Integer}
     */
    dwExStyle {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The window status. If this member is <b>WS_ACTIVECAPTION</b> (0x0001), the window is active. Otherwise, this member is zero.
     * @type {Integer}
     */
    dwWindowStatus {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The width of the window border, in pixels.
     * @type {Integer}
     */
    cxWindowBorders {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The height of the window border, in pixels.
     * @type {Integer}
     */
    cyWindowBorders {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: <b>ATOM</b>
     * 
     * The window class atom (see <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerclassa">RegisterClass</a>).
     * @type {Integer}
     */
    atomWindowType {
        get => NumGet(this, 60, "ushort")
        set => NumPut("ushort", value, this, 60)
    }

    /**
     * Type: <b>WORD</b>
     * 
     * The Windows version of the application that created the window.
     * @type {Integer}
     */
    wCreatorVersion {
        get => NumGet(this, 62, "ushort")
        set => NumPut("ushort", value, this, 62)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 64
    }
}
