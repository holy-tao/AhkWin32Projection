#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
class CorILMethodSect extends Win32Enum {

    /**
     * Native name: CorILMethod_Sect_Reserved
     * @type {Integer (Int32)}
     */
    static Reserved => 0

    /**
     * Native name: CorILMethod_Sect_EHTable
     * @type {Integer (Int32)}
     */
    static EHTable => 1

    /**
     * Native name: CorILMethod_Sect_OptILTable
     * @type {Integer (Int32)}
     */
    static OptILTable => 2

    /**
     * Native name: CorILMethod_Sect_KindMask
     * @type {Integer (Int32)}
     */
    static KindMask => 63

    /**
     * Native name: CorILMethod_Sect_FatFormat
     * @type {Integer (Int32)}
     */
    static FatFormat => 64

    /**
     * Native name: CorILMethod_Sect_MoreSects
     * @type {Integer (Int32)}
     */
    static MoreSects => 128
}
