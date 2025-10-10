#Requires AutoHotkey v2.0.0 64-bit

/**
 * Driver type options.
 * @remarks
 * 
  * The driver type is required when calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdevice">D3D11CreateDevice</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-d3d11createdeviceandswapchain">D3D11CreateDeviceAndSwapChain</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3dcommon/ne-d3dcommon-d3d_driver_type
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3D_DRIVER_TYPE{

    /**
     * The driver type is unknown.
     * @type {Integer (Int32)}
     */
    static D3D_DRIVER_TYPE_UNKNOWN => 0

    /**
     * A hardware driver, which implements Direct3D features in hardware. This is the primary driver that you should use in your Direct3D applications because it provides the best performance. A hardware driver uses hardware acceleration (on supported hardware) but can also use software for parts of the pipeline that are not supported in hardware. This driver type is often referred to as a hardware abstraction layer or HAL.
     * @type {Integer (Int32)}
     */
    static D3D_DRIVER_TYPE_HARDWARE => 1

    /**
     * A reference driver, which is a software implementation that supports every Direct3D feature. A reference driver is designed for accuracy rather than speed and as a result is slow but accurate. The rasterizer portion of the driver does make use of special CPU instructions whenever it can, but it is not intended for retail applications; use it only for feature testing, demonstration of functionality, debugging, or verifying bugs in other drivers. The reference device for this driver is installed by the Windows SDK 8.0 or later and is intended only as a debug aid for development purposes. This driver may be referred to as a REF driver, a reference driver, or a reference rasterizer.
 * 
 * <div class="alert"><b>Note</b>  When you use the REF driver in Windows Store apps,  the REF driver renders correctly but doesn't display any output on the screen. To verify bugs in hardware drivers for Windows Store apps, use <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_driver_type">D3D_DRIVER_TYPE_WARP</a> for the WARP driver instead.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static D3D_DRIVER_TYPE_REFERENCE => 2

    /**
     * A NULL driver, which is a reference driver without render capability. This driver is commonly used for debugging non-rendering API calls, it is not appropriate for retail applications. This driver is installed by the DirectX SDK.
     * @type {Integer (Int32)}
     */
    static D3D_DRIVER_TYPE_NULL => 3

    /**
     * A software driver, which is a driver implemented completely in software. The software implementation is not intended for a high-performance application due to its very slow performance.
     * @type {Integer (Int32)}
     */
    static D3D_DRIVER_TYPE_SOFTWARE => 4

    /**
     * A WARP driver, which is a high-performance software rasterizer. The rasterizer supports <a href="https://docs.microsoft.com/windows/desktop/api/d3dcommon/ne-d3dcommon-d3d_feature_level">feature levels</a> 9_1 through level 10_1 with a high performance software implementation. For information about limitations creating a WARP device on certain feature levels, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-limitations">Limitations Creating WARP and Reference Devices</a>. For more information about using a WARP driver, see <a href="https://docs.microsoft.com/windows/desktop/direct3darticles/directx-warp">Windows Advanced Rasterization Platform (WARP) In-Depth Guide</a>.
 * 
 * <div class="alert"><b>Note</b>  The WARP driver that Windows 8 includes supports <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature levels</a> 9_1 through level 11_1.</div>
 * <div> </div>
 * <div class="alert"><b>Note</b>  The WARP driver that Windows 8.1 includes fully supports <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a> 11_1, including tiled resources, <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_3/nf-dxgi1_3-idxgidevice3-trim">IDXGIDevice3::Trim</a>, shared BCn surfaces, minblend, and map default. </div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static D3D_DRIVER_TYPE_WARP => 5
}
