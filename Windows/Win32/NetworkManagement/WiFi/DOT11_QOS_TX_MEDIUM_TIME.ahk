#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_QOS_TX_MEDIUM_TIME extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Array<Byte>}
     */
    dot11PeerAddress{
        get {
            if(!this.HasProp("__dot11PeerAddressProxyArray"))
                this.__dot11PeerAddressProxyArray := Win32FixedArray(this.ptr + 0, 6, Primitive, "char")
            return this.__dot11PeerAddressProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ucQoSPriority {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    uMediumTimeAdmited {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
