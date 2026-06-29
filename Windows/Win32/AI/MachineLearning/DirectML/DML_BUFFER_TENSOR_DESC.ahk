#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_TENSOR_FLAGS.ahk" { DML_TENSOR_FLAGS }
#Import ".\DML_TENSOR_DATA_TYPE.ahk" { DML_TENSOR_DATA_TYPE }

/**
 * Describes a tensor that will be stored in a Direct3D 12 buffer resource.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_buffer_tensor_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_BUFFER_TENSOR_DESC {
    #StructPack 8

    /**
     * Type: [**DML_TENSOR_DATA_TYPE**](/windows/win32/api/directml/ne-directml-dml_tensor_data_type)
     * 
     * The type of the values in the tensor.
     */
    DataType : DML_TENSOR_DATA_TYPE

    /**
     * Type: [**DML_TENSOR_FLAGS**](/windows/win32/api/directml/ne-directml-dml_tensor_flags)
     * 
     * Specifies additional options for the tensor.
     */
    Flags : DML_TENSOR_FLAGS

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The number of dimensions of the tensor. This member determines the size of the <i>Sizes</i> and <i>Strides</i> arrays (if provided). In DirectML, all buffer tensors must have a *DimensionCount* of either 4 or 5. Not all operators support a *DimensionCount* of 5.
     */
    DimensionCount : UInt32

    /**
     * Type: <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * The size, in elements, of each dimension in the tensor. Specifying a size of zero in any dimension is invalid, and will result in an error. The *Sizes* member is always specified in the order {N, C, H, W} if *DimensionCount* is 4, and {N, C, D, H, W} if *DimensionCount* is 5.
     */
    Sizes : IntPtr

    /**
     * Type: <b>const [UINT](/windows/desktop/winprog/windows-data-types)*</b>
     * 
     * Optional. Determines the number of elements (not bytes) to linearly traverse in order to reach the next element in that dimension. For example, a stride of 5 in dimension 1 means that the distance between elements (n) and (n+1) in that dimension is 5 elements when traversing the buffer linearly. The *Strides* member is always specified in the order {N, C, H, W} if *DimensionCount* is 4, and {N, C, D, H, W} if *DimensionCount* is 5.
     * 
     * <i>Strides</i> can be used to express broadcasting (by specifying a stride of 0) as well as padding (for example, by using a stride larger than the physical size of a row, to pad the end of a row).
     * 
     * If <i>Strides</i> is not specified, each dimension in the tensor is considered to be contiguously packed, with no additional padding.
     */
    Strides : IntPtr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * Defines a minimum size in bytes for the buffer that will contain this tensor. <i>TotalTensorSizeInBytes</i> must be at least as large as the minimum implied size given the sizes, strides, and data type of the tensor. You can calculate the minimum implied size by calling the [DMLCalcBufferTensorSize](/windows/ai/directml/dml-helper-functions#dmlcalcbuffertensorsize) utility free function.
     * 
     * Providing a <i>TotalTensorSizeInBytes</i> that is larger than the minimum implied size may enable additional optimizations by allowing DirectML to elide bounds checking in some cases if the <i>TotalTensorSizeInBytes</i> defines sufficient padding beyond the end of the tensor data.
     * 
     * When binding this tensor, the size of the buffer range must be at least as large as the <i>TotalTensorSizeInBytes</i>. For output tensors, this has the additional effect of permitting DirectML to write to any memory within the <i>TotalTensorSizeInBytes</i>. That is, your application mustn't assume that DirectML will preserve any padding bytes inside output tensors that are inside the <i>TotalTensorSizeInBytes</i>.
     * 
     * The total size of a buffer tensor may not exceed (2^32 - 1) elements—for example, 16GB for a <b>FLOAT32</b> tensor.
     */
    TotalTensorSizeInBytes : Int64

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * Optional. Defines a minimum guaranteed alignment in bytes for the base offset of the buffer range that will contain this tensor, or 0 to provide no minimum guaranteed alignment. If specified, this value must be a power of two that is at least as large as the element size.
     * 
     * When binding this tensor, the offset in bytes of the buffer range from the start of the buffer must be a multiple of the <i>GuaranteedBaseOffsetAlignment</i>, if provided.
     * 
     * Buffer tensors always have a minimum alignment of 16 bytes. However, providing a larger value for the <i>GuaranteedBaseOffsetAlignment</i> may allow DirectML to achieve better performance, because a larger alignment enables the use of vectorized load/store instructions.
     * 
     * Although this member is optional, for best performance we recommend that you align tensors to boundaries of 32 bytes or more, where possible.
     */
    GuaranteedBaseOffsetAlignment : UInt32

}
