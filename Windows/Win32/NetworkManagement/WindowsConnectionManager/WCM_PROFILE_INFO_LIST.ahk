#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WCM_PROFILE_INFO.ahk" { WCM_PROFILE_INFO }
#Import ".\WCM_MEDIA_TYPE.ahk" { WCM_MEDIA_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains a list of profiles in preferred order.
 * @see https://learn.microsoft.com/windows/win32/api/wcmapi/ns-wcmapi-wcm_profile_info_list
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 */
export default struct WCM_PROFILE_INFO_LIST {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of profiles in the list.
     */
    dwNumberOfItems : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ns-wcmapi-wcm_profile_info">WCM_PROFILE_INFO</a>[1]</b>
     * 
     * Information about each profile.
     */
    ProfileInfo : WCM_PROFILE_INFO[1]

}
