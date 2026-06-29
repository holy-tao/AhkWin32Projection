#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_CIPHER_ALGORITHM.ahk" { DOT11_CIPHER_ALGORITHM }
#Import ".\DOT11_AUTH_ALGORITHM.ahk" { DOT11_AUTH_ALGORITHM }

/**
 * Contains information about the security settings on the wireless Hosted Network.
 * @remarks
 * The <b>WLAN_HOSTED_NETWORK_SECURITY_SETTINGS</b>  structure is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and  later.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_hosted_network_security_settings
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_HOSTED_NETWORK_SECURITY_SETTINGS {
    #StructPack 4

    /**
     * The authentication algorithm used by the wireless Hosted Network.
     */
    dot11AuthAlgo : DOT11_AUTH_ALGORITHM

    /**
     * The cipher algorithm used by the wireless Hosted Network.
     */
    dot11CipherAlgo : DOT11_CIPHER_ALGORITHM

}
