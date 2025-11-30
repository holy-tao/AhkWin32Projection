#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_802_11_AUTHENTICATION_REQUEST.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_802_11_AUTHENTICATION_EVENT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer<NDIS_802_11_STATUS_INDICATION>}
     */
    Status {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Array<NDIS_802_11_AUTHENTICATION_REQUEST>}
     */
    Request{
        get {
            if(!this.HasProp("__RequestProxyArray"))
                this.__RequestProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__RequestProxyArray
        }
    }
}
