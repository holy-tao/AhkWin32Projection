#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UGender extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UGENDER_MALE => 0

    /**
     * @type {Integer (Int32)}
     */
    static UGENDER_FEMALE => 1

    /**
     * @type {Integer (Int32)}
     */
    static UGENDER_OTHER => 2
}
