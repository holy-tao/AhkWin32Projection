#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies which unordered resource options are supported for a provided format.
 * @remarks
 * 
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_feature_data_format_support">D3D12_FEATURE_DATA_FORMAT_SUPPORT</a> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_format_support2
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_FORMAT_SUPPORT2{

    /**
     * No unordered resource options are supported.
     * @type {Integer (Int32)}
     */
    static D3D12_FORMAT_SUPPORT2_NONE => 0

    /**
     * Format supports atomic add.
     * @type {Integer (Int32)}
     */
    static D3D12_FORMAT_SUPPORT2_UAV_ATOMIC_ADD => 1

    /**
     * Format supports atomic bitwise operations.
     * @type {Integer (Int32)}
     */
    static D3D12_FORMAT_SUPPORT2_UAV_ATOMIC_BITWISE_OPS => 2

    /**
     * Format supports atomic compare with store or exchange.
     * @type {Integer (Int32)}
     */
    static D3D12_FORMAT_SUPPORT2_UAV_ATOMIC_COMPARE_STORE_OR_COMPARE_EXCHANGE => 4

    /**
     * Format supports atomic exchange.
     * @type {Integer (Int32)}
     */
    static D3D12_FORMAT_SUPPORT2_UAV_ATOMIC_EXCHANGE => 8

    /**
     * Format supports atomic min and max.
     * @type {Integer (Int32)}
     */
    static D3D12_FORMAT_SUPPORT2_UAV_ATOMIC_SIGNED_MIN_OR_MAX => 16

    /**
     * Format supports atomic unsigned min and max.
     * @type {Integer (Int32)}
     */
    static D3D12_FORMAT_SUPPORT2_UAV_ATOMIC_UNSIGNED_MIN_OR_MAX => 32

    /**
     * Format supports a typed load.
     * @type {Integer (Int32)}
     */
    static D3D12_FORMAT_SUPPORT2_UAV_TYPED_LOAD => 64

    /**
     * Format supports a typed store.
     * @type {Integer (Int32)}
     */
    static D3D12_FORMAT_SUPPORT2_UAV_TYPED_STORE => 128

    /**
     * Format supports logic operations in blend state.
     * @type {Integer (Int32)}
     */
    static D3D12_FORMAT_SUPPORT2_OUTPUT_MERGER_LOGIC_OP => 256

    /**
     * Format supports tiled resources. Refer to <a href="https://docs.microsoft.com/windows/desktop/direct3d12/volume-tiled-resources">Volume Tiled Resources</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_FORMAT_SUPPORT2_TILED => 512

    /**
     * Format supports multi-plane overlays.
     * @type {Integer (Int32)}
     */
    static D3D12_FORMAT_SUPPORT2_MULTIPLANE_OVERLAY => 16384

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FORMAT_SUPPORT2_SAMPLER_FEEDBACK => 32768

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_FORMAT_SUPPORT2_DISPLAYABLE => 65536
}
