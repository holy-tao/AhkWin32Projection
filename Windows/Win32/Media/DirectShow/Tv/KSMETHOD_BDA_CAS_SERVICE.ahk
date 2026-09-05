#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSMETHOD_BDA_CAS_SERVICE extends Win32Enum {

    /**
     * Native name: KSMETHOD_BDA_CAS_CHECKENTITLEMENTTOKEN
     * @type {Integer (Int32)}
     */
    static CHECKENTITLEMENTTOKEN => 0

    /**
     * Native name: KSMETHOD_BDA_CAS_SETCAPTURETOKEN
     * @type {Integer (Int32)}
     */
    static SETCAPTURETOKEN => 1

    /**
     * Native name: KSMETHOD_BDA_CAS_OPENBROADCASTMMI
     * @type {Integer (Int32)}
     */
    static OPENBROADCASTMMI => 2

    /**
     * Native name: KSMETHOD_BDA_CAS_CLOSEMMIDIALOG
     * @type {Integer (Int32)}
     */
    static CLOSEMMIDIALOG => 3
}
