#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Performs a convolution of the *FilterTensor* with the *InputTensor*. This operator performs forward convolution on integer data.
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_convolution_integer_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_CONVOLUTION_INTEGER_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the input data. The expected dimensions of the *InputTensor* are `{ BatchCount, InputChannelCount, InputHeight, InputWidth }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing the input zero point data. The expected dimensions of the *InputZeroPointTensor* are `{ 1, 1, 1, 1 }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputZeroPointTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the filter data. The expected dimensions of the *FilterTensor* are `{ FilterBatchCount, FilterChannelCount, FilterHeight, FilterWidth }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    FilterTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing the filter zero point data. The expected dimensions of the *FilterZeroPointTensor* are `{ 1, 1, 1, 1 }` if per tensor quantization is required, or `{ 1, OutputChannelCount, 1, 1 }` if per-channel quantization is required.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    FilterZeroPointTensor {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write the results to. The expected dimensions of the *OutputTensor* are `{ BatchCount, OutputChannelCount, OutputHeight, OutputWidth }`.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of spatial dimensions for the convolution operation. Spatial dimensions are the lower dimensions of the convolution *FilterTensor*. This value also determines the size of the *Strides*, *Dilations*, *StartPadding*, and *EndPadding* arrays. Only a value of 2 is supported.
     * @type {Integer}
     */
    DimensionCount {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: \_Field_size\_(DimensionCount) **const [UINT](/windows/desktop/WinProg/windows-data-types)\***
     * 
     * An array containing the strides of the convolution operation. These strides are applied to the convolution filter. They are separate from the tensor strides included in [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc).
     * @type {Pointer<UInt32>}
     */
    Strides {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: \_Field_size\_(DimensionCount) **const [UINT](/windows/desktop/WinProg/windows-data-types)\***
     * 
     * An array containing the dilations of the convolution operation. Dilations are strides applied to the elements of the filter kernel. This has the effect of simulating a larger filter kernel by padding the internal filter kernel elements with zeros.
     * @type {Pointer<UInt32>}
     */
    Dilations {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: \_Field_size\_(DimensionCount) **const [UINT](/windows/desktop/WinProg/windows-data-types)\***
     * 
     * An array containing the padding values to be applied to the beginning of each spatial dimension of the filter and input tensor of the convolution operation.
     * @type {Pointer<UInt32>}
     */
    StartPadding {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Type: \_Field_size\_(DimensionCount) **const [UINT](/windows/desktop/WinProg/windows-data-types)\***
     * 
     * An array containing the padding values to be applied to the end of each spatial dimension of the filter and input tensor of the convolution operation.
     * @type {Pointer<UInt32>}
     */
    EndPadding {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of groups which to divide the convolution operation up into. *GroupCount* can be used to achieve depth-wise convolution by setting the *GroupCount* equal to the input channel count. This divides the convolution up into a separate convolution per input channel.
     * @type {Integer}
     */
    GroupCount {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }
}
