#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * Contains status information for the application-switching (ALT+TAB) window.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-alttabinfo
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class ALTTABINFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of the structure. The caller must set this to <c>sizeof(ALTTABINFO)</c>.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>int</b>
     * 
     * The number of items in the window.
     * @type {Integer}
     */
    cItems {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>int</b>
     * 
     * The number of columns in the window.
     * @type {Integer}
     */
    cColumns {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b>int</b>
     * 
     * The number of rows in the window.
     * @type {Integer}
     */
    cRows {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b>int</b>
     * 
     * The column of the item that has the focus.
     * @type {Integer}
     */
    iColFocus {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b>int</b>
     * 
     * The row of the item that has the focus.
     * @type {Integer}
     */
    iRowFocus {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: <b>int</b>
     * 
     * The width of each icon in the application-switching window.
     * @type {Integer}
     */
    cxItem {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b>int</b>
     * 
     * The height of each icon in the application-switching window.
     * @type {Integer}
     */
    cyItem {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a></b>
     * 
     * The top-left corner of the first icon.
     * @type {POINT}
     */
    ptStart{
        get {
            if(!this.HasProp("__ptStart"))
                this.__ptStart := POINT(32, this)
            return this.__ptStart
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 40
    }
}
