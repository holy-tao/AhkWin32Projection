#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_RECEIVED_PROVISION_DISCOVERY_REQUEST_PARAMETERS extends Win32Struct
{
    static sizeof => 40

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
    TransmitterDeviceAddress{
        get {
            if(!this.HasProp("__TransmitterDeviceAddressProxyArray"))
                this.__TransmitterDeviceAddressProxyArray := Win32FixedArray(this.ptr + 4, 6, Primitive, "char")
            return this.__TransmitterDeviceAddressProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    BSSID{
        get {
            if(!this.HasProp("__BSSIDProxyArray"))
                this.__BSSIDProxyArray := Win32FixedArray(this.ptr + 10, 6, Primitive, "char")
            return this.__BSSIDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    DialogToken {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Pointer<Void>}
     */
    RequestContext {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    uIEsOffset {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    uIEsLength {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
