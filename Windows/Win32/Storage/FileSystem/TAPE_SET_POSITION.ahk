#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes how and where to position the tape.
 * @remarks
 * 
  * If the positioning is relative, a positive offset moves the tape forward (toward the end of the tape) and a negative offset moves the tape backward (toward the beginning of the tape).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-tape_set_position
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class TAPE_SET_POSITION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    Method {
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
     * Block address or count for the position operation specified by the <b>Method</b> member.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * If this member is <b>TRUE</b>, return as soon as the operation begins. Otherwise, return after the operation has completed.
     * @type {BOOLEAN}
     */
    Immediate {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }
}
