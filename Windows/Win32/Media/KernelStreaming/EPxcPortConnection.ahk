#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class EPxcPortConnection extends Win32Enum {

    /**
     * Native name: ePortConnJack
     * @type {Integer (Int32)}
     */
    static ConnJack => 0

    /**
     * Native name: ePortConnIntegratedDevice
     * @type {Integer (Int32)}
     */
    static ConnIntegratedDevice => 1

    /**
     * Native name: ePortConnBothIntegratedAndJack
     * @type {Integer (Int32)}
     */
    static ConnBothIntegratedAndJack => 2

    /**
     * Native name: ePortConnUnknown
     * @type {Integer (Int32)}
     */
    static ConnUnknown => 3
}
