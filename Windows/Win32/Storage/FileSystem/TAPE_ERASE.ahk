#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ERASE_TAPE_TYPE.ahk

/**
 * Describes the partition to be erased.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-tape_erase
 * @namespace Windows.Win32.Storage.FileSystem
 */
class TAPE_ERASE extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {ERASE_TAPE_TYPE}
     */
    Type {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * If this member is <b>TRUE</b>, return as soon as the erase operation begins. Otherwise, return when the operation has been completed.
     * @type {BOOLEAN}
     */
    Immediate {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }
}
