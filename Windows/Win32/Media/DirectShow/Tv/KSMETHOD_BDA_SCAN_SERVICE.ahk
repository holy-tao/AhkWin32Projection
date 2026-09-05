#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSMETHOD_BDA_SCAN_SERVICE extends Win32Enum {

    /**
     * Native name: KSMETHOD_BDA_SCAN_CAPABILTIES
     * @type {Integer (Int32)}
     */
    static CAPABILTIES => 0

    /**
     * Native name: KSMETHOD_BDA_SCANNING_STATE
     * @type {Integer (Int32)}
     */
    static SCANNING_STATE => 1

    /**
     * Native name: KSMETHOD_BDA_SCAN_FILTER
     * @type {Integer (Int32)}
     */
    static FILTER => 2

    /**
     * Native name: KSMETHOD_BDA_SCAN_START
     * @type {Integer (Int32)}
     */
    static START => 3

    /**
     * Native name: KSMETHOD_BDA_SCAN_RESUME
     * @type {Integer (Int32)}
     */
    static RESUME => 4

    /**
     * Native name: KSMETHOD_BDA_SCAN_STOP
     * @type {Integer (Int32)}
     */
    static STOP => 5
}
