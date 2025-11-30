#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class ULocaleDataExemplarSetType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ULOCDATA_ES_STANDARD => 0

    /**
     * @type {Integer (Int32)}
     */
    static ULOCDATA_ES_AUXILIARY => 1

    /**
     * @type {Integer (Int32)}
     */
    static ULOCDATA_ES_INDEX => 2

    /**
     * @type {Integer (Int32)}
     */
    static ULOCDATA_ES_PUNCTUATION => 3
}
