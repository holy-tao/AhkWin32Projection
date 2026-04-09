#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_OBJECT_HEADER.ahk
#Include .\NDIS_PORT_TYPE.ahk
#Include .\NET_IF_MEDIA_CONNECT_STATE.ahk
#Include .\NET_IF_DIRECTION_TYPE.ahk
#Include .\NDIS_PORT_CONTROL_STATE.ahk
#Include .\NDIS_PORT_AUTHORIZATION_STATE.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NDIS_PORT_CHARACTERISTICS extends Win32Struct {
    static sizeof => 64

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
    PortNumber {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {NDIS_PORT_TYPE}
     */
    Type {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {NET_IF_MEDIA_CONNECT_STATE}
     */
    MediaConnectState {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    XmitLinkSpeed {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    RcvLinkSpeed {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {NET_IF_DIRECTION_TYPE}
     */
    Direction {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {NDIS_PORT_CONTROL_STATE}
     */
    SendControlState {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * @type {NDIS_PORT_CONTROL_STATE}
     */
    RcvControlState {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {NDIS_PORT_AUTHORIZATION_STATE}
     */
    SendAuthorizationState {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * @type {NDIS_PORT_AUTHORIZATION_STATE}
     */
    RcvAuthorizationState {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }
}
