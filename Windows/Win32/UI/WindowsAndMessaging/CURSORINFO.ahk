#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * Contains global cursor information.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-cursorinfo
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class CURSORINFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure, in bytes. The caller must set this to <c>sizeof(CURSORINFO)</c>.
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
     * Type: <b>HCURSOR</b>
     * 
     * A handle to the cursor.
     * @type {Pointer<Ptr>}
     */
    hCursor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * A   structure that receives the screen coordinates of the cursor.
     * @type {POINT}
     */
    ptScreenPos{
        get {
            if(!this.HasProp("__ptScreenPos"))
                this.__ptScreenPos := POINT(this.ptr + 16)
            return this.__ptScreenPos
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 24
    }
}
