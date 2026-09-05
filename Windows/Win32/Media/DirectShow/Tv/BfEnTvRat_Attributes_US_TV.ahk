#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class BfEnTvRat_Attributes_US_TV extends Win32Enum {

    /**
     * Native name: US_TV_IsBlocked
     * @type {Integer (Int32)}
     */
    static IsBlocked => 1

    /**
     * Native name: US_TV_IsViolent
     * @type {Integer (Int32)}
     */
    static IsViolent => 2

    /**
     * Native name: US_TV_IsSexualSituation
     * @type {Integer (Int32)}
     */
    static IsSexualSituation => 4

    /**
     * Native name: US_TV_IsAdultLanguage
     * @type {Integer (Int32)}
     */
    static IsAdultLanguage => 8

    /**
     * Native name: US_TV_IsSexuallySuggestiveDialog
     * @type {Integer (Int32)}
     */
    static IsSexuallySuggestiveDialog => 16

    /**
     * Native name: US_TV_ValidAttrSubmask
     * @type {Integer (Int32)}
     */
    static ValidAttrSubmask => 31
}
