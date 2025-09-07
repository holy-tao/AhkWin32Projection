#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the type and number of tapemarks to write.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-tape_write_marks
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class TAPE_WRITE_MARKS extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of tapemarks to write.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * If this member is <b>TRUE</b>, return as soon as the operation begins. Otherwise, return after the operation has completed.
     * @type {Integer}
     */
    Immediate {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }
}
