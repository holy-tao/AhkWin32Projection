#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class DEBUG_FAILURE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_KERNEL => 1

    /**
     * @type {Integer (Int32)}
     */
    static DEBUG_FLR_USER => 2
}
