#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IPX_PATTERN structure applies a specific pattern or corresponding mask for the IPX protocol. The IPX_PATTERN structure designation is used by the traffic control interface in the application of packet filters.
 * @see https://docs.microsoft.com/windows/win32/api//traffic/ns-traffic-ipx_pattern
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class IPX_PATTERN extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    class _Src extends Win32Struct {
        static sizeof => 12
        static packingSize => 4

        /**
         * @type {Integer}
         */
        NetworkAddress {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Array<Byte>}
         */
        NodeAddress{
            get {
                if(!this.HasProp("__NodeAddressProxyArray"))
                    this.__NodeAddressProxyArray := Win32FixedArray(this.ptr + 4, 6, Primitive, "char")
                return this.__NodeAddressProxyArray
            }
        }
    
        /**
         * @type {Integer}
         */
        Socket {
            get => NumGet(this, 10, "ushort")
            set => NumPut("ushort", value, this, 10)
        }
    
    }

    /**
     * 
     * @type {_Src}
     */
    Src{
        get {
            if(!this.HasProp("__Src"))
                this.__Src := %this.__Class%._Src(0, this)
            return this.__Src
        }
    }

    /**
     * 
     * @type {_Src}
     */
    Dest{
        get {
            if(!this.HasProp("__Dest"))
                this.__Dest := %this.__Class%._Src(16, this)
            return this.__Dest
        }
    }
}
