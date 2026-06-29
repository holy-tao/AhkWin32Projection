#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Describes an HLSL class instance.
 * @remarks
 * The D3D11_CLASS_INSTANCE_DESC structure is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11classinstance-getdesc">ID3D11ClassInstance::GetDesc</a> method.
 * 
 * The members of this structure except <b>InstanceIndex</b> are valid (non default values) if they describe a class instance acquired using  <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11classlinkage-createclassinstance">ID3D11ClassLinkage::CreateClassInstance</a>.  The <b>InstanceIndex</b> member is only valid when the class instance is aquired using <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11classlinkage-getclassinstance">ID3D11ClassLinkage::GetClassInstance</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_class_instance_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_CLASS_INSTANCE_DESC {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The instance ID of an HLSL class; the default value is 0.
     */
    InstanceId : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The instance index of an HLSL class; the default value is 0.
     */
    InstanceIndex : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The type ID of an HLSL class; the default value is 0.
     */
    TypeId : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Describes the constant buffer associated with an HLSL class; the default value is 0.
     */
    ConstantBuffer : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The base constant buffer offset associated with an HLSL class; the default value is 0.
     */
    BaseConstantBufferOffset : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The base texture associated with an HLSL class; the default value is 127.
     */
    BaseTexture : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The base sampler associated with an HLSL class; the default value is 15.
     */
    BaseSampler : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * True if the class was created; the default value is false.
     */
    Created : BOOL

}
