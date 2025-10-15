#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk
#Include .\DOT11_WFD_GO_INTENT.ahk
#Include .\DOT11_WFD_CONFIGURATION_TIMEOUT.ahk
#Include .\DOT11_SSID.ahk
#Include .\DOT11_WFD_GROUP_ID.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_SEND_GO_NEGOTIATION_RESPONSE_PARAMETERS extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {NDIS_OBJECT_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NDIS_OBJECT_HEADER(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * @type {Array<Byte>}
     */
    PeerDeviceAddress{
        get {
            if(!this.HasProp("__PeerDeviceAddressProxyArray"))
                this.__PeerDeviceAddressProxyArray := Win32FixedArray(this.ptr + 4, 6, Primitive, "char")
            return this.__PeerDeviceAddressProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    DialogToken {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * @type {Pointer<Void>}
     */
    RequestContext {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    uSendTimeout {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 28, "char")
        set => NumPut("char", value, this, 28)
    }

    /**
     * @type {DOT11_WFD_GO_INTENT}
     */
    GroupOwnerIntent{
        get {
            if(!this.HasProp("__GroupOwnerIntent"))
                this.__GroupOwnerIntent := DOT11_WFD_GO_INTENT(this.ptr + 29)
            return this.__GroupOwnerIntent
        }
    }

    /**
     * @type {DOT11_WFD_CONFIGURATION_TIMEOUT}
     */
    MinimumConfigTimeout{
        get {
            if(!this.HasProp("__MinimumConfigTimeout"))
                this.__MinimumConfigTimeout := DOT11_WFD_CONFIGURATION_TIMEOUT(this.ptr + 30)
            return this.__MinimumConfigTimeout
        }
    }

    /**
     * @type {Array<Byte>}
     */
    IntendedInterfaceAddress{
        get {
            if(!this.HasProp("__IntendedInterfaceAddressProxyArray"))
                this.__IntendedInterfaceAddressProxyArray := Win32FixedArray(this.ptr + 32, 6, Primitive, "char")
            return this.__IntendedInterfaceAddressProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    GroupCapability {
        get => NumGet(this, 38, "char")
        set => NumPut("char", value, this, 38)
    }

    /**
     * @type {DOT11_WFD_GROUP_ID}
     */
    GroupID{
        get {
            if(!this.HasProp("__GroupID"))
                this.__GroupID := DOT11_WFD_GROUP_ID(this.ptr + 40)
            return this.__GroupID
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bUseGroupID{
        get {
            if(!this.HasProp("__bUseGroupID"))
                this.__bUseGroupID := BOOLEAN(this.ptr + 88)
            return this.__bUseGroupID
        }
    }

    /**
     * @type {Integer}
     */
    uIEsOffset {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    uIEsLength {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }
}
