#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that differentiate between a primary token and an impersonation token.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-token_type
 * @namespace Windows.Win32.Security
 */
export default struct TOKEN_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates a primary token.
     * @type {Integer (Int32)}
     */
    static TokenPrimary => 1

    /**
     * Indicates an impersonation token.
     * @type {Integer (Int32)}
     */
    static TokenImpersonation => 2
}
