#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
class DML_ROUNDING_MODE extends Win32Enum {

    /**
     * Native name: DML_ROUNDING_MODE_HALVES_TO_NEAREST_EVEN
     * @type {Integer (Int32)}
     */
    static HALVES_TO_NEAREST_EVEN => 0

    /**
     * Native name: DML_ROUNDING_MODE_TOWARD_ZERO
     * @type {Integer (Int32)}
     */
    static TOWARD_ZERO => 1

    /**
     * Native name: DML_ROUNDING_MODE_TOWARD_INFINITY
     * @type {Integer (Int32)}
     */
    static TOWARD_INFINITY => 2
}
