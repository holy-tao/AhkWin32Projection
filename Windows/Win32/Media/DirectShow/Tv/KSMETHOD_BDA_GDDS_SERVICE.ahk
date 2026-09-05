#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSMETHOD_BDA_GDDS_SERVICE extends Win32Enum {

    /**
     * Native name: KSMETHOD_BDA_GDDS_DATATYPE
     * @type {Integer (Int32)}
     */
    static DATATYPE => 0

    /**
     * Native name: KSMETHOD_BDA_GDDS_DATA
     * @type {Integer (Int32)}
     */
    static DATA => 1

    /**
     * Native name: KSMETHOD_BDA_GDDS_TUNEXMLFROMIDX
     * @type {Integer (Int32)}
     */
    static TUNEXMLFROMIDX => 2

    /**
     * Native name: KSMETHOD_BDA_GDDS_GETSERVICES
     * @type {Integer (Int32)}
     */
    static GETSERVICES => 3

    /**
     * Native name: KSMETHOD_BDA_GDDS_SERVICEFROMTUNEXML
     * @type {Integer (Int32)}
     */
    static SERVICEFROMTUNEXML => 4

    /**
     * Native name: KSMETHOD_BDA_GDDS_DATAUPDATE
     * @type {Integer (Int32)}
     */
    static DATAUPDATE => 5
}
