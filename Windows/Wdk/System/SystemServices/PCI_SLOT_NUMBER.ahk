#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PCI_SLOT_NUMBER extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    class _u extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        class _bits extends Win32Struct {
            static sizeof => 4
            static packingSize => 4

            /**
             * This bitfield backs the following members:
             * - DeviceNumber
             * - FunctionNumber
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
            DeviceNumber {
                get => (this._bitfield >> 0) & 0x1F
                set => this._bitfield := ((value & 0x1F) << 0) | (this._bitfield & ~(0x1F << 0))
            }

            /**
             * @type {Integer}
             */
            FunctionNumber {
                get => (this._bitfield >> 5) & 0x7
                set => this._bitfield := ((value & 0x7) << 5) | (this._bitfield & ~(0x7 << 5))
            }
        }

        /**
         * @type {_bits}
         */
        bits {
            get {
                if(!this.HasProp("__bits"))
                    this.__bits := PCI_SLOT_NUMBER._u._bits(0, this)
                return this.__bits
            }
        }

        /**
         * @type {Integer}
         */
        AsULONG {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    }

    /**
     * @type {_u}
     */
    u {
        get {
            if(!this.HasProp("__u"))
                this.__u := PCI_SLOT_NUMBER._u(0, this)
            return this.__u
        }
    }
}
