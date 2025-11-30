#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class MLOperatorEdgeType extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static Undefined => 0

    /**
     * @type {Integer (UInt32)}
     */
    static Tensor => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SequenceTensor => 2

    /**
     * @type {Integer (UInt32)}
     */
    static Primitive => 3
}
