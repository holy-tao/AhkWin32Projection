#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an update sequence number (USN) change journal, its records, and its capacity.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-usn_journal_data_v0
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class USN_JOURNAL_DATA_V0 extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The current journal identifier. A journal is assigned a new identifier on creation and can be stamped with 
     *       a new identifier in the course of its existence. The NTFS file system uses this identifier for an integrity 
     *       check.
     * @type {Integer}
     */
    UsnJournalID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of first record that can be read from the journal.
     * @type {Integer}
     */
    FirstUsn {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * The number of next record to be written to the journal.
     * @type {Integer}
     */
    NextUsn {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * The first record that was written into the journal for this journal instance. Enumerating the files or 
     *       directories on a volume can return a USN lower than this value (in other words, a 
     *       <b>FirstUsn</b> member value less than the <b>LowestValidUsn</b> member 
     *       value). If it does, the journal has been stamped with a new identifier since the last USN was written. In this 
     *       case, <b>LowestValidUsn</b> may indicate a discontinuity in the journal, in which changes to 
     *       some or all files or directories on the volume may have occurred that are not recorded in the change 
     *       journal.
     * @type {Integer}
     */
    LowestValidUsn {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * The largest USN that the change journal supports. An administrator must delete the change journal as the 
     *       value of <b>NextUsn</b> approaches this value.
     * @type {Integer}
     */
    MaxUsn {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * The target maximum size for the change journal, in bytes. The change journal can grow larger than this 
     *       value, but it is then truncated at the next NTFS file system checkpoint to less than this value.
     * @type {Integer}
     */
    MaximumSize {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The number of bytes of disk memory added to the end and removed from the beginning of the change journal 
     *       each time memory is allocated or deallocated. In other words, allocation and deallocation take place in units of 
     *       this size. An integer multiple of a cluster size is a reasonable value for this member.
     * @type {Integer}
     */
    AllocationDelta {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
