#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPAUDIOSTATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SPAS_CLOSED => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPAS_STOP => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPAS_PAUSE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPAS_RUN => 3
}
