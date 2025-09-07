#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_ROOT_SIGNATURE_DESC.ahk
#Include .\D3D12_ROOT_SIGNATURE_DESC1.ahk
#Include .\D3D12_ROOT_SIGNATURE_DESC2.ahk

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
 * @version v4.0.30319
 */
class D3D12_VERSIONED_ROOT_SIGNATURE_DESC extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Specifies one member of D3D_ROOT_SIGNATURE_VERSION that determines the contents of the union.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {D3D12_ROOT_SIGNATURE_DESC}
     */
    Desc_1_0{
        get {
            if(!this.HasProp("__Desc_1_0"))
                this.__Desc_1_0 := D3D12_ROOT_SIGNATURE_DESC(this.ptr + 8)
            return this.__Desc_1_0
        }
    }

    /**
     * @type {D3D12_ROOT_SIGNATURE_DESC1}
     */
    Desc_1_1{
        get {
            if(!this.HasProp("__Desc_1_1"))
                this.__Desc_1_1 := D3D12_ROOT_SIGNATURE_DESC1(this.ptr + 8)
            return this.__Desc_1_1
        }
    }

    /**
     * @type {D3D12_ROOT_SIGNATURE_DESC2}
     */
    Desc_1_2{
        get {
            if(!this.HasProp("__Desc_1_2"))
                this.__Desc_1_2 := D3D12_ROOT_SIGNATURE_DESC2(this.ptr + 8)
            return this.__Desc_1_2
        }
    }
}
