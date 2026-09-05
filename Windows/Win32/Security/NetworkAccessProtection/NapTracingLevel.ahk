#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 */
class NapTracingLevel extends Win32Enum {

    /**
     * Native name: tracingLevelUndefined
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * Native name: tracingLevelBasic
     * @type {Integer (Int32)}
     */
    static Basic => 1

    /**
     * Native name: tracingLevelAdvanced
     * @type {Integer (Int32)}
     */
    static Advanced => 2

    /**
     * Native name: tracingLevelDebug
     * @type {Integer (Int32)}
     */
    static Debug => 3
}
