#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Basic information about a profile.
 * @see https://docs.microsoft.com/windows/win32/api//wlanapi/ns-wlanapi-wlan_profile_info
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_PROFILE_INFO extends Win32Struct
{
    static sizeof => 516

    static packingSize => 4

    /**
     * The name of the profile.  This value may be the name of a domain if the profile is for provisioning. Profile names are case-sensitive. This string must be NULL-terminated.
     * 
     * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>The name of the profile is derived automatically from the SSID of the wireless network. For infrastructure network profiles, the name of the profile is the SSID of the network. For ad hoc network profiles, the name of the profile is the SSID of the ad hoc network followed by <c>-adhoc</c>.
     * @type {String}
     */
    strProfileName {
        get => StrGet(this.ptr + 0, 255, "UTF-16")
        set => StrPut(value, this.ptr + 0, 255, "UTF-16")
    }

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
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 512, "uint")
        set => NumPut("uint", value, this, 512)
    }
}
