#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class ExtendedArrayDimensionFlags extends Win32Enum {

    /**
     * Native name: ExtendedArrayLengthIsOffset32
     * @type {Integer (Int32)}
     */
    static LengthIsOffset32 => 1

    /**
     * Native name: ExtendedArrayLengthIsOffset64
     * @type {Integer (Int32)}
     */
    static LengthIsOffset64 => 2

    /**
     * Native name: ExtendedArrayLengthIsOffset
     * @type {Integer (Int32)}
     */
    static LengthIsOffset => 3

    /**
     * Native name: ExtendedArrayLowerBoundIsOffset32
     * @type {Integer (Int32)}
     */
    static LowerBoundIsOffset32 => 4

    /**
     * Native name: ExtendedArrayLowerBoundIsOffset64
     * @type {Integer (Int32)}
     */
    static LowerBoundIsOffset64 => 8

    /**
     * Native name: ExtendedArrayLowerBoundIsOffset
     * @type {Integer (Int32)}
     */
    static LowerBoundIsOffset => 12

    /**
     * Native name: ExtendedArrayStrideIsOffset32
     * @type {Integer (Int32)}
     */
    static StrideIsOffset32 => 16

    /**
     * Native name: ExtendedArrayStrideIsOffset64
     * @type {Integer (Int32)}
     */
    static StrideIsOffset64 => 32

    /**
     * Native name: ExtendedArrayStrideIsOffset
     * @type {Integer (Int32)}
     */
    static StrideIsOffset => 48

    /**
     * Native name: ExtendedArrayStrideIsComputedByNextRank
     * @type {Integer (Int32)}
     */
    static StrideIsComputedByNextRank => 64

    /**
     * Native name: ExtendedArrayStrideIsComputedByPreviousRank
     * @type {Integer (Int32)}
     */
    static StrideIsComputedByPreviousRank => 128

    /**
     * Native name: ExtendedArrayStrideIsComputed
     * @type {Integer (Int32)}
     */
    static StrideIsComputed => 192
}
