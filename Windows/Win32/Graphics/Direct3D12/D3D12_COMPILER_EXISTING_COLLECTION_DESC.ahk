#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_EXPORT_DESC.ahk" { D3D12_EXPORT_DESC }
#Import ".\ID3D12CompilerStateObject.ahk" { ID3D12CompilerStateObject }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_COMPILER_EXISTING_COLLECTION_DESC {
    #StructPack 8

    pExistingCollection : ID3D12CompilerStateObject

    NumExports : UInt32

    pExports : D3D12_EXPORT_DESC.Ptr

}
