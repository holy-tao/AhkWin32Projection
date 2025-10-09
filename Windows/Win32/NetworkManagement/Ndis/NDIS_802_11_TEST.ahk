#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_802_11_STATUS_INDICATION.ahk
#Include .\NDIS_802_11_AUTHENTICATION_REQUEST.ahk
#Include .\NDIS_802_11_AUTHENTICATION_EVENT.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_802_11_TEST extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {NDIS_802_11_AUTHENTICATION_EVENT}
     */
    AuthenticationEvent{
        get {
            if(!this.HasProp("__AuthenticationEvent"))
                this.__AuthenticationEvent := NDIS_802_11_AUTHENTICATION_EVENT(this.ptr + 8)
            return this.__AuthenticationEvent
        }
    }

    /**
     * @type {Integer}
     */
    RssiTrigger {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
