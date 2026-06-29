#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies options for view instancing.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_view_instancing_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_VIEW_INSTANCING_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates a default view instancing configuration.
     * @type {Integer (Int32)}
     */
    static D3D12_VIEW_INSTANCING_FLAG_NONE => 0

    /**
     * Enables view instance masking.
     * @type {Integer (Int32)}
     */
    static D3D12_VIEW_INSTANCING_FLAG_ENABLE_VIEW_INSTANCE_MASKING => 1
}
