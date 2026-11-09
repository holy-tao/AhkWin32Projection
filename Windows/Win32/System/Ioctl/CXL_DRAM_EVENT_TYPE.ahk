#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_DRAM_EVENT_TYPE extends Win32Enum {

    /**
     * Native name: CxlDRAMEventType_MediaEccError
     * @type {Integer (Int32)}
     */
    static MediaEccError => 0

    /**
     * Native name: CxlDRAMEventType_ScrubMediaEccError
     * @type {Integer (Int32)}
     */
    static ScrubMediaEccError => 1

    /**
     * Native name: CxlDRAMEventType_InvAddress
     * @type {Integer (Int32)}
     */
    static InvAddress => 2

    /**
     * Native name: CxlDRAMEventType_DataPathError
     * @type {Integer (Int32)}
     */
    static DataPathError => 3

    /**
     * Native name: CxlDRAMEventType_TeStateViolation
     * @type {Integer (Int32)}
     */
    static TeStateViolation => 4

    /**
     * Native name: CxlDRAMEventType_AdvProgCorrMemErrCounterExp
     * @type {Integer (Int32)}
     */
    static AdvProgCorrMemErrCounterExp => 5

    /**
     * Native name: CxlDRAMEventType_CkidViolation
     * @type {Integer (Int32)}
     */
    static CkidViolation => 6
}
