#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_STRING.ahk" { WS_STRING }

/**
 * Specifies the list of blocked UserAgent sub-string's. This is used with the WS_LISTENER_PROPERTY_DISALLOWED_USER_AGENT listener property.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_disallowed_user_agent_substrings
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_DISALLOWED_USER_AGENT_SUBSTRINGS {
    #StructPack 8

    /**
     * The number of items in 'prefixes'.
     */
    subStringCount : UInt32

    /**
     * An array of WS_STRING*. Each WS_STRING* would be searched as a sub-string in the UserAgent HTTP header value.
     */
    subStrings : IntPtr

}
