#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Constructs an output tensor by tiling the input tensor. The elements in each dimension of the input tensor are repeated by a multiple in the *Repeats* array.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_tile_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_TILE_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to read from, which contains the elements to be tiled.
     */
    InputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write to, which will hold the tiled output. For each dimension `i` in `[0, InputTensor.DimensionCount-1]`, the output size is calculated as `OutputTensor.Sizes[i] = InputTensor.Sizes[i] * Repeats[i]`. This tensor must have the same *DimensionCount* as the input tensor.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * This field determines the size of the *Repeats* array. This value must be the same as the *InputTensor.DimensionCount*.
     */
    RepeatsCount : UInt32

    /**
     * Type: <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * Each value in this array corresponds to one of the input tensor's dimensions (in order). Each value is the number of tiled copies to make of that dimension. Values must be larger than 0.
     */
    Repeats : IntPtr

}
