#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies how to check multisample quality levels.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_2/ne-d3d11_2-d3d11_check_multisample_quality_levels_flag
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_CHECK_MULTISAMPLE_QUALITY_LEVELS_FLAG {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates to check the multisample quality levels of a tiled resource.
     * @type {Integer (Int32)}
     */
    static D3D11_CHECK_MULTISAMPLE_QUALITY_LEVELS_TILED_RESOURCE => 1
}
