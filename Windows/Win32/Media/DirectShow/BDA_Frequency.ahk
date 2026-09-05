#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class BDA_Frequency extends Win32Enum {

    /**
     * Native name: BDA_FREQUENCY_NOT_SET
     * @type {Integer (Int32)}
     */
    static NOT_SET => -1

    /**
     * Native name: BDA_FREQUENCY_NOT_DEFINED
     * @type {Integer (Int32)}
     */
    static NOT_DEFINED => 0
}
