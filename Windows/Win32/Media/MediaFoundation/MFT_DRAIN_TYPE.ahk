#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFT_DRAIN_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static MFT_DRAIN_PRODUCE_TAILS => 0

    /**
     * @type {Integer (Int32)}
     */
    static MFT_DRAIN_NO_TAILS => 1
}
