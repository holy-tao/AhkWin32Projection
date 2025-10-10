#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Performs a general matrix multiplication function of the form `Output = FusedActivation(Alpha * TransA(A) x TransB(B) + Beta * C)`, where `x` denotes matrix multiplication, and `*` denotes multiplication with a scalar.
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_gemm_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_GEMM_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the A matrix. This tensor's *Sizes* should be `{ BatchCount, ChannelCount, M, K }` if *TransA* is [DML_MATRIX_TRANSFORM_NONE](/windows/win32/api/directml/ne-directml-dml_matrix_transform), or `{ BatchCount, ChannelCount, K, M }` if *TransA* is **DML_MATRIX_TRANSFORM_TRANSPOSE**.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    ATensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the B matrix. This tensor's *Sizes* should be `{ BatchCount, ChannelCount, K, N }` if *TransB* is [DML_MATRIX_TRANSFORM_NONE](/windows/win32/api/directml/ne-directml-dml_matrix_transform), or `{ BatchCount, ChannelCount, N, K }` if *TransB* is **DML_MATRIX_TRANSFORM_TRANSPOSE**.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    BTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the C matrix, or `nullptr`. Values default to 0 when not provided. If provided, this tensor's *Sizes* should be `{ BatchCount, ChannelCount, M, N }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    CTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write the results to. This tensor's *Sizes* are `{ BatchCount, ChannelCount, M, N }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: [**DML_MATRIX_TRANSFORM**](/windows/win32/api/directml/ne-directml-dml_matrix_transform)
     * 
     * The transform to be applied to *ATensor*; either a transpose, or no transform.
     * @type {Integer}
     */
    TransA {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Type: [**DML_MATRIX_TRANSFORM**](/windows/win32/api/directml/ne-directml-dml_matrix_transform)
     * 
     * The transform to be applied to *BTensor*; either a transpose, or no transform.
     * @type {Integer}
     */
    TransB {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * The value of the scalar multiplier for the product of inputs *ATensor* and *BTensor*.
     * @type {Float}
     */
    Alpha {
        get => NumGet(this, 40, "float")
        set => NumPut("float", value, this, 40)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * The value of the scalar multiplier for the optional input *CTensor*. If *CTensor* is not provided, then this value is ignored.
     * @type {Float}
     */
    Beta {
        get => NumGet(this, 44, "float")
        set => NumPut("float", value, this, 44)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_operator_desc)\***
     * 
     * An optional fused activation layer to apply after the GEMM.
     * @type {Pointer<DML_OPERATOR_DESC>}
     */
    FusedActivation {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
