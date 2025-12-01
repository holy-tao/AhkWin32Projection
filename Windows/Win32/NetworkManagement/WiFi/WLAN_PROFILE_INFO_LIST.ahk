#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WLAN_PROFILE_INFO.ahk

/**
 * Contains a list of wireless profile information.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_profile_info_list
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_PROFILE_INFO_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of wireless profile entries in the <b>ProfileInfo</b> member.
     * @type {Integer}
     */
    dwNumberOfItems {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The index of the current item.  The index of the first item is 0. The <b>dwIndex</b> member must be less than the <b>dwNumberOfItems</b> member.
     * 
     * This member is not used by the wireless service. Applications can use this member when processing individual profiles in the   <b>WLAN_PROFILE_INFO_LIST</b> structure. When an application passes this structure from one function to another, it can set the value of <b>dwIndex</b> to the index of the item currently being processed. This can help an application maintain state.  
     * 
     * <b>dwIndex</b> should always be initialized before use.
     * @type {Integer}
     */
    dwIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_profile_info">WLAN_PROFILE_INFO</a> structures containing interface information. The number of items in the array is specified in the <b>dwNumberOfItems</b> member.
     * @type {Array<WLAN_PROFILE_INFO>}
     */
    ProfileInfo{
        get {
            if(!this.HasProp("__ProfileInfoProxyArray"))
                this.__ProfileInfoProxyArray := Win32FixedArray(this.ptr + 8, 1, WLAN_PROFILE_INFO, "")
            return this.__ProfileInfoProxyArray
        }
    }
}
