#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the immediate value and destination address written using ID3D12CommandList2::WriteBufferImmediate.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_writebufferimmediate_parameter
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_WRITEBUFFERIMMEDIATE_PARAMETER {
    #StructPack 8

    /**
     * The GPU virtual address at which to write the value. The address must be aligned to a 32-bit (4-byte) boundary.
     */
    Dest : Int64

    /**
     * The 32-bit value to write.
     */
    Value : UInt32

}
