#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class PROP_INFO_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PROP_INFO_NAME => 1

    /**
     * @type {Integer (Int32)}
     */
    static PROP_INFO_TYPE => 2

    /**
     * @type {Integer (Int32)}
     */
    static PROP_INFO_VALUE => 4

    /**
     * @type {Integer (Int32)}
     */
    static PROP_INFO_FULLNAME => 32

    /**
     * @type {Integer (Int32)}
     */
    static PROP_INFO_ATTRIBUTES => 8

    /**
     * @type {Integer (Int32)}
     */
    static PROP_INFO_DEBUGPROP => 16

    /**
     * @type {Integer (Int32)}
     */
    static PROP_INFO_AUTOEXPAND => 134217728
}
