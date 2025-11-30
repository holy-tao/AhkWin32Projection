#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class DEVICE_BUS_SPECIFIC_RESET_TYPE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    class _Pci extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - FunctionLevelDeviceReset
         * - PlatformLevelDeviceReset
         * - SecondaryBusReset
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

    class _Acpi extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - FunctionLevelDeviceReset
         * - PlatformLevelDeviceReset
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

    /**
     * @type {_Pci}
     */
    Pci{
        get {
            if(!this.HasProp("__Pci"))
                this.__Pci := %this.__Class%._Pci(0, this)
            return this.__Pci
        }
    }

    /**
     * @type {_Acpi}
     */
    Acpi{
        get {
            if(!this.HasProp("__Acpi"))
                this.__Acpi := %this.__Class%._Acpi(0, this)
            return this.__Acpi
        }
    }

    /**
     * @type {Integer}
     */
    AsULONGLONG {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
