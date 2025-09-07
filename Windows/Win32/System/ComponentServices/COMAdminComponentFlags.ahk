#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class COMAdminComponentFlags{

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
