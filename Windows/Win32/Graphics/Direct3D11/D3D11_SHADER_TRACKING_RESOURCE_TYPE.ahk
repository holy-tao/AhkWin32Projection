#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates which resource types to track.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11tracingdevice-setshadertrackingoptionsbytype">ID3D11TracingDevice::SetShaderTrackingOptionsByType</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11refdefaulttrackingoptions-settrackingoptions">ID3D11RefDefaultTrackingOptions::SetTrackingOptions</a> method tracks a specific type of resource.
 * 
 * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11sdklayers/ne-d3d11sdklayers-d3d11_shader_tracking_resource_type
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_SHADER_TRACKING_RESOURCE_TYPE{

    /**
     * No resource types are tracked.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_TRACKING_RESOURCE_TYPE_NONE => 0

    /**
     * Track device memory that is created with unordered access view (UAV) bind flags.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_TRACKING_RESOURCE_TYPE_UAV_DEVICEMEMORY => 1

    /**
     * Track device memory that is created without UAV bind flags.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_TRACKING_RESOURCE_TYPE_NON_UAV_DEVICEMEMORY => 2

    /**
     * Track all device memory.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_TRACKING_RESOURCE_TYPE_ALL_DEVICEMEMORY => 3

    /**
     * Track all shaders that use group shared memory.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_TRACKING_RESOURCE_TYPE_GROUPSHARED_MEMORY => 4

    /**
     * Track all device memory except device memory that is created without UAV bind flags.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_TRACKING_RESOURCE_TYPE_ALL_SHARED_MEMORY => 5

    /**
     * Track all device memory except device memory that is created with UAV bind flags.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_TRACKING_RESOURCE_TYPE_GROUPSHARED_NON_UAV => 6

    /**
     * Track all memory on the device.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_TRACKING_RESOURCE_TYPE_ALL => 7
}
