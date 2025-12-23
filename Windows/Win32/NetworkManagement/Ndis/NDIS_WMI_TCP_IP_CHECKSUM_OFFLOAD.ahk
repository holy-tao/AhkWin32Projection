#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_WMI_TCP_IP_CHECKSUM_OFFLOAD extends Win32Struct
{
    static sizeof => 88

    static packingSize => 4

    class _IPv4Transmit extends Win32Struct {
        static sizeof => 24
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
        IpOptionsSupported {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        TcpOptionsSupported {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        TcpChecksum {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
        /**
         * @type {Integer}
         */
        UdpChecksum {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        IpChecksum {
            get => NumGet(this, 20, "uint")
            set => NumPut("uint", value, this, 20)
        }
    
    }

    class _IPv4Receive extends Win32Struct {
        static sizeof => 24
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
        IpOptionsSupported {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        TcpOptionsSupported {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        TcpChecksum {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
        /**
         * @type {Integer}
         */
        UdpChecksum {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        IpChecksum {
            get => NumGet(this, 20, "uint")
            set => NumPut("uint", value, this, 20)
        }
    
    }

    class _IPv6Transmit extends Win32Struct {
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
        IpExtensionHeadersSupported {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        TcpOptionsSupported {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        TcpChecksum {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
        /**
         * @type {Integer}
         */
        UdpChecksum {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    
    }

    class _IPv6Receive extends Win32Struct {
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
        IpExtensionHeadersSupported {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        TcpOptionsSupported {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        TcpChecksum {
            get => NumGet(this, 12, "uint")
            set => NumPut("uint", value, this, 12)
        }
    
        /**
         * @type {Integer}
         */
        UdpChecksum {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    
    }

    /**
     * @type {_IPv4Transmit}
     */
    IPv4Transmit{
        get {
            if(!this.HasProp("__IPv4Transmit"))
                this.__IPv4Transmit := %this.__Class%._IPv4Transmit(0, this)
            return this.__IPv4Transmit
        }
    }

    /**
     * @type {_IPv4Receive}
     */
    IPv4Receive{
        get {
            if(!this.HasProp("__IPv4Receive"))
                this.__IPv4Receive := %this.__Class%._IPv4Receive(24, this)
            return this.__IPv4Receive
        }
    }

    /**
     * @type {_IPv6Transmit}
     */
    IPv6Transmit{
        get {
            if(!this.HasProp("__IPv6Transmit"))
                this.__IPv6Transmit := %this.__Class%._IPv6Transmit(48, this)
            return this.__IPv6Transmit
        }
    }

    /**
     * @type {_IPv6Receive}
     */
    IPv6Receive{
        get {
            if(!this.HasProp("__IPv6Receive"))
                this.__IPv6Receive := %this.__Class%._IPv6Receive(68, this)
            return this.__IPv6Receive
        }
    }
}
