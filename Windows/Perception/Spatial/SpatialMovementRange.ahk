#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The extent to which the user can move while wearing their headset.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialmovementrange
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialMovementRange extends Win32Enum{

    /**
     * The user can stand but has not defined a boundary within which they intend to walk while using the headset.
     * @type {Integer (Int32)}
     */
    static NoMovement => 0

    /**
     * The user can walk around within the bounds returned by [TryGetMovementBounds](spatialstageframeofreference_trygetmovementbounds_1236197507.md).
     * @type {Integer (Int32)}
     */
    static Bounded => 1
}
