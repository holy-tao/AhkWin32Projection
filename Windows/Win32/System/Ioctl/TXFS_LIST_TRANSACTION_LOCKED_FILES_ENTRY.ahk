#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a locked transaction.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-txfs_list_transaction_locked_files_entry
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class TXFS_LIST_TRANSACTION_LOCKED_FILES_ENTRY extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The offset, in bytes, from the beginning of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-txfs_list_transaction_locked_files">TXFS_LIST_TRANSACTION_LOCKED_FILES</a> 
     *       structure to the next 
     *       <b>TXFS_LIST_TRANSACTION_LOCKED_FILES_ENTRY</b>.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates whether the current name was deleted or created in the current transaction. Note that both flags 
     *       may appear if the name was both created and deleted in the same transaction.  In that case, the 
     *       <b>FileName</b> member will contain only an empty string with a terminating null character 
     *       ("\0") because there is no meaningful name to report.
     * @type {Integer}
     */
    NameFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The NTFS File ID of the file.
     * @type {Integer}
     */
    FileId {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * Reserved. Specify zero.
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Reserved. Specify zero.
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Reserved. Specify zero.
     * @type {Integer}
     */
    Reserved3 {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * The path to the file, relative to the volume root. The file name is a NULL-terminated Unicode string.
     * @type {String}
     */
    FileName {
        get => StrGet(this.ptr + 40, 0, "UTF-16")
        set => StrPut(value, this.ptr + 40, 0, "UTF-16")
    }
}
