#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AMTunerSignalStrength extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static AMTUNER_HASNOSIGNALSTRENGTH => -1

    /**
     * @type {Integer (Int32)}
     */
    static AMTUNER_NOSIGNAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static AMTUNER_SIGNALPRESENT => 1
}
