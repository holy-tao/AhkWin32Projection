#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Unordered resource support options for a compute shader resource (see ID3D11Device::CheckFeatureSupport).
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_format_support2
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3D11_FORMAT_SUPPORT2 extends Win32Enum {

    /**
     * Format supports atomic add.
     * Native name: D3D11_FORMAT_SUPPORT2_UAV_ATOMIC_ADD
     * @type {Integer (Int32)}
     */
    static UAV_ATOMIC_ADD => 1

    /**
     * Format supports atomic bitwise operations.
     * Native name: D3D11_FORMAT_SUPPORT2_UAV_ATOMIC_BITWISE_OPS
     * @type {Integer (Int32)}
     */
    static UAV_ATOMIC_BITWISE_OPS => 2

    /**
     * Format supports atomic compare with store or exchange.
     * Native name: D3D11_FORMAT_SUPPORT2_UAV_ATOMIC_COMPARE_STORE_OR_COMPARE_EXCHANGE
     * @type {Integer (Int32)}
     */
    static UAV_ATOMIC_COMPARE_STORE_OR_COMPARE_EXCHANGE => 4

    /**
     * Format supports atomic exchange.
     * Native name: D3D11_FORMAT_SUPPORT2_UAV_ATOMIC_EXCHANGE
     * @type {Integer (Int32)}
     */
    static UAV_ATOMIC_EXCHANGE => 8

    /**
     * Format supports atomic min and max.
     * Native name: D3D11_FORMAT_SUPPORT2_UAV_ATOMIC_SIGNED_MIN_OR_MAX
     * @type {Integer (Int32)}
     */
    static UAV_ATOMIC_SIGNED_MIN_OR_MAX => 16

    /**
     * Format supports atomic unsigned min and max.
     * Native name: D3D11_FORMAT_SUPPORT2_UAV_ATOMIC_UNSIGNED_MIN_OR_MAX
     * @type {Integer (Int32)}
     */
    static UAV_ATOMIC_UNSIGNED_MIN_OR_MAX => 32

    /**
     * Format supports a typed load.
     * Native name: D3D11_FORMAT_SUPPORT2_UAV_TYPED_LOAD
     * @type {Integer (Int32)}
     */
    static UAV_TYPED_LOAD => 64

    /**
     * Format supports a typed store.
     * Native name: D3D11_FORMAT_SUPPORT2_UAV_TYPED_STORE
     * @type {Integer (Int32)}
     */
    static UAV_TYPED_STORE => 128

    /**
     * Format supports logic operations in blend state.
     * 
     * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.1.
     * Native name: D3D11_FORMAT_SUPPORT2_OUTPUT_MERGER_LOGIC_OP
     * @type {Integer (Int32)}
     */
    static OUTPUT_MERGER_LOGIC_OP => 256

    /**
     * Format supports tiled resources.
     * 
     * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.2.
     * Native name: D3D11_FORMAT_SUPPORT2_TILED
     * @type {Integer (Int32)}
     */
    static TILED => 512

    /**
     * Format supports shareable resources.
     *               <div class="alert"><b>Note</b>  <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_R8G8B8A8_UNORM</a> and <b>DXGI_FORMAT_R8G8B8A8_UNORM_SRGB</b> are never shareable when using feature level 9, even if the device indicates optional feature support for <b>D3D11_FORMAT_SUPPORT_SHAREABLE</b>.
     *                 Attempting to create shared resources with DXGI formats <b>DXGI_FORMAT_R8G8B8A8_UNORM</b> and <b>DXGI_FORMAT_R8G8B8A8_UNORM_SRGB</b> will always fail unless the feature level is 10_0 or higher.
     *               </div>
     * <div> </div>
     * 
     * 
     * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.2.
     * Native name: D3D11_FORMAT_SUPPORT2_SHAREABLE
     * @type {Integer (Int32)}
     */
    static SHAREABLE => 1024

    /**
     * Format supports multi-plane overlays.
     * Native name: D3D11_FORMAT_SUPPORT2_MULTIPLANE_OVERLAY
     * @type {Integer (Int32)}
     */
    static MULTIPLANE_OVERLAY => 16384

    /**
     * Native name: D3D11_FORMAT_SUPPORT2_DISPLAYABLE
     * @type {Integer (Int32)}
     */
    static DISPLAYABLE => 65536
}
