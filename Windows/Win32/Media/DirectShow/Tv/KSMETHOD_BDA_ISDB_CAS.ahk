#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSMETHOD_BDA_ISDB_CAS extends Win32Enum {

    /**
     * Native name: KSMETHOD_BDA_ISDBCAS_SETREQUEST
     * @type {Integer (Int32)}
     */
    static ISDBCAS_SETREQUEST => 0

    /**
     * Native name: KSMETHOD_BDA_ISDBCAS_RESPONSEDATA
     * @type {Integer (Int32)}
     */
    static ISDBCAS_RESPONSEDATA => 1
}
