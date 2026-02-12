#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * **Deprecated.** Defines the list of supported feature data types.
 * @remarks
 * > [!Warning]
 * > This is a deprecated API. Please use the [Windows.AI.MachineLearning](../windows.ai.machinelearning/windows_ai_machinelearning.md) namespace instead.
 * @see https://learn.microsoft.com/uwp/api/windows.ai.machinelearning.preview.featureelementkindpreview
 * @namespace Windows.AI.MachineLearning.Preview
 * @version WindowsRuntime 1.4
 */
class FeatureElementKindPreview extends Win32Enum{

    /**
     * Feature element is undefined.
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * Feature element is of type Float.
     * @type {Integer (Int32)}
     */
    static Float => 1

    /**
     * Feature element is of type UInt8.
     * @type {Integer (Int32)}
     */
    static UInt8 => 2

    /**
     * Feature element is of type Int8.
     * @type {Integer (Int32)}
     */
    static Int8 => 3

    /**
     * Feature element is of type UInt16.
     * @type {Integer (Int32)}
     */
    static UInt16 => 4

    /**
     * Feature element is of type Int16.
     * @type {Integer (Int32)}
     */
    static Int16 => 5

    /**
     * Feature element is of type Int32.
     * @type {Integer (Int32)}
     */
    static Int32 => 6

    /**
     * Feature element is of type Int64.
     * @type {Integer (Int32)}
     */
    static Int64 => 7

    /**
     * Feature element is of type String.
     * @type {Integer (Int32)}
     */
    static String => 8

    /**
     * Feature element is of type Boolean.
     * @type {Integer (Int32)}
     */
    static Boolean => 9

    /**
     * Feature element is of type Float16.
     * @type {Integer (Int32)}
     */
    static Float16 => 10

    /**
     * Feature element is of type Double.
     * @type {Integer (Int32)}
     */
    static Double => 11

    /**
     * Feature element is of type UInt32.
     * @type {Integer (Int32)}
     */
    static UInt32 => 12

    /**
     * Feature element is of type UInt64.
     * @type {Integer (Int32)}
     */
    static UInt64 => 13

    /**
     * Feature element is of type Complex64.
     * @type {Integer (Int32)}
     */
    static Complex64 => 14

    /**
     * Feature element is of type Complex128.
     * @type {Integer (Int32)}
     */
    static Complex128 => 15
}
