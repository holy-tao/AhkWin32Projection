#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
class MLOperatorAttributeType extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static Undefined => 0

    /**
     * @type {Integer (UInt32)}
     */
    static Win32Float => 2

    /**
     * @type {Integer (UInt32)}
     */
    static Int => 3

    /**
     * @type {Integer (UInt32)}
     */
    static Win32String => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FloatArray => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IntArray => 8

    /**
     * @type {Integer (UInt32)}
     */
    static StringArray => 9
}
