#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CF_CONNECTION_KEY.ahk" { CF_CONNECTION_KEY }
#Import ".\CF_SYNC_STATUS.ahk" { CF_SYNC_STATUS }
#Import ".\CF_OPERATION_TYPE.ahk" { CF_OPERATION_TYPE }
#Import "..\..\System\CorrelationVector\CORRELATION_VECTOR.ahk" { CORRELATION_VECTOR }

/**
 * Information about an operation on a placeholder file or folder.
 * @remarks
 * The platform provides the *ConnectionKey*, *TransferKey*, and *CorrelationVector* to all callback functions registered via [CfConnectSyncRoot](nf-cfapi-cfconnectsyncroot.md). Additionally, sync providers can obtain a *TransferKey* using [CfGetTransferKey](nf-cfapi-cfgettransferkey.md) and a *CorrelationVector* using [CfGetCorrelationVector](nf-cfapi-cfgetcorrelationvector.md).
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_operation_info
 * @namespace Windows.Win32.Storage.CloudFilters
 */
export default struct CF_OPERATION_INFO {
    #StructPack 8

    /**
     * The size of the **CF_OPERATION_INFO** structure.
     */
    StructSize : UInt32

    /**
     * The type of operation being performed. See [CF_OPERATION_TYPE](ne-cfapi-cf_operation_type.md) for more information.
     */
    Type : CF_OPERATION_TYPE

    /**
     * A connection key obtained for the communication channel.
     */
    ConnectionKey : CF_CONNECTION_KEY

    /**
     * An opaque handle to the placeholder.
     */
    TransferKey : Int64

    /**
     * A correlation vector on a placeholder used for telemetry purposes.
     */
    CorrelationVector : CORRELATION_VECTOR.Ptr

    /**
     * >[!NOTE]
     * >This member is new for Windows 10, version 1803.
     * 
     * The current [CF_SYNC_STATUS](ns-cfapi-cf_sync_status.md) of the platform.
     * 
     * The platform queries this information upon any failed operations on a cloud file placeholder. If a structure is available, the platform will use the information provided to construct a more meaningful and actionable message to the user. The platform will keep this information on the file until the last handle on it goes away. If *SyncStatus* is **null**, the platform will clear the previously set sync status, if there is one.
     */
    SyncStatus : CF_SYNC_STATUS.Ptr

    /**
     * An opaque id that uniquely identifies a cloud file operation on a particular cloud file.
     */
    RequestKey : Int64

}
