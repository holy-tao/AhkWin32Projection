#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify a direction for a recurrent DirectML operator.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ne-directml-dml_recurrent_network_direction
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_RECURRENT_NETWORK_DIRECTION{

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
