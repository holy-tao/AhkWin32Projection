#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_PORT_CONTROL_STATE.ahk
#Include .\NDIS_PORT_AUTHORIZATION_STATE.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_PORT_AUTHENTICATION_PARAMETERS extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Header {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {NDIS_PORT_CONTROL_STATE}
     */
    SendControlState {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {NDIS_PORT_CONTROL_STATE}
     */
    RcvControlState {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {NDIS_PORT_AUTHORIZATION_STATE}
     */
    SendAuthorizationState {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {NDIS_PORT_AUTHORIZATION_STATE}
     */
    RcvAuthorizationState {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
