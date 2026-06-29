#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Graphics\Direct3D12\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * Specifies a resource binding described by a range of bytes in a Direct3D 12 buffer, represented by an offset and size into an ID3D12Resource.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_buffer_binding
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_BUFFER_BINDING {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>*</b>
     * 
     * An optional pointer to an <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a> interface representing a buffer. The resource must have dimension <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_dimension">D3D12_RESOURCE_DIMENSION_BUFFER</a>, and the
     *       range described by this struct must lie within the bounds of the buffer. You may supply <b>nullptr</b> for this member to indicate 'no binding'.
     */
    Buffer : ID3D12Resource

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * The offset, in bytes, from the start of the buffer where the range begins. This offset must be aligned to a
     *       multiple of [DML_MINIMUM_BUFFER_TENSOR_ALIGNMENT](/windows/desktop/direct3d12/direct3d-directml-constants) or the <b>GuaranteedBaseOffsetAlignment</b> supplied as part of the
     *       [DML_BUFFER_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_buffer_tensor_desc).
     */
    Offset : Int64

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * The size of the range, in bytes.
     */
    SizeInBytes : Int64

}
