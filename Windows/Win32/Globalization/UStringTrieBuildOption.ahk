#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class UStringTrieBuildOption extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static USTRINGTRIE_BUILD_FAST => 0

    /**
     * @type {Integer (Int32)}
     */
    static USTRINGTRIE_BUILD_SMALL => 1
}
