#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct COMAdminAuthenticationLevelOptions {
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
    static COMAdminAuthenticationDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminAuthenticationNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminAuthenticationConnect => 2

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminAuthenticationCall => 3

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminAuthenticationPacket => 4

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminAuthenticationIntegrity => 5

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminAuthenticationPrivacy => 6
}
