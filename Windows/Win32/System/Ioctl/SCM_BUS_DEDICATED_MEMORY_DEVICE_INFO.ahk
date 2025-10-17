#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SCM_BUS_DEDICATED_MEMORY_DEVICE_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    class _Flags extends Win32Struct {
        static sizeof => 24
        static packingSize => 8

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
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => (this._bitfield >> 2) & 0x3FFFFFFF
            set => this._bitfield := ((value & 0x3FFFFFFF) << 2) | (this._bitfield & ~(0x3FFFFFFF << 2))
        }
    
    }

    /**
     * @type {Pointer<Guid>}
     */
    DeviceGuid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    DeviceNumber {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {_Flags}
     */
    Flags{
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := %this.__Class%._Flags(12, this)
            return this.__Flags
        }
    }

    /**
     * @type {Integer}
     */
    DeviceSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
