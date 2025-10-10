#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the size and item count information retrieved by the SHQueryRecycleBin function.
 * @see https://docs.microsoft.com/windows/win32/api//shellapi/ns-shellapi-shqueryrbinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHQUERYRBINFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure, in bytes. This member must be filled in prior to calling the function.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>__int64</b>
     * 
     * The total size of all the objects in the specified Recycle Bin, in bytes.
     * @type {Integer}
     */
    i64Size {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * Type: <b>__int64</b>
     * 
     * The total number of items in the specified Recycle Bin.
     * @type {Integer}
     */
    i64NumItems {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
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
