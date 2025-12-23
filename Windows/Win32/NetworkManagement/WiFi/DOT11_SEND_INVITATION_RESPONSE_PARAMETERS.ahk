#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk
#Include .\DOT11_WFD_CONFIGURATION_TIMEOUT.ahk
#Include .\DOT11_WFD_CHANNEL.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_SEND_INVITATION_RESPONSE_PARAMETERS extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {NDIS_OBJECT_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NDIS_OBJECT_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {Array<Byte>}
     */
    ReceiverDeviceAddress{
        get {
            if(!this.HasProp("__ReceiverDeviceAddressProxyArray"))
                this.__ReceiverDeviceAddressProxyArray := Win32FixedArray(this.ptr + 4, 6, Primitive, "char")
            return this.__ReceiverDeviceAddressProxyArray
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
     * @type {DOT11_WFD_CONFIGURATION_TIMEOUT}
     */
    MinimumConfigTimeout{
        get {
            if(!this.HasProp("__MinimumConfigTimeout"))
                this.__MinimumConfigTimeout := DOT11_WFD_CONFIGURATION_TIMEOUT(29, this)
            return this.__MinimumConfigTimeout
        }
    }

    /**
     * @type {Array<Byte>}
     */
    GroupBSSID{
        get {
            if(!this.HasProp("__GroupBSSIDProxyArray"))
                this.__GroupBSSIDProxyArray := Win32FixedArray(this.ptr + 31, 6, Primitive, "char")
            return this.__GroupBSSIDProxyArray
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bUseGroupBSSID {
        get => NumGet(this, 37, "char")
        set => NumPut("char", value, this, 37)
    }

    /**
     * @type {DOT11_WFD_CHANNEL}
     */
    OperatingChannel{
        get {
            if(!this.HasProp("__OperatingChannel"))
                this.__OperatingChannel := DOT11_WFD_CHANNEL(38, this)
            return this.__OperatingChannel
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bUseSpecifiedOperatingChannel {
        get => NumGet(this, 43, "char")
        set => NumPut("char", value, this, 43)
    }

    /**
     * @type {Integer}
     */
    uIEsOffset {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    uIEsLength {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
