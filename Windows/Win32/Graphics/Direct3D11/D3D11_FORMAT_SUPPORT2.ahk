#Requires AutoHotkey v2.0.0 64-bit

/**
 * Unordered resource support options for a compute shader resource (see ID3D11Device::CheckFeatureSupport).
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_format_support2
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_FORMAT_SUPPORT2{

    /**
     * Format supports atomic add.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT2_UAV_ATOMIC_ADD => 1

    /**
     * Format supports atomic bitwise operations.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT2_UAV_ATOMIC_BITWISE_OPS => 2

    /**
     * Format supports atomic compare with store or exchange.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT2_UAV_ATOMIC_COMPARE_STORE_OR_COMPARE_EXCHANGE => 4

    /**
     * Format supports atomic exchange.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT2_UAV_ATOMIC_EXCHANGE => 8

    /**
     * Format supports atomic min and max.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT2_UAV_ATOMIC_SIGNED_MIN_OR_MAX => 16

    /**
     * Format supports atomic unsigned min and max.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT2_UAV_ATOMIC_UNSIGNED_MIN_OR_MAX => 32

    /**
     * Format supports a typed load.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT2_UAV_TYPED_LOAD => 64

    /**
     * Format supports a typed store.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT2_UAV_TYPED_STORE => 128

    /**
     * Format supports logic operations in blend state.
 * 
 * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.1.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT2_OUTPUT_MERGER_LOGIC_OP => 256

    /**
     * Format supports tiled resources.
 * 
 * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.2.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT2_TILED => 512

    /**
     * Format supports shareable resources.
 *               <div class="alert"><b>Note</b>  <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_R8G8B8A8_UNORM</a> and <b>DXGI_FORMAT_R8G8B8A8_UNORM_SRGB</b> are never shareable when using feature level 9, even if the device indicates optional feature support for <b>D3D11_FORMAT_SUPPORT_SHAREABLE</b>.
 *                 Attempting to create shared resources with DXGI formats <b>DXGI_FORMAT_R8G8B8A8_UNORM</b> and <b>DXGI_FORMAT_R8G8B8A8_UNORM_SRGB</b> will always fail unless the feature level is 10_0 or higher.
 *               </div>
 * <div> </div>
 * 
 * 
 * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.2.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT2_SHAREABLE => 1024

    /**
     * Format supports multi-plane overlays.
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT2_MULTIPLANE_OVERLAY => 16384

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_FORMAT_SUPPORT2_DISPLAYABLE => 65536
}
