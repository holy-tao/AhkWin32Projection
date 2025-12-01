#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates whether or not Enhanced Barriers are supported.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options12
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_D3D12_OPTIONS12 extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: \_Out\_ **[D3D12_TRI_STATE](ne-d3d12-d3d12_tri_state.md)**
     * 
     * TBD
     * @type {Integer}
     */
    MSPrimitivesPipelineStatisticIncludesCulledPrimitives {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: \_Out\_ **[BOOL](/windows/win32/winprog/windows-data-types)**
     * 
     * Indicates whether or not Enhanced Barriers are supported. `true` if supported, otherwise `false`.
     * 
     * Enhanced Barriers is not currently a hardware or driver requirement. So before using command list Barrier APIs, or resource creation APIs using the *InitialLayout* parameter, you must check for optional driver support via *EnhancedBarriersSupported*.
     * 
     * Requires the DirectX 12 Agility SDK 1.7 or later; otherwise, the value is always `FALSE`.
     * @type {BOOL}
     */
    EnhancedBarriersSupported {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: \_Out\_ **[BOOL](/windows/win32/winprog/windows-data-types)**
     * 
     * Technically used to indicate support for the functionality that enables integer aliasing.
     * 
     * Requires the DirectX 12 Agility SDK 1.7 or later; otherwise, the value is always `FALSE`.
     * @type {BOOL}
     */
    RelaxedFormatCastingSupported {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
