#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSMETHOD_BDA_WMDRM_TUNER extends Win32Enum {

    /**
     * Native name: KSMETHOD_BDA_WMDRMTUNER_CANCELCAPTURETOKEN
     * @type {Integer (Int32)}
     */
    static WMDRMTUNER_CANCELCAPTURETOKEN => 0

    /**
     * Native name: KSMETHOD_BDA_WMDRMTUNER_SETPIDPROTECTION
     * @type {Integer (Int32)}
     */
    static WMDRMTUNER_SETPIDPROTECTION => 1

    /**
     * Native name: KSMETHOD_BDA_WMDRMTUNER_GETPIDPROTECTION
     * @type {Integer (Int32)}
     */
    static WMDRMTUNER_GETPIDPROTECTION => 2

    /**
     * Native name: KSMETHOD_BDA_WMDRMTUNER_SETSYNCVALUE
     * @type {Integer (Int32)}
     */
    static WMDRMTUNER_SETSYNCVALUE => 3

    /**
     * Native name: KSMETHOD_BDA_WMDRMTUNER_STARTCODEPROFILE
     * @type {Integer (Int32)}
     */
    static WMDRMTUNER_STARTCODEPROFILE => 4

    /**
     * Native name: KSMETHOD_BDA_WMDRMTUNER_PURCHASE_ENTITLEMENT
     * @type {Integer (Int32)}
     */
    static WMDRMTUNER_PURCHASE_ENTITLEMENT => 5
}
