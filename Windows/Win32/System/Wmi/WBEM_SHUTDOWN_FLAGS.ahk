#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WBEM_SHUTDOWN_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_SHUTDOWN_UNLOAD_COMPONENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_SHUTDOWN_WMI => 2

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_SHUTDOWN_OS => 3
}
