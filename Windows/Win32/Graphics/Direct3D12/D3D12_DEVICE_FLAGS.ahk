#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_DEVICE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: D3D12_DEVICE_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Native name: D3D12_DEVICE_FLAG_DEBUG_LAYER_ENABLED
     * @type {Integer (Int32)}
     */
    static FLAG_DEBUG_LAYER_ENABLED => 1

    /**
     * Native name: D3D12_DEVICE_FLAG_GPU_BASED_VALIDATION_ENABLED
     * @type {Integer (Int32)}
     */
    static FLAG_GPU_BASED_VALIDATION_ENABLED => 2

    /**
     * Native name: D3D12_DEVICE_FLAG_SYNCHRONIZED_COMMAND_QUEUE_VALIDATION_DISABLED
     * @type {Integer (Int32)}
     */
    static FLAG_SYNCHRONIZED_COMMAND_QUEUE_VALIDATION_DISABLED => 4

    /**
     * Native name: D3D12_DEVICE_FLAG_DRED_AUTO_BREADCRUMBS_ENABLED
     * @type {Integer (Int32)}
     */
    static FLAG_DRED_AUTO_BREADCRUMBS_ENABLED => 8

    /**
     * Native name: D3D12_DEVICE_FLAG_DRED_PAGE_FAULT_REPORTING_ENABLED
     * @type {Integer (Int32)}
     */
    static FLAG_DRED_PAGE_FAULT_REPORTING_ENABLED => 16

    /**
     * Native name: D3D12_DEVICE_FLAG_DRED_WATSON_REPORTING_ENABLED
     * @type {Integer (Int32)}
     */
    static FLAG_DRED_WATSON_REPORTING_ENABLED => 32

    /**
     * Native name: D3D12_DEVICE_FLAG_DRED_BREADCRUMB_CONTEXT_ENABLED
     * @type {Integer (Int32)}
     */
    static FLAG_DRED_BREADCRUMB_CONTEXT_ENABLED => 64

    /**
     * Native name: D3D12_DEVICE_FLAG_DRED_USE_MARKERS_ONLY_BREADCRUMBS
     * @type {Integer (Int32)}
     */
    static FLAG_DRED_USE_MARKERS_ONLY_BREADCRUMBS => 128

    /**
     * Native name: D3D12_DEVICE_FLAG_SHADER_INSTRUMENTATION_ENABLED
     * @type {Integer (Int32)}
     */
    static FLAG_SHADER_INSTRUMENTATION_ENABLED => 256

    /**
     * Native name: D3D12_DEVICE_FLAG_AUTO_DEBUG_NAME_ENABLED
     * @type {Integer (Int32)}
     */
    static FLAG_AUTO_DEBUG_NAME_ENABLED => 512

    /**
     * Native name: D3D12_DEVICE_FLAG_FORCE_LEGACY_STATE_VALIDATION
     * @type {Integer (Int32)}
     */
    static FLAG_FORCE_LEGACY_STATE_VALIDATION => 1024
}
