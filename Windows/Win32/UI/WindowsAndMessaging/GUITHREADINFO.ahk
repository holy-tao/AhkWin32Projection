#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Contains information about a GUI thread.
 * @remarks
 * This structure is used with the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getguithreadinfo">GetGUIThreadInfo</a> function to retrieve information about the active window or a specified GUI thread.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-guithreadinfo
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class GUITHREADINFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of this structure, in bytes. The caller must set this member to <c>sizeof(GUITHREADINFO)</c>.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the active window within the thread.
     * @type {Pointer<Ptr>}
     */
    hwndActive {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window that has the keyboard focus.
     * @type {Pointer<Ptr>}
     */
    hwndFocus {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window that has captured the mouse.
     * @type {Pointer<Ptr>}
     */
    hwndCapture {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window that owns any active menus.
     * @type {Pointer<Ptr>}
     */
    hwndMenuOwner {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window in a move or size loop.
     * @type {Pointer<Ptr>}
     */
    hwndMoveSize {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window that is displaying the caret.
     * @type {Pointer<Ptr>}
     */
    hwndCaret {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * The caret's bounding rectangle, in client coordinates, relative to the window specified by the <b>hwndCaret</b> member.
     * @type {RECT}
     */
    rcCaret{
        get {
            if(!this.HasProp("__rcCaret"))
                this.__rcCaret := RECT(this.ptr + 56)
            return this.__rcCaret
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 72
    }
}
