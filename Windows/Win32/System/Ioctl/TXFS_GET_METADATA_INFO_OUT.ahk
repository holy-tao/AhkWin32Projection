#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the version information about the miniversion that is created.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-txfs_get_metadata_info_out
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class TXFS_GET_METADATA_INFO_OUT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    class _TxfFileId extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        LowPart {
            get => NumGet(this, 0, "int64")
            set => NumPut("int64", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        HighPart {
            get => NumGet(this, 8, "int64")
            set => NumPut("int64", value, this, 8)
        }
    
    }

    /**
     * 
     * @type {_TxfFileId}
     */
    TxfFileId{
        get {
            if(!this.HasProp("__TxfFileId"))
                this.__TxfFileId := %this.__Class%._TxfFileId(0, this)
            return this.__TxfFileId
        }
    }

    /**
     * The <b>GUID</b> of the transaction that locked the specified file locked, if the file is locked.
     * @type {Pointer<Guid>}
     */
    LockingTransaction {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Receives the last LSN for the most recent log record written for file. It is a property of the file that refers to the log, and references the last log entry of the file.
     * @type {Integer}
     */
    LastLsn {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Indicates the state of the transaction that has locked the file. Valid values are:
     * 
     * <a id="TXFS_TRANSACTION_STATE_ACTIVE"></a>
     * <a id="txfs_transaction_state_active"></a>
     * @type {Integer}
     */
    TransactionState {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
