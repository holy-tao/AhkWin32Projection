#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the multi-sampling image quality levels for a given format and sample count.
 * @remarks
 * See <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_feature">D3D12_FEATURE</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_multisample_quality_levels
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_MULTISAMPLE_QUALITY_LEVELS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value for the format to return info about.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The number of multi-samples per pixel to return info about.
     * @type {Integer}
     */
    SampleCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Flags to control quality levels, as a bitwise-OR'd combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_multisample_quality_level_flags">D3D12_MULTISAMPLE_QUALITY_LEVEL_FLAGS</a> enumeration constants.
     *             The resulting value specifies options for determining quality levels.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The number of quality levels.
     * @type {Integer}
     */
    NumQualityLevels {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
