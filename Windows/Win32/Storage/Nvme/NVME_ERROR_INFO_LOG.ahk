#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NVME_COMMAND_STATUS.ahk

/**
 * Contains fields that specify the information in an Error Information log page.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_error_info_log
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_ERROR_INFO_LOG extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * A 64-bit, incrementing error count, that indicates a unique identifier for this error.
     * 
     * The error count starts at `1h`, is incremented for each unique error log entry, and is retained across power off conditions. A value of `0h` indicates an invalid entry; this value may be used when there are lost entries or when there are fewer errors than the maximum number of entries the controller supports.
     * @type {Integer}
     */
    ErrorCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Indicates the Submission Queue Identifier (SQID) of the command that the error information is associated with. If the error is not specific to a particular command then this field is set to `FFFFh`.
     * @type {Integer}
     */
    SQID {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * Indicates the Command Identifier (CMDID) of the command that the error is associated with. If the error is not specific to a particular command then this is set to `FFFFh`.
     * @type {Integer}
     */
    CMDID {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * Indicates the Status Field for the command that completed. 
     * 
     * The Status Field is located in bits 01:15. Bit 0 corresponds to the [Phase Tag (**P**)](ns-nvme-nvme_command_status.md) posted for the command. If the error is not specific to a particular command then this field reports the most applicable status value.
     * @type {NVME_COMMAND_STATUS}
     */
    Status{
        get {
            if(!this.HasProp("__Status"))
                this.__Status := NVME_COMMAND_STATUS(this.ptr + 12)
            return this.__Status
        }
    }

    /**
     * A **ParameterErrorLocation** structure containing fields that indicate the Byte and Bit of the command parameter that the error is associated with, if applicable.
     * 
     * If the parameter spans multiple bytes or bits, the location indicates the first byte and bit of the parameter. If the error is not specific to a particular command, this field is set to `FFFFh`.
     * @type {Integer}
     */
    ParameterErrorLocation {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * Indicates the first Logical Block Address (LBA) that experienced the error condition, if applicable.
     * @type {Integer}
     */
    Lba {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Indicates the namespace that the error is associated with, if applicable.
     * @type {Integer}
     */
    NameSpace {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * When there is additional vendor specific error information available, this field provides the log page identifier associated with that page.
     * 
     * A value of `00h` indicates that no additional information is available. Valid values are in the range of `80h` to `FFh`.
     * @type {Integer}
     */
    VendorInfoAvailable {
        get => NumGet(this, 36, "char")
        set => NumPut("char", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    TRTYPE {
        get => NumGet(this, 37, "char")
        set => NumPut("char", value, this, 37)
    }

    /**
     * A reserved field.
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 38, 2, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * Contains command specific information. If used, the command definition specifies the information returned.
     * @type {Integer}
     */
    CommandSpecificInfo {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    TransportTypeSpecificInfo {
        get => NumGet(this, 48, "ushort")
        set => NumPut("ushort", value, this, 48)
    }

    /**
     * A reserved field.
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 50, 22, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }
}
