#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class MPEGLAYER3WAVEFORMAT_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static MPEGLAYER3_FLAG_PADDING_ISO => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MPEGLAYER3_FLAG_PADDING_ON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MPEGLAYER3_FLAG_PADDING_OFF => 2
}
