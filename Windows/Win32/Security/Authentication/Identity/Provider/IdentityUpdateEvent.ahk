#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 */
export default struct IdentityUpdateEvent {
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
    static IDENTITY_ASSOCIATED => 1

    /**
     * @type {Integer (Int32)}
     */
    static IDENTITY_DISASSOCIATED => 2

    /**
     * @type {Integer (Int32)}
     */
    static IDENTITY_CREATED => 4

    /**
     * @type {Integer (Int32)}
     */
    static IDENTITY_IMPORTED => 8

    /**
     * @type {Integer (Int32)}
     */
    static IDENTITY_DELETED => 16

    /**
     * @type {Integer (Int32)}
     */
    static IDENTITY_PROPCHANGED => 32

    /**
     * @type {Integer (Int32)}
     */
    static IDENTITY_CONNECTED => 64

    /**
     * @type {Integer (Int32)}
     */
    static IDENTITY_DISCONNECTED => 128
}
