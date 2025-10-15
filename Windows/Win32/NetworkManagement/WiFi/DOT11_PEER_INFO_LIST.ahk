#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
#Include .\DOT11_PEER_STATISTICS.ahk
#Include .\DOT11_PEER_INFO.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_PEER_INFO_LIST extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

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
     * @type {Integer}
     */
    uNumOfEntries {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    uTotalNumOfEntries {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<DOT11_PEER_INFO>}
     */
    PeerInfo{
        get {
            if(!this.HasProp("__PeerInfoProxyArray"))
                this.__PeerInfoProxyArray := Win32FixedArray(this.ptr + 16, 1, DOT11_PEER_INFO, "")
            return this.__PeerInfoProxyArray
        }
    }
}
