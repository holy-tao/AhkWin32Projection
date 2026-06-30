#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SCM_BUS_DEDICATED_MEMORY_DEVICE_INFO extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    class _Flags extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * This bitfield backs the following members:
         * - ForcedByRegistry
         * - Initialized
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
        ForcedByRegistry {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        Initialized {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    }

    /**
     * @type {Guid}
     */
    DeviceGuid {
        get {
            if(!this.HasProp("__DeviceGuid"))
                this.__DeviceGuid := Guid(0, this)
            return this.__DeviceGuid
        }
    }

    /**
     * @type {Integer}
     */
    DeviceNumber {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {_Flags}
     */
    Flags {
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := SCM_BUS_DEDICATED_MEMORY_DEVICE_INFO._Flags(20, this)
            return this.__Flags
        }
    }

    /**
     * @type {Integer}
     */
    DeviceSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
