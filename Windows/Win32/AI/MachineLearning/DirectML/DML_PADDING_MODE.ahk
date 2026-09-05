#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a mode for the DirectML pad operator (as described by the DML_PADDING_OPERATOR_DESC structure).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ne-directml-dml_padding_mode
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
class DML_PADDING_MODE extends Win32Enum {

    /**
     * Indicates padding with a constant.
     * Native name: DML_PADDING_MODE_CONSTANT
     * @type {Integer (Int32)}
     */
    static CONSTANT => 0

    /**
     * Indicates edge mode for padding.
     * Native name: DML_PADDING_MODE_EDGE
     * @type {Integer (Int32)}
     */
    static EDGE => 1

    /**
     * Indicates reflection mode for padding.
     * Native name: DML_PADDING_MODE_REFLECTION
     * @type {Integer (Int32)}
     */
    static REFLECTION => 2

    /**
     * Native name: DML_PADDING_MODE_SYMMETRIC
     * @type {Integer (Int32)}
     */
    static SYMMETRIC => 3
}
