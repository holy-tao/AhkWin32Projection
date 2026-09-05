#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_ERROR_SEVERITY extends Win32Enum {

    /**
     * Native name: WheaErrSevRecoverable
     * @type {Integer (Int32)}
     */
    static ErrSevRecoverable => 0

    /**
     * Native name: WheaErrSevFatal
     * @type {Integer (Int32)}
     */
    static ErrSevFatal => 1

    /**
     * Native name: WheaErrSevCorrected
     * @type {Integer (Int32)}
     */
    static ErrSevCorrected => 2

    /**
     * Native name: WheaErrSevInformational
     * @type {Integer (Int32)}
     */
    static ErrSevInformational => 3
}
