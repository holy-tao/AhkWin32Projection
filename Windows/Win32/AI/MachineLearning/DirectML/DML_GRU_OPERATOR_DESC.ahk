#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Performs a (standard layers) one-layer gated recurrent unit (GRU) function on the input. This operator uses multiple gates to perform this layer. These gates are performed multiple times in a loop dictated by the sequence length dimension and the *SequenceLengthsTensor*.
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_gru_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_GRU_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the input data, X. Packed (and potentially padded) into one 4D tensor with the *Sizes* of `{ 1, seq_length, batch_size, input_size }`. seq_length is the dimension that is mapped to the index, t.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the weight data, W. Concatenation of W_[zrh] and W_B[zrh] (if bidirectional). The tensor has *Sizes* `{ 1, num_directions, 3 * hidden_size, input_size }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    WeightTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the recurrence data, R. Concatenation of R_[zrh] and R_B[zrh] (if bidirectional). The tensor has *Sizes* `{ 1, num_directions, 3 * hidden_size, hidden_size }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    RecurrenceTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing the bias data, B. Concatenation of (W_b[zrh], R_b[zrh]) and (W_Bb[zrh], R_Bb[zrh]) (if bidirectional). The tensor has *Sizes* `{ 1, 1, num_directions, 6 * hidden_size }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    BiasTensor {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing the hidden node initializer tensor, H_t-1 for the first loop index t. If not specified, then defaults to 0. This tensor has *Sizes* `{ 1, num_directions, batch_size, hidden_size }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    HiddenInitTensor {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing an independent seq_length for each element in the batch. If not specified, then all sequences in the batch have length seq_length. This tensor has *Sizes* `{ 1, 1, 1, batch_size }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    SequenceLengthsTensor {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor with which to write the concatenation of all the intermediate output values of the hidden nodes, H_t. This tensor has *Sizes* `{ seq_length, num_directions, batch_size, hidden_size }`. seq_length is mapped to the loop index t.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputSequenceTensor {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor with which to write the last output value of the hidden nodes, H_t. This tensor has *Sizes* `{ 1, num_directions, batch_size, hidden_size }`.
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
     * An array of [DML_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_operator_desc) containing the descriptions of the activation operators, f() and g(). Both f() and g() are defined independently of direction, meaning that if [DML_RECURRENT_NETWORK_DIRECTION_FORWARD](/windows/win32/api/directml/ne-directml-dml_recurrent_network_direction) or **DML_RECURRENT_NETWORK_DIRECTION_BACKWARD** are supplied in *Direction*, then two activations must be provided. If **DML_RECURRENT_NETWORK_DIRECTION_BIDIRECTIONAL** is supplied, then four activations must be provided. For bidirectional, activations must be provided f() and g() for forward followed by f() and g() for backwards.
     * @type {Pointer<DML_OPERATOR_DESC>}
     */
    ActivationDescs {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Type: **const [DML_RECURRENT_NETWORK_DIRECTION](/windows/win32/api/directml/ne-directml-dml_recurrent_network_direction)\***
     * 
     * The direction of the operator&mdash;forward, backwards, or bidirectional.
     * @type {Integer}
     */
    Direction {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * **TRUE** to specify that, when computing the output of the hidden gate, the linear transformation should be applied before multiplying by the output of the reset gate. Otherwise, **FALSE**.
     * @type {Integer}
     */
    LinearBeforeReset {
        get => NumGet(this, 84, "int")
        set => NumPut("int", value, this, 84)
    }
}
