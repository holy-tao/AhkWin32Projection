#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Options that specify how to perform shader debug tracking.
 * @remarks
 * This enumeration is used by the following methods:
 *         
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11refdefaulttrackingoptions-settrackingoptions">ID3D11RefDefaultTrackingOptions::SetTrackingOptions</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11reftrackingoptions-settrackingoptions">ID3D11RefTrackingOptions::SetTrackingOptions</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11tracingdevice-setshadertrackingoptions">ID3D11TracingDevice::SetShaderTrackingOptions</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11sdklayers/nf-d3d11sdklayers-id3d11tracingdevice-setshadertrackingoptionsbytype">ID3D11TracingDevice::SetShaderTrackingOptionsByType</a>
 * </li>
 * </ul>
 * <div class="alert"><b>Note</b>  This API requires the Windows Software Development Kit (SDK) for Windows 8.
 *       </div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_shader_tracking_options
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_SHADER_TRACKING_OPTIONS extends Win32Enum{

    /**
     * No debug tracking is performed.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_TRACKING_OPTION_IGNORE => 0

    /**
     * Track the reading of uninitialized data.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_TRACKING_OPTION_TRACK_UNINITIALIZED => 1

    /**
     * Track read-after-write hazards.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_TRACKING_OPTION_TRACK_RAW => 2

    /**
     * Track write-after-read hazards.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_TRACKING_OPTION_TRACK_WAR => 4

    /**
     * Track write-after-write hazards.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_TRACKING_OPTION_TRACK_WAW => 8

    /**
     * Track that hazards are allowed in which data is written but the value does not change.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_TRACKING_OPTION_ALLOW_SAME => 16

    /**
     * Track that only one type of atomic operation is used on an address.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_TRACKING_OPTION_TRACK_ATOMIC_CONSISTENCY => 32

    /**
     * Track read-after-write hazards across thread groups.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_TRACKING_OPTION_TRACK_RAW_ACROSS_THREADGROUPS => 64

    /**
     * Track write-after-read hazards across thread groups.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_TRACKING_OPTION_TRACK_WAR_ACROSS_THREADGROUPS => 128

    /**
     * Track write-after-write hazards across thread groups.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_TRACKING_OPTION_TRACK_WAW_ACROSS_THREADGROUPS => 256

    /**
     * Track that only one type of atomic operation is used on an address across thread groups.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_TRACKING_OPTION_TRACK_ATOMIC_CONSISTENCY_ACROSS_THREADGROUPS => 512

    /**
     * Track hazards that are specific to unordered access views (UAVs).
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_TRACKING_OPTION_UAV_SPECIFIC_FLAGS => 960

    /**
     * Track all hazards.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_TRACKING_OPTION_ALL_HAZARDS => 1006

    /**
     * Track all hazards and track that hazards are allowed in which data is written but the value does not change.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_TRACKING_OPTION_ALL_HAZARDS_ALLOWING_SAME => 1022

    /**
     * All of the preceding tracking options are set except <b>D3D11_SHADER_TRACKING_OPTION_IGNORE</b>.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_TRACKING_OPTION_ALL_OPTIONS => 1023
}
