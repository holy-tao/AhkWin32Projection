#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WCM_MEDIA_TYPE.ahk

/**
 * Contains information about a specific profile.
 * @see https://learn.microsoft.com/windows/win32/api/wcmapi/ns-wcmapi-wcm_profile_info
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectionManager
 */
class WCM_PROFILE_INFO extends Win32Struct {
    static sizeof => 528

    static packingSize => 8

    /**
     * Type: <b>WCHAR[WCM_MAX_PROFILE_NAME]</b>
     * 
     * The profile name.
     * @type {String}
     */
    strProfileName {
        get => StrGet(this.ptr + 0, 255, "UTF-16")
        set => StrPut(value, this.ptr + 0, 255, "UTF-16")
    }

    /**
     * Type: <b>GUID</b>
     * 
     * The GUID of the adapter.
     * @type {Pointer}
     */
    AdapterGUID {
        get => NumGet(this, 512, "ptr")
        set => NumPut("ptr", value, this, 512)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wcmapi/ne-wcmapi-wcm_media_type">WCM_MEDIA_TYPE</a></b>
     * 
     * The media type for the profile.
     * @type {WCM_MEDIA_TYPE}
     */
    Media {
        get => NumGet(this, 520, "int")
        set => NumPut("int", value, this, 520)
    }
}
