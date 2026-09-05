#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
class COMAdminComponentFlags extends Win32Enum {

    /**
     * Native name: COMAdminCompFlagTypeInfoFound
     * @type {Integer (Int32)}
     */
    static CompFlagTypeInfoFound => 1

    /**
     * Native name: COMAdminCompFlagCOMPlusPropertiesFound
     * @type {Integer (Int32)}
     */
    static CompFlagCOMPlusPropertiesFound => 2

    /**
     * Native name: COMAdminCompFlagProxyFound
     * @type {Integer (Int32)}
     */
    static CompFlagProxyFound => 4

    /**
     * Native name: COMAdminCompFlagInterfacesFound
     * @type {Integer (Int32)}
     */
    static CompFlagInterfacesFound => 8

    /**
     * Native name: COMAdminCompFlagAlreadyInstalled
     * @type {Integer (Int32)}
     */
    static CompFlagAlreadyInstalled => 16

    /**
     * Native name: COMAdminCompFlagNotInApplication
     * @type {Integer (Int32)}
     */
    static CompFlagNotInApplication => 32
}
