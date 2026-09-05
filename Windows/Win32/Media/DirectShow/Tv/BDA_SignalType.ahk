#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class BDA_SignalType extends Win32Enum {

    /**
     * Native name: Bda_SignalType_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: Bda_SignalType_Analog
     * @type {Integer (Int32)}
     */
    static Analog => 1

    /**
     * Native name: Bda_SignalType_Digital
     * @type {Integer (Int32)}
     */
    static Digital => 2
}
