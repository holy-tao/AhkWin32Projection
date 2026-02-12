#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the lifecycle state of the device's spatial location system. This lets an app know whether it can reason about the device's orientation or its position in the user's surroundings.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallocatability
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialLocatability extends Win32Enum{

    /**
     * The device's spatial location system is not available.
     * @type {Integer (Int32)}
     */
    static Unavailable => 0

    /**
     * The device is reporting its orientation, and has not been asked to report its position in the user's surroundings.
     * @type {Integer (Int32)}
     */
    static OrientationOnly => 1

    /**
     * The device is reporting its orientation, and is preparing to locate its position in the user's surroundings.
     * @type {Integer (Int32)}
     */
    static PositionalTrackingActivating => 2

    /**
     * The device is reporting its orientation and position in the user's surroundings.
     * @type {Integer (Int32)}
     */
    static PositionalTrackingActive => 3

    /**
     * The device is reporting its orientation, but cannot locate its position in the user's surroundings due to external factors, like lighting conditions.
     * @type {Integer (Int32)}
     */
    static PositionalTrackingInhibited => 4
}
