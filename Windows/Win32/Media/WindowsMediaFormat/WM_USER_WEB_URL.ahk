#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The WM_USER_WEB_URL structure is used as the data item for the WM/UserWebURL complex metadata attribute.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wm_user_web_url
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WM_USER_WEB_URL {
    #StructPack 8

    /**
     * Pointer to a wide-character null-terminated string containing the description of the Web site pointed to by the URL.
     */
    pwszDescription : PWSTR

    /**
     * Pointer to a wide-character null-terminated string containing the URL.
     */
    pwszURL : PWSTR

}
