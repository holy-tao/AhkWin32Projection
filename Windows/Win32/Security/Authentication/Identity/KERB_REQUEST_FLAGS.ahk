#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_REQUEST_FLAGS {
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
    static KERB_REQUEST_ADD_CREDENTIAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_REQUEST_REPLACE_CREDENTIAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KERB_REQUEST_REMOVE_CREDENTIAL => 4
}
