#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies types of audio notifications that are used during navigation.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceaudionotifications
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class GuidanceAudioNotifications extends Win32BitflagEnum{

    /**
     * No audio notifications are selected.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Maneuver notifications.
     * @type {Integer (UInt32)}
     */
    static Maneuver => 1

    /**
     * Route notifications.
     * @type {Integer (UInt32)}
     */
    static Route => 2

    /**
     * GPS notifications.
     * @type {Integer (UInt32)}
     */
    static Gps => 4

    /**
     * Speed limit notifications.
     * @type {Integer (UInt32)}
     */
    static SpeedLimit => 8

    /**
     * Traffic notifications.
     * @type {Integer (UInt32)}
     */
    static Traffic => 16

    /**
     * Traffic camera notifications.
     * @type {Integer (UInt32)}
     */
    static TrafficCamera => 32
}
