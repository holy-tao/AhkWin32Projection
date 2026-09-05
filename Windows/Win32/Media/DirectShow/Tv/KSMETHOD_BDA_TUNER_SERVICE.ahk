#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSMETHOD_BDA_TUNER_SERVICE extends Win32Enum {

    /**
     * Native name: KSMETHOD_BDA_TUNER_SETTUNER
     * @type {Integer (Int32)}
     */
    static SETTUNER => 0

    /**
     * Native name: KSMETHOD_BDA_TUNER_GETTUNERSTATE
     * @type {Integer (Int32)}
     */
    static GETTUNERSTATE => 1

    /**
     * Native name: KSMETHOD_BDA_TUNER_SIGNALNOISERATIO
     * @type {Integer (Int32)}
     */
    static SIGNALNOISERATIO => 2
}
