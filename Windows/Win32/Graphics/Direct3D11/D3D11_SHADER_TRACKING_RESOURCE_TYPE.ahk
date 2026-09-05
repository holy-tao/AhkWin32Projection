#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates which resource types to track.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11tracingdevice-setshadertrackingoptionsbytype">ID3D11TracingDevice::SetShaderTrackingOptionsByType</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11refdefaulttrackingoptions-settrackingoptions">ID3D11RefDefaultTrackingOptions::SetTrackingOptions</a> method tracks a specific type of resource.
 * 
 * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_shader_tracking_resource_type
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3D11_SHADER_TRACKING_RESOURCE_TYPE extends Win32Enum {

    /**
     * No resource types are tracked.
     * Native name: D3D11_SHADER_TRACKING_RESOURCE_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Track device memory that is created with unordered access view (UAV) bind flags.
     * Native name: D3D11_SHADER_TRACKING_RESOURCE_TYPE_UAV_DEVICEMEMORY
     * @type {Integer (Int32)}
     */
    static UAV_DEVICEMEMORY => 1

    /**
     * Track device memory that is created without UAV bind flags.
     * Native name: D3D11_SHADER_TRACKING_RESOURCE_TYPE_NON_UAV_DEVICEMEMORY
     * @type {Integer (Int32)}
     */
    static NON_UAV_DEVICEMEMORY => 2

    /**
     * Track all device memory.
     * Native name: D3D11_SHADER_TRACKING_RESOURCE_TYPE_ALL_DEVICEMEMORY
     * @type {Integer (Int32)}
     */
    static ALL_DEVICEMEMORY => 3

    /**
     * Track all shaders that use group shared memory.
     * Native name: D3D11_SHADER_TRACKING_RESOURCE_TYPE_GROUPSHARED_MEMORY
     * @type {Integer (Int32)}
     */
    static GROUPSHARED_MEMORY => 4

    /**
     * Track all device memory except device memory that is created without UAV bind flags.
     * Native name: D3D11_SHADER_TRACKING_RESOURCE_TYPE_ALL_SHARED_MEMORY
     * @type {Integer (Int32)}
     */
    static ALL_SHARED_MEMORY => 5

    /**
     * Track all device memory except device memory that is created with UAV bind flags.
     * Native name: D3D11_SHADER_TRACKING_RESOURCE_TYPE_GROUPSHARED_NON_UAV
     * @type {Integer (Int32)}
     */
    static GROUPSHARED_NON_UAV => 6

    /**
     * Track all memory on the device.
     * Native name: D3D11_SHADER_TRACKING_RESOURCE_TYPE_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 7
}
