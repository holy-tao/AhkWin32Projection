#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class SHCNRF_SOURCE extends Win32BitflagEnum {

    /**
     * Native name: SHCNRF_InterruptLevel
     * @type {Integer (Int32)}
     */
    static InterruptLevel => 1

    /**
     * Native name: SHCNRF_ShellLevel
     * @type {Integer (Int32)}
     */
    static ShellLevel => 2

    /**
     * Native name: SHCNRF_RecursiveInterrupt
     * @type {Integer (Int32)}
     */
    static RecursiveInterrupt => 4096

    /**
     * Native name: SHCNRF_NewDelivery
     * @type {Integer (Int32)}
     */
    static NewDelivery => 32768
}
