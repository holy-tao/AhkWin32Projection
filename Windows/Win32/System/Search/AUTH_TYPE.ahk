#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes authentication types for content access.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ne-searchapi-auth_type
 * @namespace Windows.Win32.System.Search
 */
export default struct AUTH_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
