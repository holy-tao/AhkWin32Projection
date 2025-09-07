#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Performs a one-layer simple recurrent neural network (RNN) function on the input. This function is often referred to as the Input Gate. This operator performs this function multiple times in a loop, dictated by the sequence length dimension and the *SequenceLengthsTensor*.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_rnn_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_RNN_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the input data, X. Packed (and potentially padded) into one 4-D tensor with the sizes of `{ 1, seq_length, batch_size, input_size }`. seq_length is the dimension that is mapped to the index, t.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the weight data, W. Concatenation of W_i and W_Bi (if bidirectional). The tensor has sizes `{ 1, num_directions, hidden_size, input_size }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    WeightTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing the recurrence weight data, R. Concatenation of R_i and R_Bi (if bidirectional). This tensor has sizes `{ 1, num_directions, hidden_size, hidden_size }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    RecurrenceTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing the bias data for the input gate, B. Concatenation of `{ W_bi, R_bi }`, and `{ W_Bbi, R_Bbi }` (if bidirectional). This tensor has sizes `{ 1, 1, num_directions, 2 * hidden_size }`. If not specified, then defaults to 0.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    BiasTensor {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing the hidden node initializer tensor, H_[t-1] for the first loop index t. If not specified, then defaults to 0. This tensor has sizes `{ 1, num_directions, batch_size, hidden_size }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    HiddenInitTensor {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing an independent seq_length for each element in the batch. If not specified, then all sequences in the batch have length seq_length. This tensor has sizes `{ 1, 1, 1, batch_size }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    SequenceLengthsTensor {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor with which to write the concatenation of all the intermediate layer output values of the hidden nodes, H_t. This tensor has sizes `{ seq_length, num_directions, batch_size, hidden_size }`. seq_length is mapped to the loop index t.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputSequenceTensor {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor with which to write the final output value of the hidden nodes, H_t. This tensor has sizes `{ 1, num_directions, batch_size, hidden_size }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputSingleTensor {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * This field determines the size of the *ActivationDescs* array.
     * @type {Integer}
     */
    ActivationDescCount {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: \_Field\_size\_(ActivationDescCount) **const [DML_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_operator_desc)\***
     * 
     * An array of [DML_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_operator_desc) containing the descriptions of the activation operators, f(). The number of activation functions is equal to the number of directions. For forwards and backwards directions there is expected to be 1 activation function. For Bidirectional there are expected to be 2.
     * @type {Pointer<DML_OPERATOR_DESC>}
     */
    ActivationDescs {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Type: **[DML_RECURRENT_NETWORK_DIRECTION](/windows/win32/api/directml/ne-directml-dml_recurrent_network_direction)**
     * 
     * The direction of the operator: forward, backward, or bidirectional.
     * @type {Integer}
     */
    Direction {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }
}
