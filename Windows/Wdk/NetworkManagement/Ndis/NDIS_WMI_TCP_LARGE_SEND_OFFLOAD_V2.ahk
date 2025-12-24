#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_WMI_TCP_LARGE_SEND_OFFLOAD_V2 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    class _IPv4 extends Win32Struct {
        static sizeof => 12
        static packingSize => 4

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
    
    }

    class _IPv6 extends Win32Struct {
        static sizeof => 20
        static packingSize => 4

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
         * @type {Integer}
         */
        IpExtensionHeadersSupported {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
        /**
         * @type {Integer}
         */
        TcpOptionsSupported {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    
    }

    /**
     * @type {_IPv4}
     */
    IPv4{
        get {
            if(!this.HasProp("__IPv4"))
                this.__IPv4 := %this.__Class%._IPv4(0, this)
            return this.__IPv4
        }
    }

    /**
     * @type {_IPv6}
     */
    IPv6{
        get {
            if(!this.HasProp("__IPv6"))
                this.__IPv6 := %this.__Class%._IPv6(12, this)
            return this.__IPv6
        }
    }
}
