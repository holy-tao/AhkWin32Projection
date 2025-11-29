#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IP_PATTERN structure applies a specific pattern or corresponding mask for the IP protocol. The IP_PATTERN structure designation is used by the traffic control interface in the application of packet filters.
 * @remarks
 * 
 * The following macros are defined in Traffic.h to make it easier to reference the members of the union: 
 * 
 * <pre class="syntax" xml:space="preserve"><code>#define tcSrcPort S_un.S_un_ports.s_srcport
 * 
 * @see https://docs.microsoft.com/windows/win32/api//traffic/ns-traffic-ip_pattern
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class IP_PATTERN extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    class _S_un_e__Union extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        class _S_un_ports extends Win32Struct {
            static sizeof => 4
            static packingSize => 2
    
            /**
             * @type {Integer}
             */
            s_srcport {
                get => NumGet(this, 0, "ushort")
                set => NumPut("ushort", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            s_dstport {
                get => NumGet(this, 2, "ushort")
                set => NumPut("ushort", value, this, 2)
            }
        
        }
    
        class _S_un_icmp extends Win32Struct {
            static sizeof => 4
            static packingSize => 2
    
            /**
             * @type {Integer}
             */
            s_type {
                get => NumGet(this, 0, "char")
                set => NumPut("char", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            s_code {
                get => NumGet(this, 1, "char")
                set => NumPut("char", value, this, 1)
            }
        
            /**
             * @type {Integer}
             */
            filler {
                get => NumGet(this, 2, "ushort")
                set => NumPut("ushort", value, this, 2)
            }
        
        }
    
        /**
         * @type {_S_un_ports}
         */
        S_un_ports{
            get {
                if(!this.HasProp("__S_un_ports"))
                    this.__S_un_ports := %this.__Class%._S_un_ports(0, this)
                return this.__S_un_ports
            }
        }
    
        /**
         * @type {_S_un_icmp}
         */
        S_un_icmp{
            get {
                if(!this.HasProp("__S_un_icmp"))
                    this.__S_un_icmp := %this.__Class%._S_un_icmp(0, this)
                return this.__S_un_icmp
            }
        }
    
        /**
         * @type {Integer}
         */
        S_Spi {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Source address.
     * @type {Integer}
     */
    SrcAddr {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Destination address.
     * @type {Integer}
     */
    DstAddr {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * 
     * @type {_S_un_e__Union}
     */
    S_un{
        get {
            if(!this.HasProp("__S_un"))
                this.__S_un := %this.__Class%._S_un_e__Union(16, this)
            return this.__S_un
        }
    }

    /**
     * Protocol identifier.
     * @type {Integer}
     */
    ProtocolId {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }

    /**
     * Reserved for future use.
     * @type {Array<Byte>}
     */
    Reserved3{
        get {
            if(!this.HasProp("__Reserved3ProxyArray"))
                this.__Reserved3ProxyArray := Win32FixedArray(this.ptr + 21, 3, Primitive, "char")
            return this.__Reserved3ProxyArray
        }
    }
}
