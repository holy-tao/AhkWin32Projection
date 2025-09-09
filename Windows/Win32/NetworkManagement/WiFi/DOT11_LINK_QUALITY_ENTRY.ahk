#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_LINK_QUALITY_ENTRY extends Win32Struct
{
    static sizeof => 7

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    PeerMacAddr{
        get {
            if(!this.HasProp("__PeerMacAddrProxyArray"))
                this.__PeerMacAddrProxyArray := Win32FixedArray(this.ptr + 0, 6, Primitive, "char")
            return this.__PeerMacAddrProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ucLinkQuality {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }
}
