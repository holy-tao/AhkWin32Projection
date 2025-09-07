#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WCM_PROFILE_INFO.ahk

/**
 * Contains a list of profiles in preferred order.
 * @see https://learn.microsoft.com/windows/win32/api/wcmapi/ns-wcmapi-wcm_profile_info_list
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 * @version v4.0.30319
 */
class WCM_PROFILE_INFO_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of profiles in the list.
     * @type {Integer}
     */
    dwNumberOfItems {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ns-wcmapi-wcm_profile_info">WCM_PROFILE_INFO</a>[1]</b>
     * 
     * Information about each profile.
     * @type {Array<WCM_PROFILE_INFO>}
     */
    ProfileInfo{
        get {
            if(!this.HasProp("__ProfileInfoProxyArray"))
                this.__ProfileInfoProxyArray := Win32FixedArray(this.ptr + 8, 8, WCM_PROFILE_INFO, "")
            return this.__ProfileInfoProxyArray
        }
    }
}
