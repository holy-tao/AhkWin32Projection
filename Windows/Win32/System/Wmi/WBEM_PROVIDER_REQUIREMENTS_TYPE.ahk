#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 */
class WBEM_PROVIDER_REQUIREMENTS_TYPE extends Win32Enum {

    /**
     * Native name: WBEM_REQUIREMENTS_START_POSTFILTER
     * @type {Integer (Int32)}
     */
    static START_POSTFILTER => 0

    /**
     * Native name: WBEM_REQUIREMENTS_STOP_POSTFILTER
     * @type {Integer (Int32)}
     */
    static STOP_POSTFILTER => 1

    /**
     * Native name: WBEM_REQUIREMENTS_RECHECK_SUBSCRIPTIONS
     * @type {Integer (Int32)}
     */
    static RECHECK_SUBSCRIPTIONS => 2
}
