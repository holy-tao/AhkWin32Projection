#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that describes an update sequence number (USN) change journal.
 * @remarks
 * 
 * For more information, see 
 *     <a href="https://docs.microsoft.com/windows/desktop/FileIO/creating-modifying-and-deleting-a-change-journal">Creating, Modifying, and Deleting a Change Journal</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-create_usn_journal_data
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class CREATE_USN_JOURNAL_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The target maximum size that the NTFS file system allocates for the change journal, in bytes.
     * 
     * The change journal can grow larger than this value, but it is then truncated at the next NTFS file system 
     *        checkpoint to less than this value.
     * @type {Integer}
     */
    MaximumSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of memory allocation that is added to the end and removed from the beginning of the change journal, in bytes.
     * 
     * The change journal can grow to more than the sum of the values of <b>MaximumSize</b> and 
     *        <b>AllocationDelta</b> before being trimmed.
     * @type {Integer}
     */
    AllocationDelta {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
