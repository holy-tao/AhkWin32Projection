#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_802_11_STATUS_INDICATION.ahk
#Include .\NDIS_802_11_AUTHENTICATION_REQUEST.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_802_11_AUTHENTICATION_EVENT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {NDIS_802_11_STATUS_INDICATION}
     */
    Status{
        get {
            if(!this.HasProp("__Status"))
                this.__Status := NDIS_802_11_STATUS_INDICATION(this.ptr + 0)
            return this.__Status
        }
    }

    /**
     * @type {Array<NDIS_802_11_AUTHENTICATION_REQUEST>}
     */
    Request{
        get {
            if(!this.HasProp("__RequestProxyArray"))
                this.__RequestProxyArray := Win32FixedArray(this.ptr + 8, 1, NDIS_802_11_AUTHENTICATION_REQUEST, "")
            return this.__RequestProxyArray
        }
    }
}
