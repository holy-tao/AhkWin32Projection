#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NVME_COMMAND_STATUS.ahk" { NVME_COMMAND_STATUS }

/**
 * Contains fields that specify the information in an Error Information log page.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_error_info_log
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_ERROR_INFO_LOG {
    #StructPack 8


    struct _ParameterErrorLocation {
        /**
         * This bitfield backs the following members:
         * - Byte
         * - Bit
         * - Reserved
         */
        _bitfield : Int16


        /**
         * @type {Integer}
         */
        Byte {
            get => (this._bitfield >> 0) & 0xFF
            set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
        }

        /**
         * @type {Integer}
         */
        Bit {
            get => (this._bitfield >> 8) & 0x7
            set => this._bitfield := ((value & 0x7) << 8) | (this._bitfield & ~(0x7 << 8))
        }
    }

    /**
     * A 64-bit, incrementing error count, that indicates a unique identifier for this error.
     * 
     * The error count starts at `1h`, is incremented for each unique error log entry, and is retained across power off conditions. A value of `0h` indicates an invalid entry; this value may be used when there are lost entries or when there are fewer errors than the maximum number of entries the controller supports.
     */
    ErrorCount : Int64

    /**
     * Indicates the Submission Queue Identifier (SQID) of the command that the error information is associated with. If the error is not specific to a particular command then this field is set to `FFFFh`.
     */
    SQID : UInt16

    /**
     * Indicates the Command Identifier (CMDID) of the command that the error is associated with. If the error is not specific to a particular command then this is set to `FFFFh`.
     */
    CMDID : UInt16

    /**
     * Indicates the Status Field for the command that completed. 
     * 
     * The Status Field is located in bits 01:15. Bit 0 corresponds to the [Phase Tag (**P**)](ns-nvme-nvme_command_status.md) posted for the command. If the error is not specific to a particular command then this field reports the most applicable status value.
     */
    Status : NVME_COMMAND_STATUS

    /**
     * A **ParameterErrorLocation** structure containing fields that indicate the Byte and Bit of the command parameter that the error is associated with, if applicable.
     * 
     * If the parameter spans multiple bytes or bits, the location indicates the first byte and bit of the parameter. If the error is not specific to a particular command, this field is set to `FFFFh`.
     */
    ParameterErrorLocation : NVME_ERROR_INFO_LOG._ParameterErrorLocation

    /**
     * Indicates the first Logical Block Address (LBA) that experienced the error condition, if applicable.
     */
    Lba : Int64

    /**
     * Indicates the namespace that the error is associated with, if applicable.
     */
    NameSpace : UInt32

    /**
     * When there is additional vendor specific error information available, this field provides the log page identifier associated with that page.
     * 
     * A value of `00h` indicates that no additional information is available. Valid values are in the range of `80h` to `FFh`.
     */
    VendorInfoAvailable : Int8

    TRTYPE : Int8

    /**
     * A reserved field.
     */
    Reserved0 : Int8[2]

    /**
     * Contains command specific information. If used, the command definition specifies the information returned.
     */
    CommandSpecificInfo : Int64

    TransportTypeSpecificInfo : UInt16

    /**
     * A reserved field.
     */
    Reserved1 : Int8[22]

}
