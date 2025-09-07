#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies options for the amount of information to report about a live device object's lifetime.
 * @remarks
 * This enumeration is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugdevice-reportlivedeviceobjects">ID3D12DebugDevice::ReportLiveDeviceObjects</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_rldo_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RLDO_FLAGS{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D12_RLDO_NONE => 0

    /**
     * Obtain a summary about a live device object's lifetime.
     * @type {Integer (Int32)}
     */
    static D3D12_RLDO_SUMMARY => 1

    /**
     * Obtain detailed information about a live device object's lifetime.
     * @type {Integer (Int32)}
     */
    static D3D12_RLDO_DETAIL => 2

    /**
     * This flag indicates to ignore objects which have no external refcounts keeping them alive. D3D objects are printed using an external refcount and an internal refcount. Typically, all objects are printed. This flag means ignore the objects whose external refcount is 0, because the application is not responsible for keeping them alive.
     * @type {Integer (Int32)}
     */
    static D3D12_RLDO_IGNORE_INTERNAL => 4
}
