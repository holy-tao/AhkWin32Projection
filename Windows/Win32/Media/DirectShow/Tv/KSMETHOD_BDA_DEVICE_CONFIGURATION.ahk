#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSMETHOD_BDA_DEVICE_CONFIGURATION extends Win32Enum {

    /**
     * Native name: KSMETHOD_BDA_CREATE_PIN_FACTORY
     * @type {Integer (Int32)}
     */
    static CREATE_PIN_FACTORY => 0

    /**
     * Native name: KSMETHOD_BDA_DELETE_PIN_FACTORY
     * @type {Integer (Int32)}
     */
    static DELETE_PIN_FACTORY => 1

    /**
     * Native name: KSMETHOD_BDA_CREATE_TOPOLOGY
     * @type {Integer (Int32)}
     */
    static CREATE_TOPOLOGY => 2
}
