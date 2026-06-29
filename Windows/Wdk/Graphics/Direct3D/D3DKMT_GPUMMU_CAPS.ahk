#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_GPUMMU_CAPS extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    class _Flags extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * This bitfield backs the following members:
         * - ReadOnlyMemorySupported
         * - NoExecuteMemorySupported
         * - CacheCoherentMemorySupported
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
        ReadOnlyMemorySupported {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        NoExecuteMemorySupported {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }

        /**
         * @type {Integer}
         */
        CacheCoherentMemorySupported {
            get => (this._bitfield >> 2) & 0x1
            set => this._bitfield := ((value & 0x1) << 2) | (this._bitfield & ~(0x1 << 2))
        }

        /**
         * @type {Integer}
         */
        Value {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    }

    /**
     * @type {_Flags}
     */
    Flags {
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := D3DKMT_GPUMMU_CAPS._Flags(0, this)
            return this.__Flags
        }
    }

    /**
     * @type {Integer}
     */
    VirtualAddressBitCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
