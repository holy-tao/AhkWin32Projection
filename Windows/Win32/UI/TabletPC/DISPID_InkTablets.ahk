#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class DISPID_InkTablets extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITs_NewEnum => -4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITsItem => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITsDefaultTablet => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITsCount => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ITsIsPacketPropertySupported => 3
}
