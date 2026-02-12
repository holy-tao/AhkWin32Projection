#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialStationaryFrameOfReference.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a frame of reference that remains stationary relative to the user's surroundings at a point in time.
 * @remarks
 * The SpatialStationaryFrameOfReference class represents a frame of reference that remains stationary relative to the user's surroundings as the user moves around. This frame of reference prioritizes keeping coordinates stable near the device. One key use of a SpatialStationaryFrameOfReference is to act as the underlying world coordinate system within a rendering engine when rendering seated-scale or world-scale experiences.
 * 
 * Holograms rendered at a coordinate in this frame stay generally in place as the user moves the device around. However, as the user walks around a large area and the device adjusts its understanding of their surroundings, these holograms may drift relative to the world. To avoid this drift and strongly anchor content to a point in the user's surroundings, create a [SpatialAnchor](spatialanchor.md). The system will then adjust the position of that SpatialAnchor relative to this and other frames of reference as required to keep that anchor precisely in place in the world.
 * 
 * To get a SpatialStationaryFrameOfReference, use the SpatialLocator class and call CreateStationaryFrameOfReferenceAtCurrentLocation.
 * 
 * To build a standing-scale or room-scale experience based on the floor plane or movement boundary defined by the user, an app can use the [SpatialStageFrameOfReference](spatialstageframeofreference.md) class instead.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialstationaryframeofreference
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialStationaryFrameOfReference extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialStationaryFrameOfReference

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialStationaryFrameOfReference.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a stationary coordinate system with an origin at the position and orientation of the device at the time this frame was created.
     * @remarks
     * The coordinate system is right-handed, with +y up, +x to the right, and -z forward.
     * 
     * Note that the origin is arbitrary. Coordinates are always most stable near the device rather than near this origin.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialstationaryframeofreference.coordinatesystem
     * @type {SpatialCoordinateSystem} 
     */
    CoordinateSystem {
        get => this.get_CoordinateSystem()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SpatialCoordinateSystem} 
     */
    get_CoordinateSystem() {
        if (!this.HasProp("__ISpatialStationaryFrameOfReference")) {
            if ((queryResult := this.QueryInterface(ISpatialStationaryFrameOfReference.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialStationaryFrameOfReference := ISpatialStationaryFrameOfReference(outPtr)
        }

        return this.__ISpatialStationaryFrameOfReference.get_CoordinateSystem()
    }

;@endregion Instance Methods
}
