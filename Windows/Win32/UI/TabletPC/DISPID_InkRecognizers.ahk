#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkRecognizers extends Win32Enum {

    /**
     * Native name: DISPID_IRecos_NewEnum
     * @type {Integer (Int32)}
     */
    static IRecos_NewEnum => -4

    /**
     * Native name: DISPID_IRecosItem
     * @type {Integer (Int32)}
     */
    static IRecosItem => 0

    /**
     * Native name: DISPID_IRecosCount
     * @type {Integer (Int32)}
     */
    static IRecosCount => 1

    /**
     * Native name: DISPID_IRecosGetDefaultRecognizer
     * @type {Integer (Int32)}
     */
    static IRecosGetDefaultRecognizer => 2
}
