#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes an HLSL class instance.
 * @remarks
 * The D3D11_CLASS_INSTANCE_DESC structure is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11classinstance-getdesc">ID3D11ClassInstance::GetDesc</a> method.
  * 
  * The members of this structure except <b>InstanceIndex</b> are valid (non default values) if they describe a class instance acquired using  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11classlinkage-createclassinstance">ID3D11ClassLinkage::CreateClassInstance</a>.  The <b>InstanceIndex</b> member is only valid when the class instance is aquired using <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11classlinkage-getclassinstance">ID3D11ClassLinkage::GetClassInstance</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_class_instance_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_CLASS_INSTANCE_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The instance ID of an HLSL class; the default value is 0.
     * @type {Integer}
     */
    InstanceId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The instance index of an HLSL class; the default value is 0.
     * @type {Integer}
     */
    InstanceIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The type ID of an HLSL class; the default value is 0.
     * @type {Integer}
     */
    TypeId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Describes the constant buffer associated with an HLSL class; the default value is 0.
     * @type {Integer}
     */
    ConstantBuffer {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The base constant buffer offset associated with an HLSL class; the default value is 0.
     * @type {Integer}
     */
    BaseConstantBufferOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The base texture associated with an HLSL class; the default value is 127.
     * @type {Integer}
     */
    BaseTexture {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The base sampler associated with an HLSL class; the default value is 15.
     * @type {Integer}
     */
    BaseSampler {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * True if the class was created; the default value is false.
     * @type {Integer}
     */
    Created {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}
