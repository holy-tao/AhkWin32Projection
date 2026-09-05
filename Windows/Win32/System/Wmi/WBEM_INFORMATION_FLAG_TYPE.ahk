#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 */
class WBEM_INFORMATION_FLAG_TYPE extends Win32Enum {

    /**
     * Native name: WBEM_FLAG_SHORT_NAME
     * @type {Integer (Int32)}
     */
    static SHORT_NAME => 1

    /**
     * Native name: WBEM_FLAG_LONG_NAME
     * @type {Integer (Int32)}
     */
    static LONG_NAME => 2
}
