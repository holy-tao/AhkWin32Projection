#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_REGISTERED_CONTROLLER_DATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    class _RCSTS extends Win32Struct {
        static sizeof => 1
        static packingSize => 1

        /**
         * This bitfield backs the following members:
         * - HoldReservation
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
        HoldReservation {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
    
    }

    /**
     * @type {Integer}
     */
    CNTLID {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {_RCSTS}
     */
    RCSTS{
        get {
            if(!this.HasProp("__RCSTS"))
                this.__RCSTS := %this.__Class%._RCSTS(2, this)
            return this.__RCSTS
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 3, 5, Primitive, "char")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    HOSTID{
        get {
            if(!this.HasProp("__HOSTIDProxyArray"))
                this.__HOSTIDProxyArray := Win32FixedArray(this.ptr + 8, 8, Primitive, "char")
            return this.__HOSTIDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    RKEY {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
