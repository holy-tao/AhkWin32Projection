#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DEVICE_BUS_SPECIFIC_RESET_TYPE {
    #StructPack 8


    struct _Pci {
        /**
         * This bitfield backs the following members:
         * - FunctionLevelDeviceReset
         * - PlatformLevelDeviceReset
         * - SecondaryBusReset
         * - Reserved
         */
        _bitfield : Int64


        /**
         * @type {Integer}
         */
        FunctionLevelDeviceReset {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        PlatformLevelDeviceReset {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        SecondaryBusReset {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }
    }

    struct _Acpi {
        /**
         * This bitfield backs the following members:
         * - FunctionLevelDeviceReset
         * - PlatformLevelDeviceReset
         * - Reserved
         */
        _bitfield : Int64


        /**
         * @type {Integer}
         */
        FunctionLevelDeviceReset {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        PlatformLevelDeviceReset {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    }

    Pci : DEVICE_BUS_SPECIFIC_RESET_TYPE._Pci

    static __New() {
        DefineProp(this.Prototype, 'Acpi', { type: DEVICE_BUS_SPECIFIC_RESET_TYPE._Acpi, offset: 0 })
        DefineProp(this.Prototype, 'AsULONGLONG', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
