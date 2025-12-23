#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a socket address.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_sockaddr
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_SOCKADDR extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    class _u_e__Union extends Win32Struct {
        static sizeof => 28
        static packingSize => 4

        class _ipv4 extends Win32Struct {
            static sizeof => 16
            static packingSize => 4
    
            /**
             * @type {Integer}
             */
            sin_port {
                get => NumGet(this, 0, "ushort")
                set => NumPut("ushort", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            IN_ADDR {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
            /**
             * @type {Array<Byte>}
             */
            sin_zero{
                get {
                    if(!this.HasProp("__sin_zeroProxyArray"))
                        this.__sin_zeroProxyArray := Win32FixedArray(this.ptr + 8, 8, Primitive, "char")
                    return this.__sin_zeroProxyArray
                }
            }
        
        }
    
        class _ipv6 extends Win32Struct {
            static sizeof => 28
            static packingSize => 4
    
            /**
             * @type {Integer}
             */
            sin6_port {
                get => NumGet(this, 0, "ushort")
                set => NumPut("ushort", value, this, 0)
            }
        
            /**
             * @type {Integer}
             */
            sin6_flowinfo {
                get => NumGet(this, 4, "uint")
                set => NumPut("uint", value, this, 4)
            }
        
            /**
             * @type {Array<UInt16>}
             */
            sin6_addr{
                get {
                    if(!this.HasProp("__sin6_addrProxyArray"))
                        this.__sin6_addrProxyArray := Win32FixedArray(this.ptr + 8, 8, Primitive, "ushort")
                    return this.__sin6_addrProxyArray
                }
            }
        
            /**
             * @type {Integer}
             */
            sin6_scope_id {
                get => NumGet(this, 24, "uint")
                set => NumPut("uint", value, this, 24)
            }
        
        }
    
        /**
         * @type {_ipv4}
         */
        ipv4{
            get {
                if(!this.HasProp("__ipv4"))
                    this.__ipv4 := %this.__Class%._ipv4(0, this)
                return this.__ipv4
            }
        }
    
        /**
         * @type {_ipv6}
         */
        ipv6{
            get {
                if(!this.HasProp("__ipv6"))
                    this.__ipv6 := %this.__Class%._ipv6(0, this)
                return this.__ipv6
            }
        }
    
    }

    /**
     * An integer index into the following structure members.
     * @type {Integer}
     */
    sin_family {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * 
     * @type {_u_e__Union}
     */
    u{
        get {
            if(!this.HasProp("__u"))
                this.__u := %this.__Class%._u_e__Union(4, this)
            return this.__u
        }
    }
}
