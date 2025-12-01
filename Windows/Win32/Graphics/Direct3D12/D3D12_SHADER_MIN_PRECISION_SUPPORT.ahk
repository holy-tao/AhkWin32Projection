#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes minimum precision support options for shaders in the current graphics driver.
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options">D3D12_FEATURE_DATA_D3D12_OPTIONS</a> structure.
 *       
 * 
 * The returned info just indicates that the graphics hardware can perform HLSL operations at a lower precision than the standard 32-bit float precision, but doesn’t guarantee that the graphics hardware will actually run at a lower precision.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_shader_min_precision_support
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SHADER_MIN_PRECISION_SUPPORT extends Win32BitflagEnum{

    /**
     * The driver supports only full 32-bit precision for all shader stages.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_MIN_PRECISION_SUPPORT_NONE => 0

    /**
     * The driver supports 10-bit precision.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_MIN_PRECISION_SUPPORT_10_BIT => 1

    /**
     * The driver supports 16-bit precision.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_MIN_PRECISION_SUPPORT_16_BIT => 2
}
