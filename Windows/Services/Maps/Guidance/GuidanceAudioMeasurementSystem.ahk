#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the measurement system used for audio guidance.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * Regardless of the measurement system used for audio guidance ([AudioMeasurementSystem](guidancenavigator_audiomeasurementsystem.md)), the metric system is always used for distance and speed API values.
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceaudiomeasurementsystem
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class GuidanceAudioMeasurementSystem extends Win32Enum{

    /**
     * The metric system.
     * @type {Integer (Int32)}
     */
    static Meters => 0

    /**
     * The imperial system.
     * @type {Integer (Int32)}
     */
    static MilesAndYards => 1

    /**
     * The United States customary system.
     * @type {Integer (Int32)}
     */
    static MilesAndFeet => 2
}
