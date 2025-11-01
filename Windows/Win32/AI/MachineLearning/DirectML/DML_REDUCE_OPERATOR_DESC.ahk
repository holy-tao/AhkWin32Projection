#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Outputs the reduction of elements (sum, product, minimum, and so on) within one or more dimensions of the input tensor.
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_reduce_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_REDUCE_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: [**DML_REDUCE_FUNCTION**](/windows/win32/api/directml/ne-directml-dml_reduce_function)
     * 
     * Specifies the reduction function to apply to the input.
     * @type {Integer}
     */
    Function {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to read from.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write the results to. Each output element is the result of a reduction on a subset of elements from the *InputTensor*.
     * 
     * - *DimensionCount* must match *InputTensor.DimensionCount* (the rank of the input tensor is preserved).
     * - *Sizes* must match *InputTensor.Sizes*, except for dimensions included in the reduced *Axes*, which must be size 1.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of axes to reduce. This field determines the size of the *Axes* array.
     * @type {Integer}
     */
    AxisCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: \_Field\_size\_(AxisCount) <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * The axes along which to reduce. Values must be in the range `[0, InputTensor.DimensionCount - 1]`.
     * @type {Pointer<Integer>}
     */
    Axes {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
