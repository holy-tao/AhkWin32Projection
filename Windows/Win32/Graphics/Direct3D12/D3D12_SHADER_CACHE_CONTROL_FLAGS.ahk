#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify shader cache control options.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_shader_cache_control_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_SHADER_CACHE_CONTROL_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies that the cache shouldn't be used to look up data, and shouldn't have new data stored in it. Attempts to use/create a cache while it's disabled result in **DXGI_ERROR_NOT_CURRENTLY_AVAILABLE**.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_CONTROL_FLAG_DISABLE => 1

    /**
     * Specfies that use of the cache should be resumed.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_CONTROL_FLAG_ENABLE => 2

    /**
     * Specfies that any existing contents of the cache should be deleted.
     * @type {Integer (Int32)}
     */
    static D3D12_SHADER_CACHE_CONTROL_FLAG_CLEAR => 4
}
