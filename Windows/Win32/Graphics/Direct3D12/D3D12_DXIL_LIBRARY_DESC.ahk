#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_SHADER_BYTECODE.ahk" { D3D12_SHADER_BYTECODE }
#Import ".\D3D12_EXPORT_DESC.ahk" { D3D12_EXPORT_DESC }

/**
 * Describes a DXIL library state subobject that can be included in a state object.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_dxil_library_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DXIL_LIBRARY_DESC {
    #StructPack 8

    /**
     * The library to include in the state object.  Must have been compiled with library target 6.3 or higher.  It is fine to specify the same library multiple times either in the same state object / collection or across multiple, as long as the names exported each time don’t conflict in a given state object.
     */
    DXILLibrary : D3D12_SHADER_BYTECODE

    /**
     * The size of <i>pExports</i> array.  If 0, everything gets exported from the library.
     */
    NumExports : UInt32

    pExports : D3D12_EXPORT_DESC.Ptr

}
