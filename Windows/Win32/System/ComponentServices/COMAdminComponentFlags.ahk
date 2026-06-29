#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct COMAdminComponentFlags {
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
    static COMAdminCompFlagTypeInfoFound => 1

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminCompFlagCOMPlusPropertiesFound => 2

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminCompFlagProxyFound => 4

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminCompFlagInterfacesFound => 8

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminCompFlagAlreadyInstalled => 16

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminCompFlagNotInApplication => 32
}
