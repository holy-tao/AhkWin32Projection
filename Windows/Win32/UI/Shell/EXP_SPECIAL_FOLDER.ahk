#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Holds an extra data block used by IShellLinkDataList. It holds special folder information.
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/ns-shlobj_core-exp_special_folder
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class EXP_SPECIAL_FOLDER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the <b>EXP_SPECIAL_FOLDER</b> structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The structure's signature. It should be set to EXP_SPECIAL_FOLDER_SIG.
     * @type {Integer}
     */
    dwSignature {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The ID of the special folder that the link points into.
     * @type {Integer}
     */
    idSpecialFolder {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The offset into the saved PIDL.
     * @type {Integer}
     */
    cbOffset {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 16
    }
}
