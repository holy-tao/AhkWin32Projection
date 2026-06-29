#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Direct3D\D3D_FEATURE_LEVEL.ahk" { D3D_FEATURE_LEVEL }

/**
 * Describes info about the feature levels supported by the current graphics driver.
 * @remarks
 * See <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_feature">D3D12_FEATURE</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_feature_levels
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_FEATURE_LEVELS {
    #StructPack 8

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature levels</a> in the array at <b>pFeatureLevelsRequested</b>.
     */
    NumFeatureLevels : UInt32

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">D3D_FEATURE_LEVEL</a>s that the application is requesting for the driver and hardware to evaluate.
     */
    pFeatureLevelsRequested : D3D_FEATURE_LEVEL.Ptr

    /**
     * The maximum <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> that the driver and hardware support.
     */
    MaxSupportedFeatureLevel : D3D_FEATURE_LEVEL

}
