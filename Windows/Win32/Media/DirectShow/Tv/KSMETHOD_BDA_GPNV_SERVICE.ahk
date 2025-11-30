#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class KSMETHOD_BDA_GPNV_SERVICE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_GPNV_GETVALUE => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_GPNV_SETVALUE => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_GPNV_NAMEFROMINDEX => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_GPNV_GETVALUEUPDATENAME => 3
}
