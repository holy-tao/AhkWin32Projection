#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies a resource binding described by a range of bytes in a Direct3D 12 buffer, represented by an offset and size into an ID3D12Resource.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_buffer_binding
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_BUFFER_BINDING extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>*</b>
     * 
     * An optional pointer to an <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a> interface representing a buffer. The resource must have dimension <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_dimension">D3D12_RESOURCE_DIMENSION_BUFFER</a>, and the
     *       range described by this struct must lie within the bounds of the buffer. You may supply <b>nullptr</b> for this member to indicate 'no binding'.
     * @type {ID3D12Resource}
     */
    Buffer {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * The offset, in bytes, from the start of the buffer where the range begins. This offset must be aligned to a
     *       multiple of [DML_MINIMUM_BUFFER_TENSOR_ALIGNMENT](/windows/desktop/direct3d12/direct3d-directml-constants) or the <b>GuaranteedBaseOffsetAlignment</b> supplied as part of the
     *       [DML_BUFFER_TENSOR_DESC](/windows/win32/api/directml/ns-directml-dml_buffer_tensor_desc).
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a></b>
     * 
     * The size of the range, in bytes.
     * @type {Integer}
     */
    SizeInBytes {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
