#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_PROTECTED_RESOURCE_SESSION_FLAGS.ahk" { D3D12_PROTECTED_RESOURCE_SESSION_FLAGS }

/**
 * Describes flags for a protected resource session, per adapter.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_protected_resource_session_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_PROTECTED_RESOURCE_SESSION_DESC {
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

}
