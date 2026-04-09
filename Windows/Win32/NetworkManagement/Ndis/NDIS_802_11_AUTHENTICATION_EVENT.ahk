#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_802_11_STATUS_INDICATION.ahk
#Include .\NDIS_802_11_STATUS_TYPE.ahk
#Include .\NDIS_802_11_AUTHENTICATION_REQUEST.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NDIS_802_11_AUTHENTICATION_EVENT extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {NDIS_802_11_STATUS_INDICATION}
     */
    Status {
        get {
            if(!this.HasProp("__Status"))
                this.__Status := NDIS_802_11_STATUS_INDICATION(0, this)
            return this.__Status
        }
    }

    /**
     * @type {NDIS_802_11_AUTHENTICATION_REQUEST}
     */
    Request {
        get {
            if(!this.HasProp("__RequestProxyArray"))
                this.__RequestProxyArray := Win32FixedArray(this.ptr + 4, 1, NDIS_802_11_AUTHENTICATION_REQUEST, "")
            return this.__RequestProxyArray
        }
    }
}
