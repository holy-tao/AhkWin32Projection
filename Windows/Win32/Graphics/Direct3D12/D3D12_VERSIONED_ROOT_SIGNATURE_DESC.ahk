#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_ROOT_SIGNATURE_DESC2.ahk" { D3D12_ROOT_SIGNATURE_DESC2 }
#Import ".\D3D12_ROOT_PARAMETER1.ahk" { D3D12_ROOT_PARAMETER1 }
#Import ".\D3D_ROOT_SIGNATURE_VERSION.ahk" { D3D_ROOT_SIGNATURE_VERSION }
#Import ".\D3D12_ROOT_SIGNATURE_FLAGS.ahk" { D3D12_ROOT_SIGNATURE_FLAGS }
#Import ".\D3D12_ROOT_SIGNATURE_DESC.ahk" { D3D12_ROOT_SIGNATURE_DESC }
#Import ".\D3D12_ROOT_PARAMETER.ahk" { D3D12_ROOT_PARAMETER }
#Import ".\D3D12_STATIC_SAMPLER_DESC1.ahk" { D3D12_STATIC_SAMPLER_DESC1 }
#Import ".\D3D12_ROOT_SIGNATURE_DESC1.ahk" { D3D12_ROOT_SIGNATURE_DESC1 }
#Import ".\D3D12_STATIC_SAMPLER_DESC.ahk" { D3D12_STATIC_SAMPLER_DESC }

/**
 * Holds any version of a root signature description, and is designed to be used with serialization/deserialization functions.
 * @remarks
 * Use this structure with the following methods.
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12versionedrootsignaturedeserializer-getrootsignaturedescatversion">GetRootSignatureDescAtVersion</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12versionedrootsignaturedeserializer-getunconvertedrootsignaturedesc">GetUnconvertedRootSignatureDesc</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-d3d12serializeversionedrootsignature">D3D12SerializeVersionedRootSignature</a>
 * </li>
 * </ul>
 * Refer to the helper structure <a href="https://docs.microsoft.com/windows/desktop/direct3d12/cd3dx12-versioned-root-signature-desc">CD3DX12_VERSIONED_ROOT_SIGNATURE_DESC</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_versioned_root_signature_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_VERSIONED_ROOT_SIGNATURE_DESC {
    #StructPack 8

    /**
     * Specifies one member of D3D_ROOT_SIGNATURE_VERSION that determines the contents of the union.
     */
    Version : D3D_ROOT_SIGNATURE_VERSION

    Desc_1_0 : D3D12_ROOT_SIGNATURE_DESC

    static __New() {
        DefineProp(this.Prototype, 'Desc_1_1', { type: D3D12_ROOT_SIGNATURE_DESC1, offset: 8 })
        DefineProp(this.Prototype, 'Desc_1_2', { type: D3D12_ROOT_SIGNATURE_DESC2, offset: 8 })
        this.DeleteProp("__New")
    }
}
