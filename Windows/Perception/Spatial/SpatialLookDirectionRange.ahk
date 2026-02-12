#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The extent to which the user can look around with their headset.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatiallookdirectionrange
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialLookDirectionRange extends Win32Enum{

    /**
     * The user will generally be looking forward as defined by the [CoordinateSystem](spatialstageframeofreference_coordinatesystem.md) property.
     * @type {Integer (Int32)}
     */
    static ForwardOnly => 0

    /**
     * The user may look in any direction.
     * @type {Integer (Int32)}
     */
    static Omnidirectional => 1
}
