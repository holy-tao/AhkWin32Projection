#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the layout of a root signature version 1.0.
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-d3d12serializerootsignature">D3D12SerializeRootSignature</a> function
  *         and is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12rootsignaturedeserializer-getrootsignaturedesc">ID3D12RootSignatureDeserializer::GetRootSignatureDesc</a> method.
  *       
  * 
  * There is one graphics root signature, and one compute root signature.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_root_signature_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_ROOT_SIGNATURE_DESC extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The number of slots in the root signature. This number is also the number of elements in the <i>pParameters</i> array.
     * @type {Integer}
     */
    NumParameters {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_root_parameter">D3D12_ROOT_PARAMETER</a> structures for the slots in the root signature.
     * @type {Pointer<D3D12_ROOT_PARAMETER>}
     */
    pParameters {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies the number of static samplers.
     * @type {Integer}
     */
    NumStaticSamplers {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to one or more <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_static_sampler_desc">D3D12_STATIC_SAMPLER_DESC</a> structures.
     * @type {Pointer<D3D12_STATIC_SAMPLER_DESC>}
     */
    pStaticSamplers {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_root_signature_flags">D3D12_ROOT_SIGNATURE_FLAGS</a>-typed values that are combined by using a bitwise OR operation.
     *             The resulting value specifies options for the root signature layout.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
