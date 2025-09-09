#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the clipboard format definition for CFSTR_FILE_ATTRIBUTES_ARRAY.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-file_attributes_array
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class FILE_ATTRIBUTES_ARRAY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * Type: <b>UINT</b>
     * 
     * The number of items in the <b>rgdwFileAttributes</b> array.
     * @type {Integer}
     */
    cItems {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * All of the attributes combined using OR.
     * @type {Integer}
     */
    dwSumFileAttributes {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * All of the attributes combined using AND.
     * @type {Integer}
     */
    dwProductFileAttributes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>DWORD[1]</b>
     * 
     * An array of file attributes.
     * @type {Array<UInt32>}
     */
    rgdwFileAttributes{
        get {
            if(!this.HasProp("__rgdwFileAttributesProxyArray"))
                this.__rgdwFileAttributesProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "uint")
            return this.__rgdwFileAttributesProxyArray
        }
    }
}
