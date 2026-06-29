#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The type of delegation used.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ne-sspi-secdelegationtype
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecDelegationType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static SecFull => 0

    /**
     * @type {Integer (Int32)}
     */
    static SecService => 1

    /**
     * @type {Integer (Int32)}
     */
    static SecTree => 2

    /**
     * @type {Integer (Int32)}
     */
    static SecDirectory => 3

    /**
     * @type {Integer (Int32)}
     */
    static SecObject => 4
}
