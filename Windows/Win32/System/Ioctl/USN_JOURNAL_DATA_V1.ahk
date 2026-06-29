#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an update sequence number (USN) change journal, its records, and its capacity.U
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-usn_journal_data_v1
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct USN_JOURNAL_DATA_V1 {
    #StructPack 8

    /**
     * The current journal identifier. A journal is assigned a new identifier on creation and can be stamped with 
     *       a new identifier in the course of its existence. The NTFS file system uses this identifier for an integrity 
     *       check.
     */
    UsnJournalID : Int64

    /**
     * The number of first record that can be read from the journal.
     */
    FirstUsn : Int64

    /**
     * The number of next record to be written to the journal.
     */
    NextUsn : Int64

    /**
     * The first record that was written into the journal for this journal instance. Enumerating the files or 
     *       directories on a volume can return a USN lower than this value (in other words, a 
     *       <b>FirstUsn</b> member value less than the <b>LowestValidUsn</b> member 
     *       value). If it does, the journal has been stamped with a new identifier since the last USN was written. In this 
     *       case, <b>LowestValidUsn</b> may indicate a discontinuity in the journal, in which changes to 
     *       some or all files or directories on the volume may have occurred that are not recorded in the change 
     *       journal.
     */
    LowestValidUsn : Int64

    /**
     * The largest USN that the change journal supports. An administrator must delete the change journal as the 
     *       value of <b>NextUsn</b> approaches this value.
     */
    MaxUsn : Int64

    /**
     * The target maximum size for the change journal, in bytes. The change journal can grow larger than this 
     *       value, but it is then truncated at the next NTFS file system checkpoint to less than this value.
     */
    MaximumSize : Int64

    /**
     * The number of bytes of disk memory added to the end and removed from the beginning of the change journal 
     *       each time memory is allocated or deallocated. In other words, allocation and deallocation take place in units of 
     *       this size. An integer multiple of a cluster size is a reasonable value for this member.
     */
    AllocationDelta : Int64

    MinSupportedMajorVersion : UInt16

    MaxSupportedMajorVersion : UInt16

}
