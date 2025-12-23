#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UCurrencyUsage extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UCURR_USAGE_STANDARD => 0

    /**
     * @type {Integer (Int32)}
     */
    static UCURR_USAGE_CASH => 1
}
