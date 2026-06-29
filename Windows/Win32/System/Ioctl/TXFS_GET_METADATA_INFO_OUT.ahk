#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains the version information about the miniversion that is created.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-txfs_get_metadata_info_out
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct TXFS_GET_METADATA_INFO_OUT {
    #StructPack 8


    struct _TxfFileId {
        LowPart : Int64

        HighPart : Int64

    }

    TxfFileId : TXFS_GET_METADATA_INFO_OUT._TxfFileId

    /**
     * The <b>GUID</b> of the transaction that locked the specified file locked, if the file is locked.
     */
    LockingTransaction : Guid

    /**
     * Receives the last LSN for the most recent log record written for file. It is a property of the file that refers to the log, and references the last log entry of the file.
     */
    LastLsn : Int64

    /**
     * Indicates the state of the transaction that has locked the file. Valid values are:
     * 
     * <a id="TXFS_TRANSACTION_STATE_ACTIVE"></a>
     * <a id="txfs_transaction_state_active"></a>
     */
    TransactionState : UInt32

}
