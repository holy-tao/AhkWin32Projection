#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_INVITATION_REQUEST_SEND_COMPLETE_PARAMETERS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

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
    PeerDeviceAddress{
        get {
            if(!this.HasProp("__PeerDeviceAddressProxyArray"))
                this.__PeerDeviceAddressProxyArray := Win32FixedArray(this.ptr + 4, 6, Primitive, "char")
            return this.__PeerDeviceAddressProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    ReceiverAddress{
        get {
            if(!this.HasProp("__ReceiverAddressProxyArray"))
                this.__ReceiverAddressProxyArray := Win32FixedArray(this.ptr + 10, 6, Primitive, "char")
            return this.__ReceiverAddressProxyArray
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
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    uIEsOffset {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    uIEsLength {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
