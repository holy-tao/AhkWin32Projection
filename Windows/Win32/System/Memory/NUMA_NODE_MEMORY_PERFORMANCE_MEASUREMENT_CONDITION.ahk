#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Memory
 */
class NUMA_NODE_MEMORY_PERFORMANCE_MEASUREMENT_CONDITION extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    class _Flags extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - MinTransferSizeToAchieveValues
         * - NonSequentialTransfers
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }

        /**
         * @type {Integer}
         */
        MinTransferSizeToAchieveValues {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        NonSequentialTransfers {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    }

    /**
     * @type {_Flags}
     */
    Flags {
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := NUMA_NODE_MEMORY_PERFORMANCE_MEASUREMENT_CONDITION._Flags(0, this)
            return this.__Flags
        }
    }

    /**
     * @type {Integer}
     */
    MinTransferSizeInBytes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
