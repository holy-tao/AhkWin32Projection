#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_AUTH_INFORMATION_AUTH_TYPE {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_AUTH_TYPE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_AUTH_TYPE_NT4OWF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_AUTH_TYPE_CLEAR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_AUTH_TYPE_VERSION => 3
}
