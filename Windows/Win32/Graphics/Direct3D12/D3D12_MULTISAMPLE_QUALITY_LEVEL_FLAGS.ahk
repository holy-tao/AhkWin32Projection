#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies options for determining quality levels.
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_feature_data_multisample_quality_levels">D3D12_FEATURE_DATA_MULTISAMPLE_QUALITY_LEVELS</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_multisample_quality_level_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_MULTISAMPLE_QUALITY_LEVEL_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No options are supported.
     * @type {Integer (Int32)}
     */
    static D3D12_MULTISAMPLE_QUALITY_LEVELS_FLAG_NONE => 0

    /**
     * The number of quality levels can be determined for tiled resources.
     * @type {Integer (Int32)}
     */
    static D3D12_MULTISAMPLE_QUALITY_LEVELS_FLAG_TILED_RESOURCE => 1
}
