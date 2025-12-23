#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_ROUNDING_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DML_ROUNDING_MODE_HALVES_TO_NEAREST_EVEN => 0

    /**
     * @type {Integer (Int32)}
     */
    static DML_ROUNDING_MODE_TOWARD_ZERO => 1

    /**
     * @type {Integer (Int32)}
     */
    static DML_ROUNDING_MODE_TOWARD_INFINITY => 2
}
