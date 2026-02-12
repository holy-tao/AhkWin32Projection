#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialCoordinateSystem.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a coordinate system used to reason about the user's surroundings.
 * @remarks
 * Methods that return spatial information, represented as points, rays, or volumes in the user's surroundings, will accept a SpatialCoordinateSystem parameter to let you decide the coordinate system in which it's most useful for those coordinates to be returned. The units for these coordinates will always be in meters.
 * 
 * Each SpatialCoordinateSystem has a dynamic relationship with other coordinate systems, including those that represent the user's position. At any point in time, the device may be able to locate some coordinate systems and not others. For most coordinate systems, your app must be ready to handle periods of time during which they cannot be located.
 * 
 * To get a SpatialCoordinateSystem based on the position of the device, use the SpatialLocator class to create either a locator-attached or stationary frame of reference.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialcoordinatesystem
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialCoordinateSystem extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialCoordinateSystem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialCoordinateSystem.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Provides a transform matrix that you can use to convert geometry expressed in one coordinate system to another coordinate system.
     * @remarks
     * This method will return null if the target coordinate system cannot be located relative to this one at the moment.
     * @param {SpatialCoordinateSystem} target The target coordinate system that you want to transform geometry to.
     * @returns {IReference<Matrix4x4>} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialcoordinatesystem.trygettransformto
     */
    TryGetTransformTo(target) {
        if (!this.HasProp("__ISpatialCoordinateSystem")) {
            if ((queryResult := this.QueryInterface(ISpatialCoordinateSystem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialCoordinateSystem := ISpatialCoordinateSystem(outPtr)
        }

        return this.__ISpatialCoordinateSystem.TryGetTransformTo(target)
    }

;@endregion Instance Methods
}
