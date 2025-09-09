#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk
#Include .\DOT11_SSID.ahk
#Include .\DOT11_WFD_GROUP_ID.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_SEND_PROVISION_DISCOVERY_REQUEST_PARAMETERS extends Win32Struct
{
    static sizeof => 88

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
     * @type {Integer}
     */
    DialogToken {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    PeerDeviceAddress{
        get {
            if(!this.HasProp("__PeerDeviceAddressProxyArray"))
                this.__PeerDeviceAddressProxyArray := Win32FixedArray(this.ptr + 5, 6, Primitive, "char")
            return this.__PeerDeviceAddressProxyArray
        }
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
    GroupCapability {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {DOT11_WFD_GROUP_ID}
     */
    GroupID{
        get {
            if(!this.HasProp("__GroupID"))
                this.__GroupID := DOT11_WFD_GROUP_ID(this.ptr + 24)
            return this.__GroupID
        }
    }

    /**
     * @type {Integer}
     */
    bUseGroupID {
        get => NumGet(this, 72, "char")
        set => NumPut("char", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    uIEsOffset {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    uIEsLength {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }
}
