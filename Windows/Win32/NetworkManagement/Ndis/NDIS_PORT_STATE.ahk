#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_PORT_AUTHORIZATION_STATE.ahk
#Include .\NET_IF_DIRECTION_TYPE.ahk
#Include .\NET_IF_MEDIA_CONNECT_STATE.ahk
#Include .\NDIS_PORT_CONTROL_STATE.ahk
#Include .\NDIS_OBJECT_HEADER.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NDIS_PORT_STATE extends Win32Struct {
    static sizeof => 48

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
     * @type {NET_IF_MEDIA_CONNECT_STATE}
     */
    MediaConnectState {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    XmitLinkSpeed {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    RcvLinkSpeed {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {NET_IF_DIRECTION_TYPE}
     */
    Direction {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {NDIS_PORT_CONTROL_STATE}
     */
    SendControlState {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {NDIS_PORT_CONTROL_STATE}
     */
    RcvControlState {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {NDIS_PORT_AUTHORIZATION_STATE}
     */
    SendAuthorizationState {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {NDIS_PORT_AUTHORIZATION_STATE}
     */
    RcvAuthorizationState {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
