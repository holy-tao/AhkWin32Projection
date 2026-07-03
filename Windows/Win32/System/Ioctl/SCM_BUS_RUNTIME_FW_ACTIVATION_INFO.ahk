#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\SCM_BUS_FIRMWARE_ACTIVATION_STATE.ahk" { SCM_BUS_FIRMWARE_ACTIVATION_STATE }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_BUS_RUNTIME_FW_ACTIVATION_INFO {
    #StructPack 8


    struct _FirmwareActivationCapability {
        /**
         * This bitfield backs the following members:
         * - FwManagedIoQuiesceFwActivationSupported
         * - OsManagedIoQuiesceFwActivationSupported
         * - WarmResetBasedFwActivationSupported
         * - Reserved
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        FwManagedIoQuiesceFwActivationSupported {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        OsManagedIoQuiesceFwActivationSupported {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        WarmResetBasedFwActivationSupported {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }
    }

    Version : UInt32

    Size : UInt32

    RuntimeFwActivationSupported : BOOLEAN

    FirmwareActivationState : SCM_BUS_FIRMWARE_ACTIVATION_STATE

    FirmwareActivationCapability : SCM_BUS_RUNTIME_FW_ACTIVATION_INFO._FirmwareActivationCapability

    EstimatedFirmwareActivationTimeInUSecs : Int64

    EstimatedProcessorAccessQuiesceTimeInUSecs : Int64

    EstimatedIOAccessQuiesceTimeInUSecs : Int64

    PlatformSupportedMaxIOAccessQuiesceTimeInUSecs : Int64

}
