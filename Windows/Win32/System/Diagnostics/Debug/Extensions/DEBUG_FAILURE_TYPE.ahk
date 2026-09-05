#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class DEBUG_FAILURE_TYPE extends Win32Enum {

    /**
     * Native name: DEBUG_FLR_UNKNOWN
     * @type {Integer (Int32)}
     */
    static FLR_UNKNOWN => 0

    /**
     * Native name: DEBUG_FLR_KERNEL
     * @type {Integer (Int32)}
     */
    static FLR_KERNEL => 1

    /**
     * Native name: DEBUG_FLR_USER
     * @type {Integer (Int32)}
     */
    static FLR_USER => 2
}
