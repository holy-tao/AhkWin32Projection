#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_DISASSOCIATE_PEER_REQUEST extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {NDIS_OBJECT_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NDIS_OBJECT_HEADER(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * @type {Array<Byte>}
     */
    PeerMacAddr{
        get {
            if(!this.HasProp("__PeerMacAddrProxyArray"))
                this.__PeerMacAddrProxyArray := Win32FixedArray(this.ptr + 4, 6, Primitive, "char")
            return this.__PeerMacAddrProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    usReason {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }
}
