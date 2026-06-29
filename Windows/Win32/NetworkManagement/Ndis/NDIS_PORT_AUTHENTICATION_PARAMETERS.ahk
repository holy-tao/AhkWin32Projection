#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_PORT_AUTHORIZATION_STATE.ahk
#Include .\NDIS_PORT_CONTROL_STATE.ahk
#Include .\NDIS_OBJECT_HEADER.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NDIS_PORT_AUTHENTICATION_PARAMETERS extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

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
     * @type {NDIS_PORT_CONTROL_STATE}
     */
    SendControlState {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {NDIS_PORT_CONTROL_STATE}
     */
    RcvControlState {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {NDIS_PORT_AUTHORIZATION_STATE}
     */
    SendAuthorizationState {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {NDIS_PORT_AUTHORIZATION_STATE}
     */
    RcvAuthorizationState {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
