#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of navigational guidance.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancemode
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class GuidanceMode extends Win32Enum{

    /**
     * Indicates that the engine is not active.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Navigational guidance is simulated.
     * @type {Integer (Int32)}
     */
    static Simulation => 1

    /**
     * Navigation guidance is active.
     * @type {Integer (Int32)}
     */
    static Navigation => 2

    /**
     * Navigational assistance is provided without a specified route.
     * @type {Integer (Int32)}
     */
    static Tracking => 3
}
