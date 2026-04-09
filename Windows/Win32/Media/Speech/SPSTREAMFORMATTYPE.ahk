#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class SPSTREAMFORMATTYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SPWF_INPUT => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPWF_SRENGINE => 1
}
