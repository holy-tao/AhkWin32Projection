#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_PROTECTED_RESOURCE_SESSION_FLAGS.ahk" { D3D12_PROTECTED_RESOURCE_SESSION_FLAGS }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Describes flags and protection type for a protected resource session, per adapter.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_protected_resource_session_desc1
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_PROTECTED_RESOURCE_SESSION_DESC1 {
    #StructPack 4

    /**
     * Type: **[UINT](/windows/win32/WinProg/windows-data-types)**
     * 
     * The node mask. For single GPU operation, set this to zero. If there are multiple GPU nodes, then set a bit to identify the node (the device's physical adapter) to which the protected session applies. Each bit in the mask corresponds to a single node. Only 1 bit may be set.
     */
    NodeMask : UInt32

    /**
     * Type: **[D3D12_PROTECTED_RESOURCE_SESSION_FLAGS](./ne-d3d12-d3d12_protected_resource_session_flags.md)**
     * 
     * Specifies the supported crypto sessions options.
     */
    Flags : D3D12_PROTECTED_RESOURCE_SESSION_FLAGS

    /**
     * Type: **[GUID](../guiddef/ns-guiddef-guid.md)**
     * 
     * The GUID that represents the protection type. Microsoft defines **D3D12_PROTECTED_RESOURCES_SESSION_HARDWARE_PROTECTED**.
     * 
     * Using the **D3D12_PROTECTED_RESOURCES_SESSION_HARDWARE_PROTECTED** GUID is equivalent to calling [**ID3D12Device4::CreateProtectedResourceSession**](./nf-d3d12-id3d12device4-createprotectedresourcesession.md).
     */
    ProtectionType : Guid

}
