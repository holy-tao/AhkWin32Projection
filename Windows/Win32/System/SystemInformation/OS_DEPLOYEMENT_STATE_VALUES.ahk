#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class OS_DEPLOYEMENT_STATE_VALUES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static OS_DEPLOYMENT_STANDARD => 1

    /**
     * @type {Integer (Int32)}
     */
    static OS_DEPLOYMENT_COMPACT => 2
}
