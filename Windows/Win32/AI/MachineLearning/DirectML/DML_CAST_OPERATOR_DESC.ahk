#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Casts each element in the input to the data type of the output tensor, and stores the result in the corresponding element of the output.
 * @remarks
 * 
  * Some data types might not be supported on certain hardware. To determine whether a data type is supported, use [IDMLDevice::CheckFeatureSupport](/windows/win32/api/directml/nf-directml-idmldevice-checkfeaturesupport) with [DML_FEATURE_TENSOR_DATA_TYPE_SUPPORT](/windows/win32/api/directml/ne-directml-dml_feature).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//directml/ns-directml-dml_cast_operator_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_CAST_OPERATOR_DESC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * The tensor to write the results to. This tensor's *Sizes* should match *InputTensor*.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    InputTensor {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **const [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc)\***
     * 
     * A pointer to a constant [DML_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_tensor_desc) containing the description of the tensor to write the results to.
     * @type {Pointer<DML_TENSOR_DESC>}
     */
    OutputTensor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
