#Requires AutoHotkey v2.0.0 64-bit

/**
 * The device-driver type.
 * @remarks
 * 
  * The device-driver type needs to be specified when the device is created (using <a href="https://docs.microsoft.com/windows/desktop/api/d3d10misc/nf-d3d10misc-d3d10createdevice">D3D10CreateDevice</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d10misc/nf-d3d10misc-d3d10createdeviceandswapchain">D3D10CreateDeviceAndSwapChain</a>). 
  * 
  * For information about limitations creating nonhardware-type devices on certain feature levels, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-limitations">Limitations Creating WARP and Reference Devices</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10misc/ne-d3d10misc-d3d10_driver_type
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_DRIVER_TYPE{

    /**
     * A hardware device; commonly called a HAL device.
     * @type {Integer (Int32)}
     */
    static D3D10_DRIVER_TYPE_HARDWARE => 0

    /**
     * A reference device; commonly called a REF device.
     * @type {Integer (Int32)}
     */
    static D3D10_DRIVER_TYPE_REFERENCE => 1

    /**
     * A NULL device; which is a reference device without render capability.
     * @type {Integer (Int32)}
     */
    static D3D10_DRIVER_TYPE_NULL => 2

    /**
     * Reserved for later use.
     * @type {Integer (Int32)}
     */
    static D3D10_DRIVER_TYPE_SOFTWARE => 3

    /**
     * A WARP driver, which is a high-performance software rasterizer. The rasterizer supports feature level 9_1 through level 10.1 with a 
 *         high performance software implementation when hardware is not available. For more information about using a WARP driver, see <a href="https://docs.microsoft.com/windows/desktop/direct3darticles/directx-warp">Windows Advanced Rasterization Platform (WARP) In-Depth Guide</a>.
 *         Note that WARP is only available with the DirectX 11 Runtime (Windows 7, Windows Server 2008 R2, updated Windows Vista [KB971644]).
     * @type {Integer (Int32)}
     */
    static D3D10_DRIVER_TYPE_WARP => 5
}
