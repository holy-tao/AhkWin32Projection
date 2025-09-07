#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Performs a one-layer long short term memory (LSTM) function on the input. This operator uses multiple gates to perform this layer. These gates are performed multiple times in a loop, dictated by the sequence length dimension and the *SequenceLengthsTensor*.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_lstm_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_LSTM_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 120

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
     * A tensor containing the weight data, W. Concatenation of W_[iofc] and W_B[iofc] (if bidirectional). The tensor has sizes `{ 1, num_directions, 4 * hidden_size, input_size }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    WeightTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the recurrence data, R. Concatenation of R_[iofc] and R_B[iofc] (if bidirectional). This tensor has sizes `{ 1, num_directions, 4 * hidden_size, hidden_size }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    RecurrenceTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing the bias data, B. Concatenation of `{ W_b[iofc], R_b[iofc] }`, and `{ W_Bb[iofc], R_Bb[iofc] }` (if bidirectional). This tensor has sizes `{ 1, 1, num_directions, 8 * hidden_size }`. If not specified, then defaults to 0 bias.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    BiasTensor {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing the hidden node initializer data, H_(t-1). Contents of this tensor are only used on the first loop index t. If not specified, then defaults to 0. This tensor has sizes `{ 1, num_directions, batch_size, hidden_size }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    HiddenInitTensor {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing the cell initializer data, C_(t-1). Contents of this tensor are only used on the first loop index t. If not specified, then defaults to 0. This tensor has sizes `{ 1, num_directions, batch_size, hidden_size }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    CellMemInitTensor {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing an independent seq_length for each element in the batch. If not specified, then all sequences in the batch have length seq_length. This tensor has sizes `{ 1, 1, 1, batch_size }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    SequenceLengthsTensor {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing the weight data for peepholes, P. If not specified, then defaults to 0. Concatenation of P_[iof] and P_B[iof] (if bidirectional). This tensor has sizes `{ 1, 1, num_directions, 3 * hidden_size }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    PeepholeTensor {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor with which to write the concatenation of all the intermediate output values of the hidden nodes, H_t. This tensor has sizes `{ seq_length, num_directions, batch_size, hidden_size }`. seq_length is mapped to the loop index t.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputSequenceTensor {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor with which to write the last output value of the hidden nodes, H_t. This tensor has sizes `{ 1, num_directions, batch_size, hidden_size }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputSingleTensor {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor with which to write the last output value of the cell, C_t. This tensor has sizes `{ 1, num_directions, batch_size, hidden_size }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputCellSingleTensor {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * This field determines the size of the *ActivationDescs* array.
     * @type {Integer}
     */
    ActivationDescCount {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Type: \_Field\_size\_(ActivationDescCount) **const [DML_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_operator_desc)\***
     * 
     * An array of [DML_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_operator_desc) containing the descriptions of the activation operators f(), g(), and h(). f(), g(), and h() are defined independently of direction, meaning that if [DML_RECURRENT_NETWORK_DIRECTION_FORWARD](/windows/win32/api/directml/ne-directml-dml_recurrent_network_direction) or **DML_RECURRENT_NETWORK_DIRECTION_BACKWARD** are supplied in *Direction*, then three activations must be provided. If **DML_RECURRENT_NETWORK_DIRECTION_BIDIRECTIONAL** is defined, then six activations must be provided. For bidirectional, activations must be provided f(), g(), and h() for forward followed by f(), g(), and h() for backwards.
     * @type {Pointer<DML_OPERATOR_DESC>}
     */
    ActivationDescs {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Type: **const [DML_RECURRENT_NETWORK_DIRECTION](/windows/win32/api/directml/ne-directml-dml_recurrent_network_direction)\***
     * 
     * The direction of the operator: forward, backward, or bidirectional.
     * @type {Integer}
     */
    Direction {
        get => NumGet(this, 104, "int")
        set => NumPut("int", value, this, 104)
    }

    /**
     * Type: <b>float</b>
     * 
     * The cell clip threshold. Clipping bounds the elements of a tensor in the range of [-`ClipThreshold`, +`ClipThreshold`], and is applied to the input of activations.
     * @type {Float}
     */
    ClipThreshold {
        get => NumGet(this, 108, "float")
        set => NumPut("float", value, this, 108)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * **TRUE** if *ClipThreshold* should be used. Otherwise, **FALSE**.
     * @type {Integer}
     */
    UseClipThreshold {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * **TRUE** if the input and forget gates should be coupled. Otherwise, **FALSE**.
     * @type {Integer}
     */
    CoupleInputForget {
        get => NumGet(this, 116, "int")
        set => NumPut("int", value, this, 116)
    }
}
