#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_PEER_INFO.ahk
#Include .\DOT11_PEER_STATISTICS.ahk
#Include .\DOT11_POWER_MODE.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
#Include .\DOT11_CIPHER_ALGORITHM.ahk
#Include .\DOT11_AUTH_ALGORITHM.ahk
#Include .\DOT11_ASSOCIATION_STATE.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11_PEER_INFO_LIST extends Win32Struct {
    static sizeof => 368

    static packingSize => 8

    /**
     * @type {NDIS_OBJECT_HEADER}
     */
    Header {
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NDIS_OBJECT_HEADER(0, this)
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
     * @type {DOT11_PEER_INFO}
     */
    PeerInfo {
        get {
            if(!this.HasProp("__PeerInfoProxyArray"))
                this.__PeerInfoProxyArray := Win32FixedArray(this.ptr + 16, 1, DOT11_PEER_INFO, "")
            return this.__PeerInfoProxyArray
        }
    }
}
