#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Information about an operation on a placeholder file or folder.
 * @remarks
 * The platform provides the *ConnectionKey*, *TransferKey*, and *CorrelationVector* to all callback functions registered via [CfConnectSyncRoot](nf-cfapi-cfconnectsyncroot.md). Additionally, sync providers can obtain a *TransferKey* using [CfGetTransferKey](nf-cfapi-cfgettransferkey.md) and a *CorrelationVector* using [CfGetCorrelationVector](nf-cfapi-cfgetcorrelationvector.md).
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ns-cfapi-cf_operation_info
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_OPERATION_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The size of the **CF_OPERATION_INFO** structure.
     * @type {Integer}
     */
    StructSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The type of operation being performed. See [CF_OPERATION_TYPE](ne-cfapi-cf_operation_type.md) for more information.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A connection key obtained for the communication channel.
     * @type {Integer}
     */
    ConnectionKey {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * An opaque handle to the placeholder.
     * @type {Integer}
     */
    TransferKey {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * A correlation vector on a placeholder used for telemetry purposes.
     * @type {Pointer<CORRELATION_VECTOR>}
     */
    CorrelationVector {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * >[!NOTE]
     * >This member is new for Windows 10, version 1803.
     * 
     * The current [CF_SYNC_STATUS](ns-cfapi-cf_sync_status.md) of the platform.
     * 
     * The platform queries this information upon any failed operations on a cloud file placeholder. If a structure is available, the platform will use the information provided to construct a more meaningful and actionable message to the user. The platform will keep this information on the file until the last handle on it goes away. If *SyncStatus* is **null**, the platform will clear the previously set sync status, if there is one.
     * @type {Pointer<CF_SYNC_STATUS>}
     */
    SyncStatus {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * An opaque id that uniquely identifies a cloud file operation on a particular cloud file.
     * @type {Integer}
     */
    RequestKey {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }
}
