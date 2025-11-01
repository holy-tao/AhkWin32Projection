#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores an array containing a variable number of bytes.
 * @see https://docs.microsoft.com/windows/win32/api//fwptypes/ns-fwptypes-fwp_byte_blob
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWP_BYTE_BLOB extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Number of  bytes in the array.
     * @type {Integer}
     */
    size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to the array.
     * @type {Pointer<Integer>}
     */
    data {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
