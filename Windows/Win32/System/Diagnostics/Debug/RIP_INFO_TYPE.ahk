#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class RIP_INFO_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SLE_ERROR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SLE_MINORERROR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SLE_WARNING => 3
}
