#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the path of the lane.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancelanemarkers
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class GuidanceLaneMarkers extends Win32BitflagEnum{

    /**
     * No lane markers are present.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * A light right turn marker.
     * @type {Integer (UInt32)}
     */
    static LightRight => 1

    /**
     * A right turn marker.
     * @type {Integer (UInt32)}
     */
    static Right => 2

    /**
     * A hard right turn marker.
     * @type {Integer (UInt32)}
     */
    static HardRight => 4

    /**
     * A go straight marker.
     * @type {Integer (UInt32)}
     */
    static Straight => 8

    /**
     * A left U-turn marker.
     * @type {Integer (UInt32)}
     */
    static UTurnLeft => 16

    /**
     * A hard left turn marker.
     * @type {Integer (UInt32)}
     */
    static HardLeft => 32

    /**
     * A left turn marker.
     * @type {Integer (UInt32)}
     */
    static Left => 64

    /**
     * A light left turn marker.
     * @type {Integer (UInt32)}
     */
    static LightLeft => 128

    /**
     * A right U-turn marker.
     * @type {Integer (UInt32)}
     */
    static UTurnRight => 256

    /**
     * No lane marker information is available.
     * @type {Integer (UInt32)}
     */
    static Unknown => 4294967295
}
