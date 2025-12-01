#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the radio state.
 * @remarks
 * The <b>WLAN_PHY_RADIO_STATE</b> structure is used with the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetinterface">WlanSetInterface</a> function when the <i>OpCode</i> parameter is set to <b>wlan_intf_opcode_radio_state</b>. 
 * 
 * The <b>WLAN_PHY_RADIO_STATE</b> structure is also used for  notification by the media specific module (MSM) when the radio state changes. An application registers to receive MSM notifications by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanregisternotification">WlanRegisterNotification</a> function with the <i>dwNotifSource</i> parameter set to a value that includes <b>WLAN_NOTIFICATION_SOURCE_MSM</b>. For more information on these notifications, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure and the <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_notification_msm-r1">WLAN_NOTIFICATION_MSM</a> enumeration reference.
 * 
 * The radio state of a PHY is off if either <b>dot11SoftwareRadioState</b> or <b>dot11HardwareRadioState</b> member of the <b>WLAN_PHY_RADIO_STATE</b> structure is <b>dot11_radio_state_off</b>.
 * 
 * The hardware radio state cannot be changed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetinterface">WlanSetInterface</a> function.  The <b>dot11HardwareRadioState</b> member of the <b>WLAN_PHY_RADIO_STATE</b> structure is ignored when  the <b>WlanSetInterface</b> function is called with the <i>OpCode</i> parameter set to <b>wlan_intf_opcode_radio_state</b> and the <i>pData</i> parameter points to a <b>WLAN_PHY_RADIO_STATE</b> structure. 
 * 
 * The software radio state can be changed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetinterface">WlanSetInterface</a> function.   
 * 
 * Changing the software radio state of a physical network interface could cause related changes in the state of the wireless Hosted Network or virtual wireless adapter radio states. The PHYs of every virtual wireless adapter are linked. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/about-the-wireless-hosted-network">About the Wireless Hosted Network</a>.
 * 
 * The radio state of a PHY is off if either the software radio state (<b>dot11SoftwareRadioState</b> member) or the hardware radio state (<b>dot11HardwareRadioState</b> member) is off.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_phy_radio_state
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_PHY_RADIO_STATE extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The index of the PHY type on which the radio state is being set or queried. The <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlangetinterfacecapability">WlanGetInterfaceCapability</a> function returns a list of valid PHY types.
     * @type {Integer}
     */
    dwPhyIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-dot11_radio_state-r1">DOT11_RADIO_STATE</a> value that indicates the software radio state.
     * @type {Integer}
     */
    dot11SoftwareRadioState {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-dot11_radio_state-r1">DOT11_RADIO_STATE</a> value that indicates the hardware radio state.
     * @type {Integer}
     */
    dot11HardwareRadioState {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
