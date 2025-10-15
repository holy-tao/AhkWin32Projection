#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SCM_BUS_RUNTIME_FW_ACTIVATION_INFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    class _FirmwareActivationCapability extends Win32Struct {
        static sizeof => 56
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - FwManagedIoQuiesceFwActivationSupported
         * - OsManagedIoQuiesceFwActivationSupported
         * - WarmResetBasedFwActivationSupported
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
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
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => (this._bitfield >> 3) & 0x1FFFFFFF
            set => this._bitfield := ((value & 0x1FFFFFFF) << 3) | (this._bitfield & ~(0x1FFFFFFF << 3))
        }
    
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {BOOLEAN}
     */
    RuntimeFwActivationSupported{
        get {
            if(!this.HasProp("__RuntimeFwActivationSupported"))
                this.__RuntimeFwActivationSupported := BOOLEAN(this.ptr + 8)
            return this.__RuntimeFwActivationSupported
        }
    }

    /**
     * @type {Integer}
     */
    FirmwareActivationState {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {_FirmwareActivationCapability}
     */
    FirmwareActivationCapability{
        get {
            if(!this.HasProp("__FirmwareActivationCapability"))
                this.__FirmwareActivationCapability := %this.__Class%._FirmwareActivationCapability(this.ptr + 16)
            return this.__FirmwareActivationCapability
        }
    }

    /**
     * @type {Integer}
     */
    EstimatedFirmwareActivationTimeInUSecs {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    EstimatedProcessorAccessQuiesceTimeInUSecs {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    EstimatedIOAccessQuiesceTimeInUSecs {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    PlatformSupportedMaxIOAccessQuiesceTimeInUSecs {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
