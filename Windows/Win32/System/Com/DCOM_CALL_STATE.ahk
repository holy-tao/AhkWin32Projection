#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com
 */
class DCOM_CALL_STATE extends Win32Enum {

    /**
     * Native name: DCOM_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: DCOM_CALL_COMPLETE
     * @type {Integer (Int32)}
     */
    static COMPLETE => 1

    /**
     * Native name: DCOM_CALL_CANCELED
     * @type {Integer (Int32)}
     */
    static CANCELED => 2
}
