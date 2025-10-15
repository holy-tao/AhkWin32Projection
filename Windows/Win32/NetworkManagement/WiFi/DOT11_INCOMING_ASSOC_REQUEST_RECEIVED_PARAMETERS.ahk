#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_INCOMING_ASSOC_REQUEST_RECEIVED_PARAMETERS extends Win32Struct
{
    static sizeof => 20

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
     * @type {BOOLEAN}
     */
    bReAssocReq{
        get {
            if(!this.HasProp("__bReAssocReq"))
                this.__bReAssocReq := BOOLEAN(this.ptr + 10)
            return this.__bReAssocReq
        }
    }

    /**
     * @type {Integer}
     */
    uAssocReqOffset {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    uAssocReqSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
