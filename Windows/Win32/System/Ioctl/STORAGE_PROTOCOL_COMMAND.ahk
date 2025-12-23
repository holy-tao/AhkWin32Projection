#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This structure is used as an input buffer when using the pass-through mechanism to issue a vendor-specific command to a storage device (via IOCTL_STORAGE_PROTOCOL_COMMAND).
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_protocol_command
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_PROTOCOL_COMMAND extends Win32Struct
{
    static sizeof => 84

    static packingSize => 4

    /**
     * The version of this structure. This should be set to <b>STORAGE_PROTOCOL_STRUCTURE_VERSION</b>.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of this structure. This should be set to sizeof(<b>STORAGE_PROTOCOL_COMMAND</b>).
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The protocol type, of type <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_protocol_type">STORAGE_PROTOCOL_TYPE</a>.
     * @type {Integer}
     */
    ProtocolType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Flags set for this request. The following are valid flags.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>STORAGE_PROTOCOL_COMMAND_FLAG_ADAPTER_REQUEST</b></td>
     * <td>This flag indicates the request to target an adapter instead of device.</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The status of the request made to the storage device. In Windows 10, possible values include: 
     * 
     * <table>
     * <tr>
     * <th>Status value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>STORAGE_PROTOCOL_STATUS_PENDING</b></td>
     * <td>The request is pending.</td>
     * </tr>
     * <tr>
     * <td><b>STORAGE_PROTOCOL_STATUS_SUCCESS</b></td>
     * <td>The request has completed successfully.</td>
     * </tr>
     * <tr>
     * <td><b>STORAGE_PROTOCOL_STATUS_ERROR</b></td>
     * <td>The request has encountered an error.</td>
     * </tr>
     * <tr>
     * <td><b>STORAGE_PROTOCOL_STATUS_INVALID_REQUEST</b></td>
     * <td>The request is not valid.</td>
     * </tr>
     * <tr>
     * <td><b>STORAGE_PROTOCOL_STATUS_NO_DEVICE</b></td>
     * <td>A device is not available to make a request to.</td>
     * </tr>
     * <tr>
     * <td><b>STORAGE_PROTOCOL_STATUS_BUSY</b></td>
     * <td>The device is busy acting on the request.</td>
     * </tr>
     * <tr>
     * <td><b>STORAGE_PROTOCOL_STATUS_DATA_OVERRUN</b></td>
     * <td>The device encountered a data overrun while acting on the request.</td>
     * </tr>
     * <tr>
     * <td><b>STORAGE_PROTOCOL_STATUS_INSUFFICIENT_RESOURCES</b></td>
     * <td>The device cannot complete the request due to insufficient resources.</td>
     * </tr>
     * <tr>
     * <td><b>STORAGE_PROTOCOL_STATUS_NOT_SUPPORTED</b></td>
     * <td>The request is not supported.</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ReturnStatus {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The error code for this request. This is optionally set.
     * @type {Integer}
     */
    ErrorCode {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The length of the command. A non-zero value must be set by the caller.
     * @type {Integer}
     */
    CommandLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The length of the error buffer. This is optionally set and can be set to 0.
     * @type {Integer}
     */
    ErrorInfoLength {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The size of the buffer that is to be transferred to the device. This is only used with a WRITE request.
     * @type {Integer}
     */
    DataToDeviceTransferLength {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The size of the buffer this is to be transferred from the device. This is only used with a READ request.
     * @type {Integer}
     */
    DataFromDeviceTransferLength {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * How long to wait for the device until timing out. This is set in units of seconds.
     * @type {Integer}
     */
    TimeOutValue {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The offset of the error buffer. This must be pointer-aligned.
     * @type {Integer}
     */
    ErrorInfoOffset {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The offset of the buffer that is to be transferred to the device. This must be pointer-aligned and is only used with a WRITE request.
     * @type {Integer}
     */
    DataToDeviceBufferOffset {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The offset of the buffer that is to be transferred from the device. This must be pointer-aligned and is only used with a READ request.
     * @type {Integer}
     */
    DataFromDeviceBufferOffset {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Command-specific data passed along with the command. This depends on the command from the driver, and is optionally set.
     * @type {Integer}
     */
    CommandSpecific {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    Reserved0 {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * The return data. This is optionally set. Some protocols such as NVMe, may return a small amount of data (DWORD0 from completion queue entry) without the need of a separate device data transfer.
     * @type {Integer}
     */
    FixedProtocolReturnData {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    FixedProtocolReturnData2 {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Reserved for future use.
     * @type {Array<UInt32>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 72, 2, Primitive, "uint")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * The vendor-specific command that is to be passed-through to the device.
     * @type {Array<Byte>}
     */
    Command{
        get {
            if(!this.HasProp("__CommandProxyArray"))
                this.__CommandProxyArray := Win32FixedArray(this.ptr + 80, 1, Primitive, "char")
            return this.__CommandProxyArray
        }
    }
}
