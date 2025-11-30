#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class NETSETUP_NAME_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NetSetupUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static NetSetupMachine => 1

    /**
     * @type {Integer (Int32)}
     */
    static NetSetupWorkgroup => 2

    /**
     * @type {Integer (Int32)}
     */
    static NetSetupDomain => 3

    /**
     * @type {Integer (Int32)}
     */
    static NetSetupNonExistentDomain => 4

    /**
     * @type {Integer (Int32)}
     */
    static NetSetupDnsMachine => 5
}
