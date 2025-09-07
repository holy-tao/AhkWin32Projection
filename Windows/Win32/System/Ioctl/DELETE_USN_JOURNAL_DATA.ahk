#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information on the deletion of an update sequence number (USN) change journal using the FSCTL_DELETE_USN_JOURNAL control code.
 * @remarks
 * For more information, see 
  * <a href="https://docs.microsoft.com/windows/desktop/FileIO/creating-modifying-and-deleting-a-change-journal">Creating, Modifying, and Deleting a Change Journal</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-delete_usn_journal_data
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DELETE_USN_JOURNAL_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The identifier of the change journal to be deleted. 
     * 
     * 
     * 
     * 
     * If the journal is active and deletion is requested by setting the USN_DELETE_FLAG_DELETE flag in the <b>DeleteFlags</b> member, then this identifier must specify the change journal for the current volume. Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_query_usn_journal">FSCTL_QUERY_USN_JOURNAL</a> to retrieve the identifier of this change journal. If in this case the identifier is not for the current volume's change journal, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_delete_usn_journal">FSCTL_DELETE_USN_JOURNAL</a> fails.
     * 
     * If notification instead of deletion is requested by setting only the USN_DELETE_FLAG_NOTIFY flag in <b>DeleteFlags</b>, <b>UsnJournalID</b> is ignored.
     * @type {Integer}
     */
    UsnJournalID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    DeleteFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
