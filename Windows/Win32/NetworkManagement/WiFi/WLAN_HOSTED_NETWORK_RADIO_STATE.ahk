#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DOT11_RADIO_STATE.ahk" { DOT11_RADIO_STATE }

/**
 * Contains information about the radio state on the wireless Hosted Network.
 * @remarks
 * The <b>WLAN_HOSTED_NETWORK_RADIO_STATE</b> structure is an extension to native wireless APIs added to support the wireless Hosted Network on Windows 7 and  later.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_hosted_network_radio_state
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_HOSTED_NETWORK_RADIO_STATE {
    #StructPack 4

    /**
     * The software radio state of the wireless Hosted Network.
     */
    dot11SoftwareRadioState : DOT11_RADIO_STATE

    /**
     * The hardware radio state of the wireless Hosted Network.
     */
    dot11HardwareRadioState : DOT11_RADIO_STATE

}
