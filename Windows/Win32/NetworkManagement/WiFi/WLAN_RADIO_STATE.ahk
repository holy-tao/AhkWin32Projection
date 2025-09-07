#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WLAN_PHY_RADIO_STATE.ahk

/**
 * Specifies the radio state on a list of physical layer (PHY) types.
 * @remarks
 * The <b>WLAN_RADIO_STATE</b> structure is used with the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanqueryinterface">WlanQueryInterface</a> function when the <i>OpCode</i> parameter is set to <b>wlan_intf_opcode_radio_state</b>. If the call is successful, the <i>ppData</i> parameter points to a <b>WLAN_RADIO_STATE</b> structure. 
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_phy_radio_state">WLAN_PHY_RADIO_STATE</a> structure members in the <b>WLAN_RADIO_STATE</b> structure can be used with the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetinterface">WlanSetInterface</a> function when the <i>OpCode</i> parameter is set to <b>wlan_intf_opcode_radio_state</b> to change the radio state. 
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_phy_radio_state">WLAN_PHY_RADIO_STATE</a> structure is also used for  notification by the media specific module (MSM) when the radio state changes. An application registers to receive MSM notifications by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanregisternotification">WlanRegisterNotification</a> function with the <i>dwNotifSource</i> parameter set to a value that includes <b>WLAN_NOTIFICATION_SOURCE_MSM</b>. For more information on these notifications, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure and the <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_notification_msm-r1">WLAN_NOTIFICATION_MSM</a> enumeration reference.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_radio_state
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_RADIO_STATE extends Win32Struct
{
    static sizeof => 520

    static packingSize => 8

    /**
     * The number of valid PHY indices in the <b>PhyRadioState</b> member.
     * @type {Integer}
     */
    dwNumberOfPhys {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_phy_radio_state">WLAN_PHY_RADIO_STATE</a> structures that specify the radio states of a number of PHY indices. Only the first <b>dwNumberOfPhys</b> entries in this array are valid.
     * @type {Array<WLAN_PHY_RADIO_STATE>}
     */
    PhyRadioState{
        get {
            if(!this.HasProp("__PhyRadioStateProxyArray"))
                this.__PhyRadioStateProxyArray := Win32FixedArray(this.ptr + 8, 8, WLAN_PHY_RADIO_STATE, "")
            return this.__PhyRadioStateProxyArray
        }
    }
}
