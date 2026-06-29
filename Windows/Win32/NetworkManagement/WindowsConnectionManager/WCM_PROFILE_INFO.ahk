#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WCM_MEDIA_TYPE.ahk" { WCM_MEDIA_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information about a specific profile.
 * @see https://learn.microsoft.com/windows/win32/api/wcmapi/ns-wcmapi-wcm_profile_info
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 */
export default struct WCM_PROFILE_INFO {
    #StructPack 4

    /**
     * Type: <b>WCHAR[WCM_MAX_PROFILE_NAME]</b>
     * 
     * The profile name.
     */
    strProfileName : WCHAR[256]

    /**
     * Type: <b>GUID</b>
     * 
     * The GUID of the adapter.
     */
    AdapterGUID : Guid

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ne-wcmapi-wcm_media_type">WCM_MEDIA_TYPE</a></b>
     * 
     * The media type for the profile.
     */
    Media : WCM_MEDIA_TYPE

}
