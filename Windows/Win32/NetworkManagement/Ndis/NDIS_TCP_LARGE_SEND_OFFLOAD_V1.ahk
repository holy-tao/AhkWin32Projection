#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_TCP_LARGE_SEND_OFFLOAD_V1 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    class _IPv4 extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Encapsulation {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        MaxOffLoadSize {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        MinSegmentCount {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * This bitfield backs the following members:
         * - TcpOptions
         * - IpOptions
         * @type {Integer}
         */
        _bitfield {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
        /**
         * @type {Integer}
         */
        TcpOptions {
            get => (this._bitfield >> 0) & 0x3
            set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
        }
    
        /**
         * @type {Integer}
         */
        IpOptions {
            get => (this._bitfield >> 2) & 0x3
            set => this._bitfield := ((value & 0x3) << 2) | (this._bitfield & ~(0x3 << 2))
        }
    
    }

    /**
     * @type {_IPv4}
     */
    IPv4{
        get {
            if(!this.HasProp("__IPv4"))
                this.__IPv4 := %this.__Class%._IPv4(this.ptr + 0)
            return this.__IPv4
        }
    }
}
