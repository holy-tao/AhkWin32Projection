#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class KSMETHOD_OPMVIDEOOUTPUT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_OPMVIDEOOUTPUT_STARTINITIALIZATION => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_OPMVIDEOOUTPUT_FINISHINITIALIZATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_OPMVIDEOOUTPUT_GETINFORMATION => 2
}
