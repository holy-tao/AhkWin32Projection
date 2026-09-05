#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class BDA_SIGNAL_STATE extends Win32Enum {

    /**
     * Native name: BDA_SIGNAL_UNAVAILABLE
     * @type {Integer (Int32)}
     */
    static UNAVAILABLE => 0

    /**
     * Native name: BDA_SIGNAL_INACTIVE
     * @type {Integer (Int32)}
     */
    static INACTIVE => 1

    /**
     * Native name: BDA_SIGNAL_ACTIVE
     * @type {Integer (Int32)}
     */
    static ACTIVE => 2
}
