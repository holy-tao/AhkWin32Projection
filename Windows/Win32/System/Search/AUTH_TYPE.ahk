#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes authentication types for content access.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ne-searchapi-auth_type
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class AUTH_TYPE{

    /**
     * Anonymous.
     * @type {Integer (Int32)}
     */
    static eAUTH_TYPE_ANONYMOUS => 0

    /**
     * NTLM challenge/response.
     * @type {Integer (Int32)}
     */
    static eAUTH_TYPE_NTLM => 1

    /**
     * Basic authentication.
     * @type {Integer (Int32)}
     */
    static eAUTH_TYPE_BASIC => 2
}
