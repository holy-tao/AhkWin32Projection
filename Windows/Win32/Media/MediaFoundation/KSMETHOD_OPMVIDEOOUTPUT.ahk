#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class KSMETHOD_OPMVIDEOOUTPUT extends Win32Enum {

    /**
     * Native name: KSMETHOD_OPMVIDEOOUTPUT_STARTINITIALIZATION
     * @type {Integer (Int32)}
     */
    static STARTINITIALIZATION => 0

    /**
     * Native name: KSMETHOD_OPMVIDEOOUTPUT_FINISHINITIALIZATION
     * @type {Integer (Int32)}
     */
    static FINISHINITIALIZATION => 1

    /**
     * Native name: KSMETHOD_OPMVIDEOOUTPUT_GETINFORMATION
     * @type {Integer (Int32)}
     */
    static GETINFORMATION => 2
}
