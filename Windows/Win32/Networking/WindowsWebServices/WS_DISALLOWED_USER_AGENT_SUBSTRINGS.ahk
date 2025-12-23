#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the list of blocked UserAgent sub-string's. This is used with the WS_LISTENER_PROPERTY_DISALLOWED_USER_AGENT listener property.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_disallowed_user_agent_substrings
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_DISALLOWED_USER_AGENT_SUBSTRINGS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of items in 'prefixes'.
     * @type {Integer}
     */
    subStringCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of WS_STRING*. Each WS_STRING* would be searched as a sub-string in the UserAgent HTTP header value.
     * @type {Pointer<Pointer<WS_STRING>>}
     */
    subStrings {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
