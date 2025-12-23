#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Performs a convolution of the *FilterTensor* with the *InputTensor*. This operator supports a number of standard convolution configurations.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_convolution_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_CONVOLUTION_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the input data. The expected dimensions of the *InputTensor* are:
     * * `{ BatchCount, InputChannelCount, InputWidth }` for 3D,
     * * `{ BatchCount, InputChannelCount, InputHeight, InputWidth }` for 4D, and
     * * `{ BatchCount, InputChannelCount, InputDepth, InputHeight, InputWidth }` for 5D.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor containing the filter data. The expected dimensions of the *FilterTensor* are:
     * * `{ FilterBatchCount, FilterChannelCount, FilterWidth }` for 3D,
     * * `{ FilterBatchCount, FilterChannelCount, FilterHeight, FilterWidth }` for 4D, and
     * * `{ FilterBatchCount, FilterChannelCount, FilterDepth, FilterHeight, FilterWidth }` for 5D.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    FilterTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * An optional tensor containing the bias data. The bias tensor is a tensor containing data which is broadcasted across the output tensor at the end of the convolution which is added to the result. The expected dimensions of the *BiasTensor* are:
     * * `{ 1, OutputChannelCount, 1 }` for 3D,
     * * `{ 1, OutputChannelCount, 1, 1 }` for 4D, and
     * * `{ 1, OutputChannelCount, 1, 1, 1 }` for 5D. 
     * 
     * For each output channel, the single bias value for that channel is added to every element in that channel of the *OutputTensor*. That is, the *BiasTensor* is broadcasted to the size of the *OutputTensor*, and what the operator returns is the summation of this broadcasted *BiasTensor* with the result from convolution.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    BiasTensor {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A tensor to write the results to. The expected dimensions of the *OutputTensor* are:
     * * `{ BatchCount, OutputChannelCount, OutputWidth }` for 3D,
     * * `{ BatchCount, OutputChannelCount, OutputHeight, OutputWidth }` for 4D, and
     * * `{ BatchCount, OutputChannelCount, OutputDepth, OutputHeight, OutputWidth }` for 5D.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: [**DML_CONVOLUTION_MODE**](/windows/win32/api/directml/ne-directml-dml_convolution_mode)
     * 
     * The mode to use for the convolution operation. [DML_CONVOLUTION_MODE_CROSS_CORRELATION](/windows/win32/api/directml/ne-directml-dml_convolution_mode) is the behavior for required for typical inference scenarios. In contrast, [DML_CONVOLUTION_MODE_CONVOLUTION](/windows/win32/api/directml/ne-directml-dml_convolution_mode) flips the order of elements in each filter kernel along each spatial dimension.
     * @type {Integer}
     */
    Mode {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Type: [**DML_CONVOLUTION_DIRECTION**](/windows/win32/api/directml/ne-directml-dml_convolution_direction)
     * 
     * The direction of the convolution operation. [DML_CONVOLUTION_DIRECTION_FORWARD](/windows/win32/api/directml/ne-directml-dml_convolution_direction) is the primary form of convolution used for inference where a combination of [DML_CONVOLUTION_DIRECTION_FORWARD](/windows/win32/api/directml/ne-directml-dml_convolution_direction) and [DML_CONVOLUTION_DIRECTION_BACKWARD](/windows/win32/api/directml/ne-directml-dml_convolution_direction) are used during training.
     * @type {Integer}
     */
    Direction {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of spatial dimensions for the convolution operation. Spatial dimensions are the lower dimensions of the convolution *FilterTensor*. For example, the width and height dimension are spatial dimensions of a 4D convolution filter tensor. This value also determines the size of the *Strides*, *Dilations*, *StartPadding*, *EndPadding*, and *OutputPadding* arrays. It should be set to 2 when *InputTensor.DimensionCount* is 4, and 3 when *InputTensor.DimensionCount* is 5.
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
     * @type {Pointer<Integer>}
     */
    Strides {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: \_Field_size\_(DimensionCount) **const [UINT](/windows/desktop/WinProg/windows-data-types)\***
     * 
     * An array containing the dilations of the convolution operation. Dilations are strides applied to the elements of the filter kernel. This has the effect of simulating a larger filter kernel by padding the internal filter kernel elements with zeros.
     * @type {Pointer<Integer>}
     */
    Dilations {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: \_Field_size\_(DimensionCount) **const [UINT](/windows/desktop/WinProg/windows-data-types)\***
     * 
     * An array containing the padding values to be applied to the beginning of each spatial dimension of the filter and input tensor of the convolution operation. The start padding values are interpreted according to the *Direction* field.
     * @type {Pointer<Integer>}
     */
    StartPadding {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Type: \_Field_size\_(DimensionCount) **const [UINT](/windows/desktop/WinProg/windows-data-types)\***
     * 
     * An array containing the padding values to be applied to the end of each spatial dimension of the filter and input tensor of the convolution operation. The end padding values are interpreted according to the *Direction* field.
     * @type {Pointer<Integer>}
     */
    EndPadding {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Type: \_Field_size\_(DimensionCount) **const [UINT](/windows/desktop/WinProg/windows-data-types)\***
     * 
     * An array containing the output padding of the convolution operation. *OutputPadding* applies a zero padding to the result of the convolution. This padding is applied to the end of each spatial dimension of the output tensor.
     * @type {Pointer<Integer>}
     */
    OutputPadding {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of groups which to divide the convolution operation up into. This can be used to achieve depth-wise convolution by setting *GroupCount* equal to the input channel count, and *Direction* equal to [DML_CONVOLUTION_DIRECTION_FORWARD](/windows/win32/api/directml/ne-directml-dml_convolution_direction). This divides the convolution up into a separate convolution per input channel.
     * @type {Integer}
     */
    GroupCount {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Type: \_Maybenull\_ **const [DML_OPERATOR_DESC](/windows/win32/api/directml/ns-directml-dml_operator_desc)\***
     * 
     * An optional fused activation layer to apply after the convolution. For more info, see [Using fused operators for improved performance](/windows/ai/directml/dml-fused-activations).
     * @type {Pointer<DML_OPERATOR_DESC>}
     */
    FusedActivation {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }
}
