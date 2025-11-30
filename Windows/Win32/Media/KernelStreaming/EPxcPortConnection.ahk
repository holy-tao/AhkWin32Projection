#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class EPxcPortConnection extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ePortConnJack => 0

    /**
     * @type {Integer (Int32)}
     */
    static ePortConnIntegratedDevice => 1

    /**
     * @type {Integer (Int32)}
     */
    static ePortConnBothIntegratedAndJack => 2

    /**
     * @type {Integer (Int32)}
     */
    static ePortConnUnknown => 3
}
