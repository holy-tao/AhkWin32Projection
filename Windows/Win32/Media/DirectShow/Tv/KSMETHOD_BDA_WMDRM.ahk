#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSMETHOD_BDA_WMDRM extends Win32Enum {

    /**
     * Native name: KSMETHOD_BDA_WMDRM_STATUS
     * @type {Integer (Int32)}
     */
    static STATUS => 0

    /**
     * Native name: KSMETHOD_BDA_WMDRM_REVINFO
     * @type {Integer (Int32)}
     */
    static REVINFO => 1

    /**
     * Native name: KSMETHOD_BDA_WMDRM_CRL
     * @type {Integer (Int32)}
     */
    static CRL => 2

    /**
     * Native name: KSMETHOD_BDA_WMDRM_MESSAGE
     * @type {Integer (Int32)}
     */
    static MESSAGE => 3

    /**
     * Native name: KSMETHOD_BDA_WMDRM_REISSUELICENSE
     * @type {Integer (Int32)}
     */
    static REISSUELICENSE => 4

    /**
     * Native name: KSMETHOD_BDA_WMDRM_RENEWLICENSE
     * @type {Integer (Int32)}
     */
    static RENEWLICENSE => 5

    /**
     * Native name: KSMETHOD_BDA_WMDRM_LICENSE
     * @type {Integer (Int32)}
     */
    static LICENSE => 6

    /**
     * Native name: KSMETHOD_BDA_WMDRM_KEYINFO
     * @type {Integer (Int32)}
     */
    static KEYINFO => 7
}
