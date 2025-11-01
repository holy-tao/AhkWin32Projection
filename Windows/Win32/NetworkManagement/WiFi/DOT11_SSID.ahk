#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/NativeWiFi/dot11-ssid
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_SSID extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * @type {Integer}
     */
    uSSIDLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
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
