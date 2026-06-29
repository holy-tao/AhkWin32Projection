#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the SSID of an interface.
 * @remarks
 * The SSID that is specified by the **ucSSID** member is not a null-terminated ASCII string. The length of the SSID is determined by the **uSSIDLength** member.
 * 
 * A wildcard SSID is an SSID whose **uSSIDLength** member is set to zero. When the desired SSID is set to the wildcard SSID, the 802.11 station can connect to any basic service set (BSS) network.
 * @see https://learn.microsoft.com/windows/win32/NativeWiFi/dot11-ssid
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_SSID {
    #StructPack 4

    /**
     * The length, in bytes, of the **ucSSID** array.
     */
    uSSIDLength : UInt32

    /**
     * The SSID. DOT11\_SSID\_MAX\_LENGTH is set to 32.
     */
    ucSSID : Int8[32]

}
