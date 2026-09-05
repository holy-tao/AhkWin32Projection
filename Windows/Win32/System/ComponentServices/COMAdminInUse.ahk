#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
class COMAdminInUse extends Win32Enum {

    /**
     * Native name: COMAdminNotInUse
     * @type {Integer (Int32)}
     */
    static NotInUse => 0

    /**
     * Native name: COMAdminInUseByCatalog
     * @type {Integer (Int32)}
     */
    static ByCatalog => 1

    /**
     * Native name: COMAdminInUseByRegistryUnknown
     * @type {Integer (Int32)}
     */
    static ByRegistryUnknown => 2

    /**
     * Native name: COMAdminInUseByRegistryProxyStub
     * @type {Integer (Int32)}
     */
    static ByRegistryProxyStub => 3

    /**
     * Native name: COMAdminInUseByRegistryTypeLib
     * @type {Integer (Int32)}
     */
    static ByRegistryTypeLib => 4

    /**
     * Native name: COMAdminInUseByRegistryClsid
     * @type {Integer (Int32)}
     */
    static ByRegistryClsid => 5
}
