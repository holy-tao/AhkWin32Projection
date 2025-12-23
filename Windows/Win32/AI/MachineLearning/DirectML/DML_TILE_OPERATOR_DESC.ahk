#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Constructs an output tensor by tiling the input tensor. The elements in each dimension of the input tensor are repeated by a multiple in the *Repeats* array.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_tile_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_TILE_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to read from, which contains the elements to be tiled.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write to, which will hold the tiled output. For each dimension `i` in `[0, InputTensor.DimensionCount-1]`, the output size is calculated as `OutputTensor.Sizes[i] = InputTensor.Sizes[i] * Repeats[i]`. This tensor must have the same *DimensionCount* as the input tensor.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * This field determines the size of the *Repeats* array. This value must be the same as the *InputTensor.DimensionCount*.
     * @type {Integer}
     */
    RepeatsCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * Each value in this array corresponds to one of the input tensor's dimensions (in order). Each value is the number of tiled copies to make of that dimension. Values must be larger than 0.
     * @type {Pointer<Integer>}
     */
    Repeats {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
