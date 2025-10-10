#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class USN_JOURNAL_DATA_V1 extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    UsnJournalID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    FirstUsn {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NextUsn {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    LowestValidUsn {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    MaxUsn {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    MaximumSize {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    AllocationDelta {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    MinSupportedMajorVersion {
        get => NumGet(this, 56, "ushort")
        set => NumPut("ushort", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    MaxSupportedMajorVersion {
        get => NumGet(this, 58, "ushort")
        set => NumPut("ushort", value, this, 58)
    }
}
