#Requires AutoHotkey v2.0.0 64-bit

/**
 * The version of hardware acceleration requested.
 * @remarks
 * 
  * Use this enumeration when creating a device with <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/nf-d3d10_1-d3d10createdevice1">D3D10CreateDevice1</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d10_1/nf-d3d10_1-d3d10createdeviceandswapchain1">D3D10CreateDeviceAndSwapChain1</a>.
  * 
  * Note that 10level9 feature levels 9_1, 9_2, and 9_3 are only available with the Direct3D 11 runtime (Windows 7, Windows Server 2008 R2, updated 
  *       Windows Vista with Service Pack 2 (SP2) [<a href="https://support.microsoft.com/kb/971644">KB 971644</a>], and updated Windows Server 2008 [<a href="https://support.microsoft.com/kb/971512/">KB 971512</a>]).
  * 
  * For information about limitations creating nonhardware-type devices on certain feature levels, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-limitations">Limitations Creating WARP and Reference Devices</a>.
  * 
  * For an overview of 
  *       the capabilities of each feature level, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">Overview For Each Feature Level</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10_1/ne-d3d10_1-d3d10_feature_level1
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_FEATURE_LEVEL1{

    /**
     * The hardware supports Direct3D 10.0 features.
     * @type {Integer (Int32)}
     */
    static D3D10_FEATURE_LEVEL_10_0 => 40960

    /**
     * The hardware supports Direct3D 10.1 features.
     * @type {Integer (Int32)}
     */
    static D3D10_FEATURE_LEVEL_10_1 => 41216

    /**
     * The hardware supports 9.1 <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a>.
     * @type {Integer (Int32)}
     */
    static D3D10_FEATURE_LEVEL_9_1 => 37120

    /**
     * The hardware supports 9.2 <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a>.
     * @type {Integer (Int32)}
     */
    static D3D10_FEATURE_LEVEL_9_2 => 37376

    /**
     * The hardware supports 9.3 <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a>.
     * @type {Integer (Int32)}
     */
    static D3D10_FEATURE_LEVEL_9_3 => 37632
}
