#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSMETHOD_BDA_USERACTIVITY_SERVICE extends Win32Enum {

    /**
     * Native name: KSMETHOD_BDA_USERACTIVITY_USEREASON
     * @type {Integer (Int32)}
     */
    static USEREASON => 0

    /**
     * Native name: KSMETHOD_BDA_USERACTIVITY_INTERVAL
     * @type {Integer (Int32)}
     */
    static INTERVAL => 1

    /**
     * Native name: KSMETHOD_BDA_USERACTIVITY_DETECTED
     * @type {Integer (Int32)}
     */
    static DETECTED => 2
}
