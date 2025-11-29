#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class BM_REQUEST_TYPE extends Win32Struct
{
    static sizeof => 2

    static packingSize => 1

    class _BM extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - Recipient
         * - Reserved
         * - Type
         * - Dir
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        Recipient {
            get => (this._bitfield >> 0) & 0x3
            set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
        }
    
        /**
         * @type {Integer}
         */
        Type {
            get => (this._bitfield >> 5) & 0x3
            set => this._bitfield := ((value & 0x3) << 5) | (this._bitfield & ~(0x3 << 5))
        }
    
        /**
         * @type {Integer}
         */
        Dir {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }
    
    }

    /**
     * @type {_BM}
     */
    s{
        get {
            if(!this.HasProp("__s"))
                this.__s := %this.__Class%._BM(0, this)
            return this.__s
        }
    }

    /**
     * @type {Integer}
     */
    B {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
