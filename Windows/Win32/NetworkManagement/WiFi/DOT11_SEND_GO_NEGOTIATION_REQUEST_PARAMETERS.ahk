#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk
#Include .\DOT11_WFD_CONFIGURATION_TIMEOUT.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_SEND_GO_NEGOTIATION_REQUEST_PARAMETERS extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

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
                this.__PeerDeviceAddressProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
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
     * @type {Integer}
     */
    uSendTimeout {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    GroupOwnerIntent {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {DOT11_WFD_CONFIGURATION_TIMEOUT}
     */
    MinimumConfigTimeout{
        get {
            if(!this.HasProp("__MinimumConfigTimeout"))
                this.__MinimumConfigTimeout := DOT11_WFD_CONFIGURATION_TIMEOUT(this.ptr + 18)
            return this.__MinimumConfigTimeout
        }
    }

    /**
     * @type {Array<Byte>}
     */
    IntendedInterfaceAddress{
        get {
            if(!this.HasProp("__IntendedInterfaceAddressProxyArray"))
                this.__IntendedInterfaceAddressProxyArray := Win32FixedArray(this.ptr + 20, 1, Primitive, "char")
            return this.__IntendedInterfaceAddressProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    GroupCapability {
        get => NumGet(this, 26, "char")
        set => NumPut("char", value, this, 26)
    }

    /**
     * @type {Integer}
     */
    uIEsOffset {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    uIEsLength {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
