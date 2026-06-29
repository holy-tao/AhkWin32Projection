#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security
 */
export default struct CREATE_RESTRICTED_TOKEN_FLAGS {
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
    static DISABLE_MAX_PRIVILEGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SANDBOX_INERT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LUA_TOKEN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WRITE_RESTRICTED => 8
}
