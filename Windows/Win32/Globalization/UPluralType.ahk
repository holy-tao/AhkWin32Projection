#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UPluralType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UPLURAL_TYPE_CARDINAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static UPLURAL_TYPE_ORDINAL => 1
}
