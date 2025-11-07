#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Outputs the indices of the minimum-valued elements within one or more dimensions of the input tensor.
 * @remarks
 * The output tensor sizes must be the same as the input tensor sizes, except for the reduced axes, which must be 1.
 * 
 * When *AxisDirection* is [DML_AXIS_DIRECTION_INCREASING](/windows/win32/api/directml/ne-directml-dml_axis_direction), this API is equivalent to [DML_REDUCE_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_reduce_operator_desc) with [DML_REDUCE_FUNCTION_ARGMIN](/windows/win32/api/directml/ne-directml-dml_reduce_function).
 * 
 * A subset of this functionality is exposed through the [DML_REDUCE_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_reduce_operator_desc) operator, and is supported on earlier DirectML feature levels.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_argmin_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_ARGMIN_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to read from.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write the results to. Each output element is the result of an *argmin* reduction on a subset of elements from the *InputTensor*.
     * 
     * - *DimensionCount* must match *InputTensor.DimensionCount* (the rank of the input tensor is preserved).
     * - *Sizes* must match *InputTensor.Sizes*, except for dimensions included in the reduced *Axes*, which must be size 1.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **[UINT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * The number of axes to reduce. This field determines the size of the *Axes* array.
     * @type {Integer}
     */
    AxisCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: \_Field_size\_(AxisCount) **const [UINT](/windows/desktop/WinProg/windows-data-types)\***
     * 
     * The axes along which to reduce. Values must be in the range `[0, InputTensor.DimensionCount - 1]`.
     * @type {Pointer<Integer>}
     */
    Axes {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * DML_AXIS_DIRECTION AxisDirection;
     * 
     * Type: **[DML_AXIS_DIRECTION](/windows/win32/api/directml/ne-directml-dml_axis_direction)**
     * 
     * Determines which index to select when multiple input elements have the same value.
     * - **DML_AXIS_DIRECTION_INCREASING** returns the index of the first minimum-valued element (for example, `argmin({1,2,3,2,1}) = 0`)
     * - **DML_AXIS_DIRECTION_DECREASING** returns the index of the last minimum-valued element (for example, `argmin({1,2,3,2,1}) = 4`)
     * @type {Integer}
     */
    AxisDirection {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
