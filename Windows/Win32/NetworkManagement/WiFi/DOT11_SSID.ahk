#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the SSID of an interface.
 * @remarks
 * The SSID that is specified by the **ucSSID** member is not a null-terminated ASCII string. The length of the SSID is determined by the **uSSIDLength** member.
  * 
  * A wildcard SSID is an SSID whose **uSSIDLength** member is set to zero. When the desired SSID is set to the wildcard SSID, the 802.11 station can connect to any basic service set (BSS) network.
 * @see https://learn.microsoft.com/windows/win32/NativeWiFi/dot11-ssid
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_SSID extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * The length, in bytes, of the **ucSSID** array.
     * @type {Integer}
     */
    uSSIDLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The SSID. DOT11\_SSID\_MAX\_LENGTH is set to 32.
     * @type {Array<Byte>}
     */
    ucSSID{
        get {
            if(!this.HasProp("__ucSSIDProxyArray"))
                this.__ucSSIDProxyArray := Win32FixedArray(this.ptr + 4, 32, Primitive, "char")
            return this.__ucSSIDProxyArray
        }
    }
}
