#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates a count of protected resource session types.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_protected_resource_session_type_count
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_PROTECTED_RESOURCE_SESSION_TYPE_COUNT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * An input parameter which, in multi-adapter operation, indicates which physical adapter of the device this operation applies to.
     * @type {Integer}
     */
    NodeIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[UINT](/windows/desktop/winprog/windows-data-types)**
     * 
     * An output parameter containing the number of protected resource session types supported by the driver.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
