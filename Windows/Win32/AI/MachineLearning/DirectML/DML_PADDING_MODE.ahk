#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a mode for the DirectML pad operator (as described by the DML_PADDING_OPERATOR_DESC structure).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ne-directml-dml_padding_mode
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_PADDING_MODE extends Win32Enum{

    /**
     * Indicates padding with a constant.
     * @type {Integer (Int32)}
     */
    static DML_PADDING_MODE_CONSTANT => 0

    /**
     * Indicates edge mode for padding.
     * @type {Integer (Int32)}
     */
    static DML_PADDING_MODE_EDGE => 1

    /**
     * Indicates reflection mode for padding.
     * @type {Integer (Int32)}
     */
    static DML_PADDING_MODE_REFLECTION => 2

    /**
     * @type {Integer (Int32)}
     */
    static DML_PADDING_MODE_SYMMETRIC => 3
}
