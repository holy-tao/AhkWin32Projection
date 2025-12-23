#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk
#Include .\DOT11_WFD_CONFIGURATION_TIMEOUT.ahk
#Include .\DOT11_WFD_INVITATION_FLAGS.ahk
#Include .\DOT11_WFD_CHANNEL.ahk
#Include .\DOT11_SSID.ahk
#Include .\DOT11_WFD_GROUP_ID.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_SEND_INVITATION_REQUEST_PARAMETERS extends Win32Struct
{
    static sizeof => 88

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
                this.__MinimumConfigTimeout := DOT11_WFD_CONFIGURATION_TIMEOUT(16, this)
            return this.__MinimumConfigTimeout
        }
    }

    /**
     * @type {DOT11_WFD_INVITATION_FLAGS}
     */
    InvitationFlags{
        get {
            if(!this.HasProp("__InvitationFlags"))
                this.__InvitationFlags := DOT11_WFD_INVITATION_FLAGS(18, this)
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
    bUseGroupBSSID {
        get => NumGet(this, 25, "char")
        set => NumPut("char", value, this, 25)
    }

    /**
     * @type {DOT11_WFD_CHANNEL}
     */
    OperatingChannel{
        get {
            if(!this.HasProp("__OperatingChannel"))
                this.__OperatingChannel := DOT11_WFD_CHANNEL(26, this)
            return this.__OperatingChannel
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bUseSpecifiedOperatingChannel {
        get => NumGet(this, 31, "char")
        set => NumPut("char", value, this, 31)
    }

    /**
     * @type {DOT11_WFD_GROUP_ID}
     */
    GroupID{
        get {
            if(!this.HasProp("__GroupID"))
                this.__GroupID := DOT11_WFD_GROUP_ID(32, this)
            return this.__GroupID
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bLocalGO {
        get => NumGet(this, 76, "char")
        set => NumPut("char", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    uIEsOffset {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    uIEsLength {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }
}
