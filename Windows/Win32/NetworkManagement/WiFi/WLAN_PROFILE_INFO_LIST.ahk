#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WLAN_PROFILE_INFO.ahk" { WLAN_PROFILE_INFO }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains a list of wireless profile information.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_profile_info_list
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_PROFILE_INFO_LIST {
    #StructPack 4

    /**
     * The number of wireless profile entries in the <b>ProfileInfo</b> member.
     */
    dwNumberOfItems : UInt32

    /**
     * The index of the current item.  The index of the first item is 0. The <b>dwIndex</b> member must be less than the <b>dwNumberOfItems</b> member.
     * 
     * This member is not used by the wireless service. Applications can use this member when processing individual profiles in the   <b>WLAN_PROFILE_INFO_LIST</b> structure. When an application passes this structure from one function to another, it can set the value of <b>dwIndex</b> to the index of the item currently being processed. This can help an application maintain state.  
     * 
     * <b>dwIndex</b> should always be initialized before use.
     */
    dwIndex : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ns-wlanapi-wlan_profile_info">WLAN_PROFILE_INFO</a> structures containing interface information. The number of items in the array is specified in the <b>dwNumberOfItems</b> member.
     */
    ProfileInfo : WLAN_PROFILE_INFO[1]

}
