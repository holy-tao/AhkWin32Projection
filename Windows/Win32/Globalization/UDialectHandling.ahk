#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class UDialectHandling extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static ULDN_STANDARD_NAMES => 0

    /**
     * @type {Integer (Int32)}
     */
    static ULDN_DIALECT_NAMES => 1
}
