#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk
#Include .\DOT11_WFD_CONFIGURATION_TIMEOUT.ahk
#Include .\DOT11_WFD_INVITATION_FLAGS.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
#Include .\DOT11_WFD_CHANNEL.ahk
#Include .\DOT11_SSID.ahk
#Include .\DOT11_WFD_GROUP_ID.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_SEND_INVITATION_REQUEST_PARAMETERS extends Win32Struct
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
     * @type {DOT11_WFD_CONFIGURATION_TIMEOUT}
     */
    MinimumConfigTimeout{
        get {
            if(!this.HasProp("__MinimumConfigTimeout"))
                this.__MinimumConfigTimeout := DOT11_WFD_CONFIGURATION_TIMEOUT(this.ptr + 16)
            return this.__MinimumConfigTimeout
        }
    }

    /**
     * @type {DOT11_WFD_INVITATION_FLAGS}
     */
    InvitationFlags{
        get {
            if(!this.HasProp("__InvitationFlags"))
                this.__InvitationFlags := DOT11_WFD_INVITATION_FLAGS(this.ptr + 18)
            return this.__InvitationFlags
        }
    }

    /**
     * @type {Array<Byte>}
     */
    GroupBSSID{
        get {
            if(!this.HasProp("__GroupBSSIDProxyArray"))
                this.__GroupBSSIDProxyArray := Win32FixedArray(this.ptr + 19, 6, Primitive, "char")
            return this.__GroupBSSIDProxyArray
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bUseGroupBSSID{
        get {
            if(!this.HasProp("__bUseGroupBSSID"))
                this.__bUseGroupBSSID := BOOLEAN(this.ptr + 25)
            return this.__bUseGroupBSSID
        }
    }

    /**
     * @type {DOT11_WFD_CHANNEL}
     */
    OperatingChannel{
        get {
            if(!this.HasProp("__OperatingChannel"))
                this.__OperatingChannel := DOT11_WFD_CHANNEL(this.ptr + 30)
            return this.__OperatingChannel
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bUseSpecifiedOperatingChannel{
        get {
            if(!this.HasProp("__bUseSpecifiedOperatingChannel"))
                this.__bUseSpecifiedOperatingChannel := BOOLEAN(this.ptr + 35)
            return this.__bUseSpecifiedOperatingChannel
        }
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
    bLocalGO{
        get {
            if(!this.HasProp("__bLocalGO"))
                this.__bLocalGO := BOOLEAN(this.ptr + 88)
            return this.__bLocalGO
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
