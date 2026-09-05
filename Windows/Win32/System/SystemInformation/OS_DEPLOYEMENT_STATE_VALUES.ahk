#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemInformation
 */
class OS_DEPLOYEMENT_STATE_VALUES extends Win32Enum {

    /**
     * Native name: OS_DEPLOYMENT_STANDARD
     * @type {Integer (Int32)}
     */
    static DEPLOYMENT_STANDARD => 1

    /**
     * Native name: OS_DEPLOYMENT_COMPACT
     * @type {Integer (Int32)}
     */
    static DEPLOYMENT_COMPACT => 2
}
