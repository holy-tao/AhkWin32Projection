#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class MPEGLAYER3WAVEFORMAT_FLAGS extends Win32Enum {

    /**
     * Native name: MPEGLAYER3_FLAG_PADDING_ISO
     * @type {Integer (UInt32)}
     */
    static FLAG_PADDING_ISO => 0

    /**
     * Native name: MPEGLAYER3_FLAG_PADDING_ON
     * @type {Integer (UInt32)}
     */
    static FLAG_PADDING_ON => 1

    /**
     * Native name: MPEGLAYER3_FLAG_PADDING_OFF
     * @type {Integer (UInt32)}
     */
    static FLAG_PADDING_OFF => 2
}
