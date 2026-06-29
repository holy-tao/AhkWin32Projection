#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify a mode for the DirectML upsample 2-D operator (as described by the DML_UPSAMPLE_2D_OPERATOR_DESC structure).
 * @see https://learn.microsoft.com/windows/win32/api/directml/ne-directml-dml_interpolation_mode
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_INTERPOLATION_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies the nearest-neighbor mode.
     * @type {Integer (Int32)}
     */
    static DML_INTERPOLATION_MODE_NEAREST_NEIGHBOR => 0

    /**
     * Specifies a linear (including bilinear, trilinear, etc.) mode.
     * @type {Integer (Int32)}
     */
    static DML_INTERPOLATION_MODE_LINEAR => 1
}
