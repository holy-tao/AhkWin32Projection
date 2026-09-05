#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class DitherType extends Win32Enum {

    /**
     * Native name: DitherTypeNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: DitherTypeSolid
     * @type {Integer (Int32)}
     */
    static Solid => 1

    /**
     * Native name: DitherTypeOrdered4x4
     * @type {Integer (Int32)}
     */
    static Ordered4x4 => 2

    /**
     * Native name: DitherTypeOrdered8x8
     * @type {Integer (Int32)}
     */
    static Ordered8x8 => 3

    /**
     * Native name: DitherTypeOrdered16x16
     * @type {Integer (Int32)}
     */
    static Ordered16x16 => 4

    /**
     * Native name: DitherTypeSpiral4x4
     * @type {Integer (Int32)}
     */
    static Spiral4x4 => 5

    /**
     * Native name: DitherTypeSpiral8x8
     * @type {Integer (Int32)}
     */
    static Spiral8x8 => 6

    /**
     * Native name: DitherTypeDualSpiral4x4
     * @type {Integer (Int32)}
     */
    static DualSpiral4x4 => 7

    /**
     * Native name: DitherTypeDualSpiral8x8
     * @type {Integer (Int32)}
     */
    static DualSpiral8x8 => 8

    /**
     * Native name: DitherTypeErrorDiffusion
     * @type {Integer (Int32)}
     */
    static ErrorDiffusion => 9

    /**
     * Native name: DitherTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 10
}
