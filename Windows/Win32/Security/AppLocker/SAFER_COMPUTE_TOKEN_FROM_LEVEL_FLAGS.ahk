#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.AppLocker
 */
export default struct SAFER_COMPUTE_TOKEN_FROM_LEVEL_FLAGS {
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
    static SAFER_TOKEN_NULL_IF_EQUAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_TOKEN_COMPARE_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_TOKEN_MAKE_INERT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SAFER_TOKEN_WANT_FLAGS => 8
}
