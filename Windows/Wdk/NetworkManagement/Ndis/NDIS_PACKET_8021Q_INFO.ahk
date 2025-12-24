#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_PACKET_8021Q_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    class _TagHeader extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * This bitfield backs the following members:
         * - UserPriority
         * - CanonicalFormatId
         * - VlanId
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
        UserPriority {
            get => (this._bitfield >> 0) & 0x7
            set => this._bitfield := ((value & 0x7) << 0) | (this._bitfield & ~(0x7 << 0))
        }
    
        /**
         * @type {Integer}
         */
        CanonicalFormatId {
            get => (this._bitfield >> 3) & 0x1
            set => this._bitfield := ((value & 0x1) << 3) | (this._bitfield & ~(0x1 << 3))
        }
    
        /**
         * @type {Integer}
         */
        VlanId {
            get => (this._bitfield >> 4) & 0xFFF
            set => this._bitfield := ((value & 0xFFF) << 4) | (this._bitfield & ~(0xFFF << 4))
        }
    
    }

    /**
     * @type {_TagHeader}
     */
    TagHeader{
        get {
            if(!this.HasProp("__TagHeader"))
                this.__TagHeader := %this.__Class%._TagHeader(0, this)
            return this.__TagHeader
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
