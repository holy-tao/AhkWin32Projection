#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class DCOM_CALL_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DCOM_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DCOM_CALL_COMPLETE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DCOM_CALL_CANCELED => 2
}
