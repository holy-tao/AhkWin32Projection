#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Serves as the header for some of the extra data structures used by IShellLinkDataList.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-datablock_header
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DATABLOCK_HEADER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the extra data block.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * A signature that identifies the type of data block that follows the header.
     * @type {Integer}
     */
    dwSignature {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 8
    }
}
