#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a list of files locked by a transacted writer.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-txfs_list_transaction_locked_files
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class TXFS_LIST_TRANSACTION_LOCKED_FILES extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The KTM transaction to enumerate locked files for in this RM.
     * @type {Pointer<Guid>}
     */
    KtmTransaction {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of files involved for the specified transaction on this resource manager.
     * @type {Integer}
     */
    NumberOfFiles {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The length of the buffer required to hold the complete list of files at the time of this call. This is not guaranteed to be the same length as any other subsequent call.
     * @type {Integer}
     */
    BufferSizeRequired {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The offset from the beginning of this structure to the beginning of the first <a href="https://docs.microsoft.com/windows/win32/api/winioctl/ns-winioctl-txfs_list_transaction_locked_files_entry">TXFS_LIST_TRANSACTION_LOCKED_FILES_ENTRY</a> structure.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
