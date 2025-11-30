#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UNormalizationCheckResult extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UNORM_NO => 0

    /**
     * @type {Integer (Int32)}
     */
    static UNORM_YES => 1

    /**
     * @type {Integer (Int32)}
     */
    static UNORM_MAYBE => 2
}
