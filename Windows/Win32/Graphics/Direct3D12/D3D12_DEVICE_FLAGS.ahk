#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DEVICE_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DEVICE_FLAG_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DEVICE_FLAG_DEBUG_LAYER_ENABLED => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DEVICE_FLAG_GPU_BASED_VALIDATION_ENABLED => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DEVICE_FLAG_SYNCHRONIZED_COMMAND_QUEUE_VALIDATION_DISABLED => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DEVICE_FLAG_DRED_AUTO_BREADCRUMBS_ENABLED => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DEVICE_FLAG_DRED_PAGE_FAULT_REPORTING_ENABLED => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DEVICE_FLAG_DRED_WATSON_REPORTING_ENABLED => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DEVICE_FLAG_DRED_BREADCRUMB_CONTEXT_ENABLED => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DEVICE_FLAG_DRED_USE_MARKERS_ONLY_BREADCRUMBS => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DEVICE_FLAG_SHADER_INSTRUMENTATION_ENABLED => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DEVICE_FLAG_AUTO_DEBUG_NAME_ENABLED => 512

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_DEVICE_FLAG_FORCE_LEGACY_STATE_VALIDATION => 1024
}
