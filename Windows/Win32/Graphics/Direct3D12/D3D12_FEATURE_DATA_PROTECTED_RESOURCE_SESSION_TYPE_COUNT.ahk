#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates a count of protected resource session types.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_protected_resource_session_type_count
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_PROTECTED_RESOURCE_SESSION_TYPE_COUNT {
    #StructPack 4

    /**
     * Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * An input parameter which, in multi-adapter operation, indicates which physical adapter of the device this operation applies to.
     */
    NodeIndex : UInt32

    /**
     * Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * An output parameter containing the number of protected resource session types supported by the driver.
     */
    Count : UInt32

}
