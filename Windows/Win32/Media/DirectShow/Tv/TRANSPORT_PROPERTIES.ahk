#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class TRANSPORT_PROPERTIES extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    PID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    PCR {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    class _Others extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * This bitfield backs the following members:
         * - TransportScramblingControl
         * - Reserved
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "int64")
            set => NumPut("int64", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        TransportScramblingControl {
            get => (this._bitfield >> 0) & 0xFF
            set => this._bitfield := ((value & 0xFF) << 0) | (this._bitfield & ~(0xFF << 0))
        }
    
    }

    /**
     * @type {_Others}
     */
    Others{
        get {
            if(!this.HasProp("__Others"))
                this.__Others := %this.__Class%._Others(16, this)
            return this.__Others
        }
    }

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }
}
