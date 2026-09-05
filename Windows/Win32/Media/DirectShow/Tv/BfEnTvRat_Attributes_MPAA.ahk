#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class BfEnTvRat_Attributes_MPAA extends Win32Enum {

    /**
     * Native name: MPAA_IsBlocked
     * @type {Integer (Int32)}
     */
    static IsBlocked => 1

    /**
     * Native name: MPAA_ValidAttrSubmask
     * @type {Integer (Int32)}
     */
    static ValidAttrSubmask => 1
}
