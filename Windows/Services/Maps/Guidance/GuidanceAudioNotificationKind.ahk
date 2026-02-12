#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the types of audio notifications that are requested when the [AudioNotificationRequested](guidancenavigator_audionotificationrequested.md) event is triggered.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceaudionotificationkind
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class GuidanceAudioNotificationKind extends Win32Enum{

    /**
     * Maneuver notifications.
     * @type {Integer (Int32)}
     */
    static Maneuver => 0

    /**
     * Route notifications.
     * @type {Integer (Int32)}
     */
    static Route => 1

    /**
     * GPS notifications.
     * @type {Integer (Int32)}
     */
    static Gps => 2

    /**
     * Speed limit notifications.
     * @type {Integer (Int32)}
     */
    static SpeedLimit => 3

    /**
     * Traffic notifications.
     * @type {Integer (Int32)}
     */
    static Traffic => 4

    /**
     * Traffic camera notifications.
     * @type {Integer (Int32)}
     */
    static TrafficCamera => 5
}
