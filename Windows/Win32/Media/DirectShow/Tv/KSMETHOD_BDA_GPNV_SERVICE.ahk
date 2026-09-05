#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSMETHOD_BDA_GPNV_SERVICE extends Win32Enum {

    /**
     * Native name: KSMETHOD_BDA_GPNV_GETVALUE
     * @type {Integer (Int32)}
     */
    static GETVALUE => 0

    /**
     * Native name: KSMETHOD_BDA_GPNV_SETVALUE
     * @type {Integer (Int32)}
     */
    static SETVALUE => 1

    /**
     * Native name: KSMETHOD_BDA_GPNV_NAMEFROMINDEX
     * @type {Integer (Int32)}
     */
    static NAMEFROMINDEX => 2

    /**
     * Native name: KSMETHOD_BDA_GPNV_GETVALUEUPDATENAME
     * @type {Integer (Int32)}
     */
    static GETVALUEUPDATENAME => 3
}
