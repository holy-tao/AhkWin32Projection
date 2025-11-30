#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_IN_USE_PAGE_NOTIFY_FLAGS extends Win32Struct
{
    static sizeof => 2

    static packingSize => 1

    class _Bits extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - PlatformDirected
         * - Reserved
         * - NotifyAllOfflines
         * - PageOfflined
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 0, "char")
            set => NumPut("char", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        PlatformDirected {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
        /**
         * @type {Integer}
         */
        NotifyAllOfflines {
            get => (this._bitfield >> 6) & 0x1
            set => this._bitfield := ((value & 0x1) << 6) | (this._bitfield & ~(0x1 << 6))
        }
    
        /**
         * @type {Integer}
         */
        PageOfflined {
            get => (this._bitfield >> 7) & 0x1
            set => this._bitfield := ((value & 0x1) << 7) | (this._bitfield & ~(0x1 << 7))
        }
    
    }

    /**
     * @type {_Bits}
     */
    Bits{
        get {
            if(!this.HasProp("__Bits"))
                this.__Bits := %this.__Class%._Bits(0, this)
            return this.__Bits
        }
    }

    /**
     * @type {Integer}
     */
    AsUCHAR {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
