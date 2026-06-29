#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_DESC.ahk" { DML_TENSOR_DESC }

/**
 * Performs a convolution of the *FilterTensor* with the *InputTensor*. This operator performs forward convolution on quantized data. This operator is mathematically equivalent to dequantizing the inputs, convolving, and then quantizing the output.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_quantized_linear_convolution_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_QUANTIZED_LINEAR_CONVOLUTION_OPERATOR_DESC {
    #StructPack 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the input data. The expected dimensions of the *InputTensor* are `{ InputBatchCount, InputChannelCount, InputHeight, InputWidth }`.
     */
    InputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the input scale data. The expected dimensions of the `InputScaleTensor` are `{ 1, 1, 1, 1 }`. This scale value is used for dequantizing the input values.
     */
    InputScaleTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: _Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing the input zero point data. The expected dimensions of the *InputZeroPointTensor* are `{ 1, 1, 1, 1 }`. This zero point value is used for dequantizing the input values.
     */
    InputZeroPointTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the filter data. The expected dimensions of the *FilterTensor* are `{ FilterBatchCount, FilterChannelCount, FilterHeight, FilterWidth }`.
     */
    FilterTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the filter scale data. The expected dimensions of the `FilterScaleTensor` are `{ 1, 1, 1, 1 }` if per tensor quantization is required, or `{ 1, OutputChannelCount, 1, 1 }` if per channel quantization is required. This scale value is used for dequantizing the filter values.
     */
    FilterScaleTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: _Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing the filter zero point data. The expected dimensions of the *FilterZeroPointTensor* are `{ 1, 1, 1, 1 }` if per tensor quantization is required, or `{ 1, OutputChannelCount, 1, 1 }` if per channel quantization is required. This zero point value is used for dequantizing the filter values.
     */
    FilterZeroPointTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the bias data. The bias tensor is a tensor containing data which is broadcasted across the output tensor at the end of the convolution which is added to the result. The expected dimensions of the BiasTensor are `{ 1, OutputChannelCount, 1, 1 }` for 4D.
     */
    BiasTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the output scale data. The expected dimensions of the OutputScaleTensor are `{ 1, 1, 1, 1 }`. This input scale value is used for quantizing the convolution output values.
     */
    OutputScaleTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: _Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing the filter zero point data. The expected dimensions of the OutputZeroPointTensor are `{ 1, 1, 1, 1 }`. This input zero point value is used for quantizing the convolution the output values.
     */
    OutputZeroPointTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor to write the results to. The expected dimensions of the OutputTensor are `{ OutputBatchCount, OutputChannelCount, OutputHeight, OutputWidth }`.
     */
    OutputTensor : DML_TENSOR_DESC.Ptr

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of spatial dimensions for the convolution operation. Spatial dimensions are the lower dimensions of the convolution filter tensor *FilterTensor*. This value also determines the size of the *Strides*, *Dilations*, *StartPadding*, and *EndPadding* arrays. Only a value of 2 is supported.
     */
    DimensionCount : UInt32

    /**
     * Type: \_Field_size\_(DimensionCount) **const [UINT](/windows/desktop/WinProg/windows-data-types)\***
     * 
     * The strides of the convolution operation. These strides are applied to the convolution filter. They are separate from the tensor strides included in [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc).
     */
    Strides : IntPtr

    /**
     * Type: \_Field_size\_(DimensionCount) **const [UINT](/windows/desktop/WinProg/windows-data-types)\***
     * 
     * The Dilations of the convolution operation. Dilations are strides applied to the elements of the filter kernel. This has the effect of simulating a larger filter kernel by padding the internal filter kernel elements with zeros.
     */
    Dilations : IntPtr

    /**
     * Type: \_Field_size\_(DimensionCount) **const [UINT](/windows/desktop/WinProg/windows-data-types)\***
     * 
     * The padding values to be applied to the beginning of each spatial dimension of the filter and input tensor of the convolution operation.
     */
    StartPadding : IntPtr

    /**
     * Type: \_Field_size\_(DimensionCount) **const [UINT](/windows/desktop/WinProg/windows-data-types)\***
     * 
     * The padding values to be applied to the end of each spatial dimension of the filter and input tensor of the convolution operation.
     */
    EndPadding : IntPtr

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of groups which to divide the convolution operation into. *GroupCount* can be used to achieve depth-wise convolution by setting the *GroupCount* equal to the input channel count. This divides the convolution up into a separate convolution per input channel.
     */
    GroupCount : UInt32

}
