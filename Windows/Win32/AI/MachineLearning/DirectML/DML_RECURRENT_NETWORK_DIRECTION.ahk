#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify a direction for a recurrent DirectML operator.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ne-directml-dml_recurrent_network_direction
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_RECURRENT_NETWORK_DIRECTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates the forward pass.
     * @type {Integer (Int32)}
     */
    static DML_RECURRENT_NETWORK_DIRECTION_FORWARD => 0

    /**
     * Indicates the backward pass.
     * @type {Integer (Int32)}
     */
    static DML_RECURRENT_NETWORK_DIRECTION_BACKWARD => 1

    /**
     * Indicates both passes.
     * @type {Integer (Int32)}
     */
    static DML_RECURRENT_NETWORK_DIRECTION_BIDIRECTIONAL => 2
}
