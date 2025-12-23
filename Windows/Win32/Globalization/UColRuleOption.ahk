#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UColRuleOption extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_TAILORING_ONLY => 0

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_FULL_RULES => 1
}
