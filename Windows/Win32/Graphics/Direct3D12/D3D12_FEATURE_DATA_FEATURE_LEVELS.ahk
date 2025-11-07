#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes info about the feature levels supported by the current graphics driver.
 * @remarks
 * 
 * See <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_feature">D3D12_FEATURE</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_feature_data_feature_levels
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_FEATURE_LEVELS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature levels</a> in the array at <b>pFeatureLevelsRequested</b>.
     * @type {Integer}
     */
    NumFeatureLevels {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a>s that the application is requesting for the driver and hardware to evaluate.
     * @type {Pointer<Integer>}
     */
    pFeatureLevelsRequested {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The maximum <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> that the driver and hardware support.
     * @type {Integer}
     */
    MaxSupportedFeatureLevel {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
