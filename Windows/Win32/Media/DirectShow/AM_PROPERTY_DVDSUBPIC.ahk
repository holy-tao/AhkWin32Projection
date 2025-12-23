#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_PROPERTY_DVDSUBPIC extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static AM_PROPERTY_DVDSUBPIC_PALETTE => 0

    /**
     * @type {Integer (Int32)}
     */
    static AM_PROPERTY_DVDSUBPIC_HLI => 1

    /**
     * @type {Integer (Int32)}
     */
    static AM_PROPERTY_DVDSUBPIC_COMPOSIT_ON => 2
}
