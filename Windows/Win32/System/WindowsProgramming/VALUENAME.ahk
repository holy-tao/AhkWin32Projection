#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class VALUENAME extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static VALUENAME_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static VALUENAME_ENTERPRISE_DEFINED_CLASS_ID => 1

    /**
     * @type {Integer (Int32)}
     */
    static VALUENAME_BUILT_IN_LIST => 2
}
