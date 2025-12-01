#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HCURSOR.ahk
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
     * @type {HCURSOR}
     */
    hCursor{
        get {
            if(!this.HasProp("__hCursor"))
                this.__hCursor := HCURSOR(8, this)
            return this.__hCursor
        }
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
                this.__ptScreenPos := POINT(16, this)
            return this.__ptScreenPos
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 24
    }
}
