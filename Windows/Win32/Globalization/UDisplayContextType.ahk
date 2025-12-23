#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UDisplayContextType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UDISPCTX_TYPE_DIALECT_HANDLING => 0

    /**
     * @type {Integer (Int32)}
     */
    static UDISPCTX_TYPE_CAPITALIZATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static UDISPCTX_TYPE_DISPLAY_LENGTH => 2

    /**
     * @type {Integer (Int32)}
     */
    static UDISPCTX_TYPE_SUBSTITUTE_HANDLING => 3
}
