#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CorILMethodSect extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_Sect_Reserved => 0

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_Sect_EHTable => 1

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_Sect_OptILTable => 2

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_Sect_KindMask => 63

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_Sect_FatFormat => 64

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_Sect_MoreSects => 128
}
