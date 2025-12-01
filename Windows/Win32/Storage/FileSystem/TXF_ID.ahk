#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a unique identifier within the context of the Resource Manager.
 * @see https://learn.microsoft.com/windows/win32/api/txfw32/ns-txfw32-txf_id
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class TXF_ID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    LowPart {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    HighPart {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }
}
