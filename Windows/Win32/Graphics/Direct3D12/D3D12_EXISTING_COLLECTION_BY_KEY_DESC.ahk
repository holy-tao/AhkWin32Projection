#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_EXPORT_DESC.ahk" { D3D12_EXPORT_DESC }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_EXISTING_COLLECTION_BY_KEY_DESC {
    #StructPack 8

    pKey : IntPtr

    KeySize : UInt32

    NumExports : UInt32

    pExports : D3D12_EXPORT_DESC.Ptr

}
