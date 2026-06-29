#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_PROTECTED_RESOURCE_SESSION_SUPPORT_FLAGS.ahk" { D3D12_PROTECTED_RESOURCE_SESSION_SUPPORT_FLAGS }

/**
 * Indicates the level of support for protected resource sessions.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_protected_resource_session_support
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_PROTECTED_RESOURCE_SESSION_SUPPORT {
    #StructPack 4

    /**
     * Type: **[UINT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * An input field, indicating the adapter index to query.
     */
    NodeIndex : UInt32

    Support : D3D12_PROTECTED_RESOURCE_SESSION_SUPPORT_FLAGS

}
