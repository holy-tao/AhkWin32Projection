#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class BfEnTvRat_Attributes_US_TV extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static US_TV_IsBlocked => 1

    /**
     * @type {Integer (Int32)}
     */
    static US_TV_IsViolent => 2

    /**
     * @type {Integer (Int32)}
     */
    static US_TV_IsSexualSituation => 4

    /**
     * @type {Integer (Int32)}
     */
    static US_TV_IsAdultLanguage => 8

    /**
     * @type {Integer (Int32)}
     */
    static US_TV_IsSexuallySuggestiveDialog => 16

    /**
     * @type {Integer (Int32)}
     */
    static US_TV_ValidAttrSubmask => 31
}
