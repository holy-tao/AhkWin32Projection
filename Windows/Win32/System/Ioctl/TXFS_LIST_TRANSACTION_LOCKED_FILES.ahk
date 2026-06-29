#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains a list of files locked by a transacted writer.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-txfs_list_transaction_locked_files
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct TXFS_LIST_TRANSACTION_LOCKED_FILES {
    #StructPack 8

    /**
     * The KTM transaction to enumerate locked files for in this RM.
     */
    KtmTransaction : Guid

    /**
     * The number of files involved for the specified transaction on this resource manager.
     */
    NumberOfFiles : Int64

    /**
     * The length of the buffer required to hold the complete list of files at the time of this call. This is not guaranteed to be the same length as any other subsequent call.
     */
    BufferSizeRequired : Int64

    /**
     * The offset from the beginning of this structure to the beginning of the first <a href="https://docs.microsoft.com/windows/win32/api/winioctl/ns-winioctl-txfs_list_transaction_locked_files_entry">TXFS_LIST_TRANSACTION_LOCKED_FILES_ENTRY</a> structure.
     */
    Offset : Int64

}
