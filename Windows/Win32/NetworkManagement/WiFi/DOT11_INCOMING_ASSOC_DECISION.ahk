#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_INCOMING_ASSOC_DECISION extends Win32Struct
{
    static sizeof => 24

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
    bAccept{
        get {
            if(!this.HasProp("__bAccept"))
                this.__bAccept := BOOLEAN(this.ptr + 10)
            return this.__bAccept
        }
    }

    /**
     * @type {Integer}
     */
    usReasonCode {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    uAssocResponseIEsOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    uAssocResponseIEsLength {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
