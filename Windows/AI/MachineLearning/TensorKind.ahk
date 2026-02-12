#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!IMPORTANT]
  * > For the latest documentation about Windows Machine Learning, see [What is Windows ML](/windows/ai/new-windows-ml/overview). That documentation describes APIs that are in the **Microsoft.Windows.AI.MachineLearning** namespace, which ships in the Windows App SDK. Those APIs supersede the ones documented here, which are in the **Windows.AI.MachineLearning** namespace, and were shipped in 2018.
  * 
  * Defines the list of supported tensor data types.
 * @remarks
 * A tensor is a multi-dimensional array of values.
 * 
 * The layout of tensors is row-major, with tightly packed contiguous data representing each dimension. The total size of a tensor is the product of the size of each dimension.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.tensorkind
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class TensorKind extends Win32Enum{

    /**
     * Invalid type.
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * The tensor type is 32-bit floating point.
     * @type {Integer (Int32)}
     */
    static Float => 1

    /**
     * The tensor type is 8-bit unsigned integer.
     * @type {Integer (Int32)}
     */
    static UInt8 => 2

    /**
     * The tensor type is 8-bit signed integer.
     * @type {Integer (Int32)}
     */
    static Int8 => 3

    /**
     * The tensor type is 16-bit unsigned integer.
     * @type {Integer (Int32)}
     */
    static UInt16 => 4

    /**
     * The tensor type is 16-bit signed integer.
     * @type {Integer (Int32)}
     */
    static Int16 => 5

    /**
     * The tensor type is 32-bit signed integer.
     * @type {Integer (Int32)}
     */
    static Int32 => 6

    /**
     * The tensor type is 64-bit signed integer.
     * @type {Integer (Int32)}
     */
    static Int64 => 7

    /**
     * The tensor type is **String**.
     * @type {Integer (Int32)}
     */
    static String => 8

    /**
     * The tensor type is **Boolean**.
     * @type {Integer (Int32)}
     */
    static Boolean => 9

    /**
     * The tensor type is 16-bit floating point.
     * @type {Integer (Int32)}
     */
    static Float16 => 10

    /**
     * The tensor type is 64-bit floating point.
     * @type {Integer (Int32)}
     */
    static Double => 11

    /**
     * The tensor type is 32-bit unsigned integer.
     * @type {Integer (Int32)}
     */
    static UInt32 => 12

    /**
     * The tensor type is 64-bit unsigned integer.
     * @type {Integer (Int32)}
     */
    static UInt64 => 13

    /**
     * Invalid type.
     * @type {Integer (Int32)}
     */
    static Complex64 => 14

    /**
     * Invalid type.
     * @type {Integer (Int32)}
     */
    static Complex128 => 15
}
