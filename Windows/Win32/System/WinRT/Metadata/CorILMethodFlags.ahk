#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
class CorILMethodFlags extends Win32Enum {

    /**
     * Native name: CorILMethod_InitLocals
     * @type {Integer (Int32)}
     */
    static InitLocals => 16

    /**
     * Native name: CorILMethod_MoreSects
     * @type {Integer (Int32)}
     */
    static MoreSects => 8

    /**
     * Native name: CorILMethod_CompressedIL
     * @type {Integer (Int32)}
     */
    static CompressedIL => 64

    /**
     * Native name: CorILMethod_FormatShift
     * @type {Integer (Int32)}
     */
    static FormatShift => 3

    /**
     * Native name: CorILMethod_FormatMask
     * @type {Integer (Int32)}
     */
    static FormatMask => 7

    /**
     * Native name: CorILMethod_TinyFormat
     * @type {Integer (Int32)}
     */
    static TinyFormat => 2

    /**
     * Native name: CorILMethod_SmallFormat
     * @type {Integer (Int32)}
     */
    static SmallFormat => 0

    /**
     * Native name: CorILMethod_FatFormat
     * @type {Integer (Int32)}
     */
    static FatFormat => 3

    /**
     * Native name: CorILMethod_TinyFormat1
     * @type {Integer (Int32)}
     */
    static TinyFormat1 => 6
}
