#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class BDA_Channel_Bandwidth extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BDA_CHAN_BANDWITH_NOT_SET => -1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_CHAN_BANDWITH_NOT_DEFINED => 0
}
