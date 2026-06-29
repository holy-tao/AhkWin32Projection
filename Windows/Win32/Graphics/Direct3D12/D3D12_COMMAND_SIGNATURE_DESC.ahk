#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_INDIRECT_ARGUMENT_DESC.ahk" { D3D12_INDIRECT_ARGUMENT_DESC }

/**
 * Describes the arguments (parameters) of a command signature.
 * @remarks
 * Use this structure by <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device-createcommandsignature">CreateCommandSignature</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_command_signature_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_COMMAND_SIGNATURE_DESC {
    #StructPack 8

    /**
     * Specifies the size of each command in the drawing buffer, in bytes.
     */
    ByteStride : UInt32

    /**
     * Specifies the number of arguments in the command signature.
     */
    NumArgumentDescs : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_indirect_argument_desc">D3D12_INDIRECT_ARGUMENT_DESC</a> structures,
     *             containing details of the arguments, including whether the argument is a vertex buffer, constant, constant buffer view, shader resource view, or unordered access view.
     */
    pArgumentDescs : D3D12_INDIRECT_ARGUMENT_DESC.Ptr

    /**
     * For single GPU operation, set this to zero. If there are multiple GPU nodes, set bits to identify the nodes (the  device's physical adapters) for which the command signature is to apply.
     *             Each bit in the mask corresponds to a single node.
     *             Refer to <a href="https://docs.microsoft.com/windows/win32/direct3d12/multi-engine">Multi-adapter systems</a>.
     */
    NodeMask : UInt32

}
