#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 */
class WBEM_SHUTDOWN_FLAGS extends Win32Enum {

    /**
     * Native name: WBEM_SHUTDOWN_UNLOAD_COMPONENT
     * @type {Integer (Int32)}
     */
    static UNLOAD_COMPONENT => 1

    /**
     * Native name: WBEM_SHUTDOWN_WMI
     * @type {Integer (Int32)}
     */
    static WMI => 2

    /**
     * Native name: WBEM_SHUTDOWN_OS
     * @type {Integer (Int32)}
     */
    static OS => 3
}
