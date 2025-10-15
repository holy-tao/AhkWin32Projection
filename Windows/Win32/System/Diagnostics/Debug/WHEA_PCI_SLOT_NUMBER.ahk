#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class WHEA_PCI_SLOT_NUMBER extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    class _bits extends Win32Struct {
        static sizeof => 4
        static packingSize => 1

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
    
        /**
         * @type {Integer}
         */
        Reserved {
            get => (this._bitfield >> 8) & 0xFFFFFF
            set => this._bitfield := ((value & 0xFFFFFF) << 8) | (this._bitfield & ~(0xFFFFFF << 8))
        }
    
    }

    /**
     * @type {_bits}
     */
    bits{
        get {
            if(!this.HasProp("__bits"))
                this.__bits := %this.__Class%._bits(this.ptr + 0)
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
