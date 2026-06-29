#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_MULTISAMPLE_QUALITY_LEVEL_FLAGS.ahk" { D3D12_MULTISAMPLE_QUALITY_LEVEL_FLAGS }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }

/**
 * Describes the multi-sampling image quality levels for a given format and sample count.
 * @remarks
 * See <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_feature">D3D12_FEATURE</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_multisample_quality_levels
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_MULTISAMPLE_QUALITY_LEVELS {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value for the format to return info about.
     */
    Format : DXGI_FORMAT

    /**
     * The number of multi-samples per pixel to return info about.
     */
    SampleCount : UInt32

    /**
     * Flags to control quality levels, as a bitwise-OR'd combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_multisample_quality_level_flags">D3D12_MULTISAMPLE_QUALITY_LEVEL_FLAGS</a> enumeration constants.
     *             The resulting value specifies options for determining quality levels.
     */
    Flags : D3D12_MULTISAMPLE_QUALITY_LEVEL_FLAGS

    /**
     * The number of quality levels.
     */
    NumQualityLevels : UInt32

}
