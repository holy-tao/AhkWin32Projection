#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_SERIALIZED_ROOT_SIGNATURE_DESC.ahk" { D3D12_SERIALIZED_ROOT_SIGNATURE_DESC }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_LOCAL_SERIALIZED_ROOT_SIGNATURE {
    #StructPack 8

    Desc : D3D12_SERIALIZED_ROOT_SIGNATURE_DESC

}
