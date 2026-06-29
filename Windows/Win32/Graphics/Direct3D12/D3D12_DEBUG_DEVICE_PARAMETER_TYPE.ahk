#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the data type of the memory pointed to by the pData parameter of ID3D12DebugDevice1::SetDebugParameter and ID3D12DebugDevice1::GetDebugParameter.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_device_parameter_type
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DEBUG_DEVICE_PARAMETER_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates <i>pData</i> points to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_feature">D3D12_DEBUG_FEATURE</a> value.
     * @type {Integer (Int32)}
     */
    static D3D12_DEBUG_DEVICE_PARAMETER_FEATURE_FLAGS => 0

    /**
     * Indicates <i>pData</i> points to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_debug_device_gpu_based_validation_settings">D3D12_DEBUG_DEVICE_GPU_BASED_VALIDATION_SETTINGS</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D12_DEBUG_DEVICE_PARAMETER_GPU_BASED_VALIDATION_SETTINGS => 1

    /**
     * Indicates <i>pData</i> points to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_debug_device_gpu_slowdown_performance_factor">D3D12_DEBUG_DEVICE_GPU_SLOWDOWN_PERFORMANCE_FACTOR</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D12_DEBUG_DEVICE_PARAMETER_GPU_SLOWDOWN_PERFORMANCE_FACTOR => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DEBUG_DEVICE_PARAMETER_BYTECODE_VALIDATION_MODE => 3
}
