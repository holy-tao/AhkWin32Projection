#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class BDA_Channel_Bandwidth extends Win32Enum {

    /**
     * Native name: BDA_CHAN_BANDWITH_NOT_SET
     * @type {Integer (Int32)}
     */
    static CHAN_BANDWITH_NOT_SET => -1

    /**
     * Native name: BDA_CHAN_BANDWITH_NOT_DEFINED
     * @type {Integer (Int32)}
     */
    static CHAN_BANDWITH_NOT_DEFINED => 0
}
