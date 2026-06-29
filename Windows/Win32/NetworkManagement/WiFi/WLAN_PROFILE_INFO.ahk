#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Basic information about a profile.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_profile_info
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct WLAN_PROFILE_INFO {
    #StructPack 4

    /**
     * The name of the profile.  This value may be the name of a domain if the profile is for provisioning. Profile names are case-sensitive. This string must be NULL-terminated.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>The name of the profile is derived automatically from the SSID of the wireless network. For infrastructure network profiles, the name of the profile is the SSID of the network. For ad hoc network profiles, the name of the profile is the SSID of the ad hoc network followed by <c>-adhoc</c>.
     */
    strProfileName : WCHAR[256]

    /**
     * A set of flags specifying settings for wireless profile. These values are defined in the <i>Wlanapi.h</i> header file. 
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b><i>dwFlags</i> must be 0. Per-user profiles are not supported.
     * 
     * 
     * Combinations of these flag bits are possible
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WLAN_PROFILE_GROUP_POLICY"></a><a id="wlan_profile_group_policy"></a><dl>
     * <dt><b>WLAN_PROFILE_GROUP_POLICY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag indicates that this profile was created by group policy.  A group policy profile is read-only. Neither the content nor the preference order of the profile can be changed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WLAN_PROFILE_USER"></a><a id="wlan_profile_user"></a><dl>
     * <dt><b>WLAN_PROFILE_USER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag indicates that the profile is a per-user profile.  If not set, this profile is an all-user profile.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

}
