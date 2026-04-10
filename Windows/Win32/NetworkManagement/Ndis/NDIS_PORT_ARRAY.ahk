#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_OBJECT_HEADER.ahk
#Include .\NDIS_PORT_CHARACTERISTICS.ahk
#Include .\NDIS_PORT_TYPE.ahk
#Include .\NET_IF_MEDIA_CONNECT_STATE.ahk
#Include .\NET_IF_DIRECTION_TYPE.ahk
#Include .\NDIS_PORT_CONTROL_STATE.ahk
#Include .\NDIS_PORT_AUTHORIZATION_STATE.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NDIS_PORT_ARRAY extends Win32Struct {
    static sizeof => 80

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
    NumberOfPorts {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    OffsetFirstPort {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ElementSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {NDIS_PORT_CHARACTERISTICS}
     */
    Ports {
        get {
            if(!this.HasProp("__PortsProxyArray"))
                this.__PortsProxyArray := Win32FixedArray(this.ptr + 16, 1, NDIS_PORT_CHARACTERISTICS, "")
            return this.__PortsProxyArray
        }
    }
}
