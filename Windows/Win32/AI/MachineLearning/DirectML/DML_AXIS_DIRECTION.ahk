#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the direction of an operation along the given axis for the operator (for example, summation, selecting the top-k elements, selecting the minimum element).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ne-directml-dml_axis_direction
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_AXIS_DIRECTION extends Win32Enum{

    /**
     * Specifies increasing order (from the low index to the high index).
     * @type {Integer (Int32)}
     */
    static DML_AXIS_DIRECTION_INCREASING => 0

    /**
     * Specifies decreasing order (from the high index to the low index).
     * @type {Integer (Int32)}
     */
    static DML_AXIS_DIRECTION_DECREASING => 1
}
