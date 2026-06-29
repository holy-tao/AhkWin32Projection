#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information about a locked transaction.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-txfs_list_transaction_locked_files_entry
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct TXFS_LIST_TRANSACTION_LOCKED_FILES_ENTRY {
    #StructPack 8

    /**
     * The offset, in bytes, from the beginning of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-txfs_list_transaction_locked_files">TXFS_LIST_TRANSACTION_LOCKED_FILES</a> 
     *       structure to the next 
     *       <b>TXFS_LIST_TRANSACTION_LOCKED_FILES_ENTRY</b>.
     */
    Offset : Int64

    /**
     * Indicates whether the current name was deleted or created in the current transaction. Note that both flags 
     *       may appear if the name was both created and deleted in the same transaction.  In that case, the 
     *       <b>FileName</b> member will contain only an empty string with a terminating null character 
     *       ("\0") because there is no meaningful name to report.
     */
    NameFlags : UInt32

    /**
     * The NTFS File ID of the file.
     */
    FileId : Int64

    /**
     * Reserved. Specify zero.
     */
    Reserved1 : UInt32

    /**
     * Reserved. Specify zero.
     */
    Reserved2 : UInt32

    /**
     * Reserved. Specify zero.
     */
    Reserved3 : Int64

    /**
     * The path to the file, relative to the volume root. The file name is a NULL-terminated Unicode string.
     */
    FileName : WCHAR[1]

}
