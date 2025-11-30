#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class ExtendedArrayDimensionFlags extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ExtendedArrayLengthIsOffset32 => 1

    /**
     * @type {Integer (Int32)}
     */
    static ExtendedArrayLengthIsOffset64 => 2

    /**
     * @type {Integer (Int32)}
     */
    static ExtendedArrayLengthIsOffset => 3

    /**
     * @type {Integer (Int32)}
     */
    static ExtendedArrayLowerBoundIsOffset32 => 4

    /**
     * @type {Integer (Int32)}
     */
    static ExtendedArrayLowerBoundIsOffset64 => 8

    /**
     * @type {Integer (Int32)}
     */
    static ExtendedArrayLowerBoundIsOffset => 12

    /**
     * @type {Integer (Int32)}
     */
    static ExtendedArrayStrideIsOffset32 => 16

    /**
     * @type {Integer (Int32)}
     */
    static ExtendedArrayStrideIsOffset64 => 32

    /**
     * @type {Integer (Int32)}
     */
    static ExtendedArrayStrideIsOffset => 48

    /**
     * @type {Integer (Int32)}
     */
    static ExtendedArrayStrideIsComputedByNextRank => 64

    /**
     * @type {Integer (Int32)}
     */
    static ExtendedArrayStrideIsComputedByPreviousRank => 128

    /**
     * @type {Integer (Int32)}
     */
    static ExtendedArrayStrideIsComputed => 192
}
