#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class COMAdminInUse extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminNotInUse => 0

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminInUseByCatalog => 1

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminInUseByRegistryUnknown => 2

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminInUseByRegistryProxyStub => 3

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminInUseByRegistryTypeLib => 4

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminInUseByRegistryClsid => 5
}
