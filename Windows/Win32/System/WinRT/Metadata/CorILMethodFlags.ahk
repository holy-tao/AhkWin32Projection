#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CorILMethodFlags{

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_InitLocals => 16

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_MoreSects => 8

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_CompressedIL => 64

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_FormatShift => 3

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_FormatMask => 7

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_TinyFormat => 2

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_SmallFormat => 0

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_FatFormat => 3

    /**
     * @type {Integer (Int32)}
     */
    static CorILMethod_TinyFormat1 => 6
}
