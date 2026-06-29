#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_PROTOCOL_TYPE.ahk" { STORAGE_PROTOCOL_TYPE }

/**
 * This structure is used as an input buffer when using the pass-through mechanism to issue a vendor-specific command to a storage device (via IOCTL_STORAGE_PROTOCOL_COMMAND).
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_protocol_command
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_PROTOCOL_COMMAND {
    #StructPack 4

    /**
     * The version of this structure. This should be set to <b>STORAGE_PROTOCOL_STRUCTURE_VERSION</b>.
     */
    Version : UInt32

    /**
     * The size of this structure. This should be set to sizeof(<b>STORAGE_PROTOCOL_COMMAND</b>).
     */
    Length : UInt32

    /**
     * The protocol type, of type <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ne-winioctl-storage_protocol_type">STORAGE_PROTOCOL_TYPE</a>.
     */
    ProtocolType : STORAGE_PROTOCOL_TYPE

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
     */
    Flags : UInt32

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
     */
    ReturnStatus : UInt32

    /**
     * The error code for this request. This is optionally set.
     */
    ErrorCode : UInt32

    /**
     * The length of the command. A non-zero value must be set by the caller.
     */
    CommandLength : UInt32

    /**
     * The length of the error buffer. This is optionally set and can be set to 0.
     */
    ErrorInfoLength : UInt32

    /**
     * The size of the buffer that is to be transferred to the device. This is only used with a WRITE request.
     */
    DataToDeviceTransferLength : UInt32

    /**
     * The size of the buffer this is to be transferred from the device. This is only used with a READ request.
     */
    DataFromDeviceTransferLength : UInt32

    /**
     * How long to wait for the device until timing out. This is set in units of seconds.
     */
    TimeOutValue : UInt32

    /**
     * The offset of the error buffer. This must be pointer-aligned.
     */
    ErrorInfoOffset : UInt32

    /**
     * The offset of the buffer that is to be transferred to the device. This must be pointer-aligned and is only used with a WRITE request.
     */
    DataToDeviceBufferOffset : UInt32

    /**
     * The offset of the buffer that is to be transferred from the device. This must be pointer-aligned and is only used with a READ request.
     */
    DataFromDeviceBufferOffset : UInt32

    /**
     * Command-specific data passed along with the command. This depends on the command from the driver, and is optionally set.
     */
    CommandSpecific : UInt32

    /**
     * Reserved for future use.
     */
    Reserved0 : UInt32

    /**
     * The return data. This is optionally set. Some protocols such as NVMe, may return a small amount of data (DWORD0 from completion queue entry) without the need of a separate device data transfer.
     */
    FixedProtocolReturnData : UInt32

    FixedProtocolReturnData2 : UInt32

    /**
     * Reserved for future use.
     */
    Reserved1 : UInt32[2]

    /**
     * The vendor-specific command that is to be passed-through to the device.
     */
    Command : Int8[1]

}
