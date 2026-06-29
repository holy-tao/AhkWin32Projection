#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify a mode for the DirectML pad operator (as described by the DML_PADDING_OPERATOR_DESC structure).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ne-directml-dml_padding_mode
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_PADDING_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
