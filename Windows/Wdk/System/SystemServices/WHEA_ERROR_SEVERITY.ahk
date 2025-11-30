#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_ERROR_SEVERITY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSevRecoverable => 0

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSevFatal => 1

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSevCorrected => 2

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSevInformational => 3
}
