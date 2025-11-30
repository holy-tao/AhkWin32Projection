#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class KSMETHOD_BDA_WMDRM_TUNER extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_WMDRMTUNER_CANCELCAPTURETOKEN => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_WMDRMTUNER_SETPIDPROTECTION => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_WMDRMTUNER_GETPIDPROTECTION => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_WMDRMTUNER_SETSYNCVALUE => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_WMDRMTUNER_STARTCODEPROFILE => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_WMDRMTUNER_PURCHASE_ENTITLEMENT => 5
}
