#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Indicates a list of protected resource session types.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_protected_resource_session_types
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_PROTECTED_RESOURCE_SESSION_TYPES {
    #StructPack 8

    /**
     * Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * An input parameter which, in multi-adapter operation, indicates which physical adapter of the device this operation applies to.
     */
    NodeIndex : UInt32

    /**
     * Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * An input parameter indicating the size of the *pTypes* array. This must match the count returned through the [D3D12_FEATURE_PROTECTED_RESOURCE_SESSION_TYPE_COUNT](ne-d3d12-d3d12_feature.md) query.
     */
    Count : UInt32

    /**
     * Type: **[GUID](/windows/desktop/winprog/windows-data-types)\***
     * 
     * An output parameter containing an array populated with the supported protected resource session types.
     */
    pTypes : Guid.Ptr

}
