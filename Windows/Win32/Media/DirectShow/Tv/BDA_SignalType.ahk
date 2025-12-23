#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class BDA_SignalType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Bda_SignalType_Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static Bda_SignalType_Analog => 1

    /**
     * @type {Integer (Int32)}
     */
    static Bda_SignalType_Digital => 2
}
