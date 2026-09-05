#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkTablets extends Win32Enum {

    /**
     * Native name: DISPID_ITs_NewEnum
     * @type {Integer (Int32)}
     */
    static ITs_NewEnum => -4

    /**
     * Native name: DISPID_ITsItem
     * @type {Integer (Int32)}
     */
    static ITsItem => 0

    /**
     * Native name: DISPID_ITsDefaultTablet
     * @type {Integer (Int32)}
     */
    static ITsDefaultTablet => 1

    /**
     * Native name: DISPID_ITsCount
     * @type {Integer (Int32)}
     */
    static ITsCount => 2

    /**
     * Native name: DISPID_ITsIsPacketPropertySupported
     * @type {Integer (Int32)}
     */
    static ITsIsPacketPropertySupported => 3
}
