#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DISPATCH_MESH_ARGUMENTS {
    #StructPack 4

    ThreadGroupCountX : UInt32

    ThreadGroupCountY : UInt32

    ThreadGroupCountZ : UInt32

}
