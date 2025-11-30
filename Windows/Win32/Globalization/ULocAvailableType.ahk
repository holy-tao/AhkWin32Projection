#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class ULocAvailableType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ULOC_AVAILABLE_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static ULOC_AVAILABLE_ONLY_LEGACY_ALIASES => 1

    /**
     * @type {Integer (Int32)}
     */
    static ULOC_AVAILABLE_WITH_LEGACY_ALIASES => 2
}
