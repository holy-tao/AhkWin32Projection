#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UScriptUsage extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_USAGE_NOT_ENCODED => 0

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_USAGE_UNKNOWN => 1

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_USAGE_EXCLUDED => 2

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_USAGE_LIMITED_USE => 3

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_USAGE_ASPIRATIONAL => 4

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_USAGE_RECOMMENDED => 5
}
