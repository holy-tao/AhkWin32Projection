#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates the level of support for protected resource sessions.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_feature_data_protected_resource_session_support
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_PROTECTED_RESOURCE_SESSION_SUPPORT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: **[UINT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * An input field, indicating the adapter index to query.
     * @type {Integer}
     */
    NodeIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Support {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
