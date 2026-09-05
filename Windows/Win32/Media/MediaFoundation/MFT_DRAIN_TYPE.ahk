#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFT_DRAIN_TYPE extends Win32Enum {

    /**
     * Native name: MFT_DRAIN_PRODUCE_TAILS
     * @type {Integer (Int32)}
     */
    static PRODUCE_TAILS => 0

    /**
     * Native name: MFT_DRAIN_NO_TAILS
     * @type {Integer (Int32)}
     */
    static NO_TAILS => 1
}
