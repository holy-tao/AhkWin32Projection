#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The device-driver type.
 * @remarks
 * The device-driver type needs to be specified when the device is created (using <a href="https://docs.microsoft.com/windows/desktop/api/d3d10misc/nf-d3d10misc-d3d10createdevice">D3D10CreateDevice</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d10misc/nf-d3d10misc-d3d10createdeviceandswapchain">D3D10CreateDeviceAndSwapChain</a>). 
 * 
 * For information about limitations creating nonhardware-type devices on certain feature levels, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-limitations">Limitations Creating WARP and Reference Devices</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10misc/ne-d3d10misc-d3d10_driver_type
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
class D3D10_DRIVER_TYPE extends Win32Enum {

    /**
     * A hardware device; commonly called a HAL device.
     * Native name: D3D10_DRIVER_TYPE_HARDWARE
     * @type {Integer (Int32)}
     */
    static HARDWARE => 0

    /**
     * A reference device; commonly called a REF device.
     * Native name: D3D10_DRIVER_TYPE_REFERENCE
     * @type {Integer (Int32)}
     */
    static REFERENCE => 1

    /**
     * A NULL device; which is a reference device without render capability.
     * Native name: D3D10_DRIVER_TYPE_NULL
     * @type {Integer (Int32)}
     */
    static NULL => 2

    /**
     * Reserved for later use.
     * Native name: D3D10_DRIVER_TYPE_SOFTWARE
     * @type {Integer (Int32)}
     */
    static SOFTWARE => 3

    /**
     * A WARP driver, which is a high-performance software rasterizer. The rasterizer supports feature level 9_1 through level 10.1 with a 
     *         high performance software implementation when hardware is not available. For more information about using a WARP driver, see <a href="https://docs.microsoft.com/windows/desktop/direct3darticles/directx-warp">Windows Advanced Rasterization Platform (WARP) In-Depth Guide</a>.
     *         Note that WARP is only available with the DirectX 11 Runtime (Windows 7, Windows Server 2008 R2, updated Windows Vista [KB971644]).
     * Native name: D3D10_DRIVER_TYPE_WARP
     * @type {Integer (Int32)}
     */
    static WARP => 5
}
