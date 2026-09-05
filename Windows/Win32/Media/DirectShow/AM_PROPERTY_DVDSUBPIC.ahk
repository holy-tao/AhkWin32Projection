#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class AM_PROPERTY_DVDSUBPIC extends Win32Enum {

    /**
     * Native name: AM_PROPERTY_DVDSUBPIC_PALETTE
     * @type {Integer (Int32)}
     */
    static PALETTE => 0

    /**
     * Native name: AM_PROPERTY_DVDSUBPIC_HLI
     * @type {Integer (Int32)}
     */
    static HLI => 1

    /**
     * Native name: AM_PROPERTY_DVDSUBPIC_COMPOSIT_ON
     * @type {Integer (Int32)}
     */
    static COMPOSIT_ON => 2
}
