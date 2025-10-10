#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the position of the tape.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-tape_get_position
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class TAPE_GET_POSITION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Partition to position within. If this member is zero, the current partition is assumed.
     * @type {Integer}
     */
    Partition {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Block address.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }
}
