#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_GENERAL_MEDIA_EVENT_TYPE extends Win32Enum {

    /**
     * Native name: CxlGeneralMediaEventType_MediaEccError
     * @type {Integer (Int32)}
     */
    static MediaEccError => 0

    /**
     * Native name: CxlGeneralMediaEventType_InvAddress
     * @type {Integer (Int32)}
     */
    static InvAddress => 1

    /**
     * Native name: CxlGeneralMediaEventType_DataPathError
     * @type {Integer (Int32)}
     */
    static DataPathError => 2

    /**
     * Native name: CxlGeneralMediaEventType_TeStateViolation
     * @type {Integer (Int32)}
     */
    static TeStateViolation => 3

    /**
     * Native name: CxlGeneralMediaEventType_ScrubMediaEccError
     * @type {Integer (Int32)}
     */
    static ScrubMediaEccError => 4

    /**
     * Native name: CxlGeneralMediaEventType_AdvProgCorrMemErrCounterExp
     * @type {Integer (Int32)}
     */
    static AdvProgCorrMemErrCounterExp => 5

    /**
     * Native name: CxlGeneralMediaEventType_CkidViolation
     * @type {Integer (Int32)}
     */
    static CkidViolation => 6
}
