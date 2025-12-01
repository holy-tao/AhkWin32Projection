#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * Contains information about an item for which context-sensitive help has been requested.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-helpinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class HELPINFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>UINT</b>
     * 
     * The structure size, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>int</b>
     * @type {Integer}
     */
    iContextType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>int</b>
     * 
     * The identifier of the window or control if <b>iContextType</b> is <b>HELPINFO_WINDOW</b>, or identifier of the menu item if <b>iContextType</b> is <b>HELPINFO_MENUITEM</b>.
     * @type {Integer}
     */
    iCtrlId {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b>HANDLE</b>
     * 
     * The identifier of the child window or control if <b>iContextType</b> is <b>HELPINFO_WINDOW</b>, or identifier of the associated menu if <b>iContextType</b> is <b>HELPINFO_MENUITEM</b>.
     * @type {HANDLE}
     */
    hItemHandle{
        get {
            if(!this.HasProp("__hItemHandle"))
                this.__hItemHandle := HANDLE(16, this)
            return this.__hItemHandle
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The help context identifier of the window or control.
     * @type {Pointer}
     */
    dwContextId {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure that contains the screen coordinates of the mouse cursor. This is useful for providing help based on the position of the mouse cursor.
     * @type {POINT}
     */
    MousePos{
        get {
            if(!this.HasProp("__MousePos"))
                this.__MousePos := POINT(32, this)
            return this.__MousePos
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 40
    }
}
