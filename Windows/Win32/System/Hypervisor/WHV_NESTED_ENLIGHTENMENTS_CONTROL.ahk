#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @architecture X64, Arm64
 */
class WHV_NESTED_ENLIGHTENMENTS_CONTROL extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    class _Features extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {Integer}
         */
        AsUINT32 {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * This bitfield backs the following members:
         * - DirectHypercall
         * - VirtualizationException
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
        DirectHypercall {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }

        /**
         * @type {Integer}
         */
        VirtualizationException {
            get => (this._bitfield >> 1) & 0x1
            set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
        }
    }

    class _HypercallControls extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {Integer}
         */
        AsUINT32 {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * This bitfield backs the following members:
         * - InterPartitionCommunication
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
        InterPartitionCommunication {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    }

    /**
     * @type {_Features}
     */
    Features {
        get {
            if(!this.HasProp("__Features"))
                this.__Features := WHV_NESTED_ENLIGHTENMENTS_CONTROL._Features(0, this)
            return this.__Features
        }
    }

    /**
     * @type {_HypercallControls}
     */
    HypercallControls {
        get {
            if(!this.HasProp("__HypercallControls"))
                this.__HypercallControls := WHV_NESTED_ENLIGHTENMENTS_CONTROL._HypercallControls(4, this)
            return this.__HypercallControls
        }
    }
}
