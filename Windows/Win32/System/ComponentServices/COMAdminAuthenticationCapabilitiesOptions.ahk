#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct COMAdminAuthenticationCapabilitiesOptions {
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
    static COMAdminAuthenticationCapabilitiesNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminAuthenticationCapabilitiesSecureReference => 2

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminAuthenticationCapabilitiesStaticCloaking => 32

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminAuthenticationCapabilitiesDynamicCloaking => 64
}
