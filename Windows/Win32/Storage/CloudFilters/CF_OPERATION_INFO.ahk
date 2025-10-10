#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Information about an operation on a placeholder file or folder.
 * @remarks
 * 
  * The platform provides the <b>ConnectionKey</b>, <b>TransferKey</b>, and <b>CorrelationVector</b> to all callback functions registered via <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/nf-cfapi-cfconnectsyncroot">CfConnectSyncRoot</a>. Additionally, sync providers can obtain a <b>TransferKey</b> using <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/nf-cfapi-cfgettransferkey">CfGetTransferKey</a> and a <b>CorrelationVector</b> using <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/nf-cfapi-cfgetcorrelationvector">CfGetCorrelationVector</a>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ns-cfapi-cf_operation_info
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_OPERATION_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The size of the structure.
     * @type {Integer}
     */
    StructSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The type of operation performed.
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
     * <b>Note</b>  This member is new for Windows 10, version 1803.
     * 
     * The current sync status of the platform. 
     * 
     * The platform queries this information upon any failed operations on a cloud file placeholder. If a structure is available, the platform will use the information provided to construct a more meaningful and actionable message to the user. 
     * The platform will keep this information on the file until the last handle on it goes away. If <b>null</b>,  the platform will clear the previously set sync status, if there is one.
     * @type {Pointer<CF_SYNC_STATUS>}
     */
    SyncStatus {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * 
     * @type {Integer}
     */
    RequestKey {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }
}
