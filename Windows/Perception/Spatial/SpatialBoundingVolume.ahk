#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialBoundingVolume.ahk
#Include .\ISpatialBoundingVolumeStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a bounding volume of some kind in the user's surroundings, for example, a box, oriented box, sphere or frustum.
 * @remarks
 * Once created, a SpatialBoundingVolume is opaque, and only intended to be passed to an API that expects one as input.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialboundingvolume
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialBoundingVolume extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialBoundingVolume

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialBoundingVolume.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a bounding volume from the specified box, with its coordinates interpreted within the specified coordinate system.
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system within which to interpret the bounding box's coordinates.
     * @param {SpatialBoundingBox} box The bounding box.
     * @returns {SpatialBoundingVolume} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialboundingvolume.frombox
     */
    static FromBox(coordinateSystem, box) {
        if (!SpatialBoundingVolume.HasProp("__ISpatialBoundingVolumeStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.SpatialBoundingVolume")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialBoundingVolumeStatics.IID)
            SpatialBoundingVolume.__ISpatialBoundingVolumeStatics := ISpatialBoundingVolumeStatics(factoryPtr)
        }

        return SpatialBoundingVolume.__ISpatialBoundingVolumeStatics.FromBox(coordinateSystem, box)
    }

    /**
     * Creates a bounding volume from the specified oriented box, with its coordinates interpreted within the specified coordinate system.
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system within which to interpret the bounding box's coordinates.
     * @param {SpatialBoundingOrientedBox} box The oriented bounding box.
     * @returns {SpatialBoundingVolume} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialboundingvolume.fromorientedbox
     */
    static FromOrientedBox(coordinateSystem, box) {
        if (!SpatialBoundingVolume.HasProp("__ISpatialBoundingVolumeStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.SpatialBoundingVolume")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialBoundingVolumeStatics.IID)
            SpatialBoundingVolume.__ISpatialBoundingVolumeStatics := ISpatialBoundingVolumeStatics(factoryPtr)
        }

        return SpatialBoundingVolume.__ISpatialBoundingVolumeStatics.FromOrientedBox(coordinateSystem, box)
    }

    /**
     * Creates a bounding volume from the specified sphere, with its coordinates interpreted within the specified coordinate system.
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system within which to interpret the bounding sphere's coordinates.
     * @param {SpatialBoundingSphere} sphere The bounding sphere.
     * @returns {SpatialBoundingVolume} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialboundingvolume.fromsphere
     */
    static FromSphere(coordinateSystem, sphere) {
        if (!SpatialBoundingVolume.HasProp("__ISpatialBoundingVolumeStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.SpatialBoundingVolume")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialBoundingVolumeStatics.IID)
            SpatialBoundingVolume.__ISpatialBoundingVolumeStatics := ISpatialBoundingVolumeStatics(factoryPtr)
        }

        return SpatialBoundingVolume.__ISpatialBoundingVolumeStatics.FromSphere(coordinateSystem, sphere)
    }

    /**
     * Creates a bounding volume from the specified frustum, with its coordinates interpreted within the specified coordinate system.
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system within which to interpret the bounding frustum's coordinates.
     * @param {SpatialBoundingFrustum} frustum The bounding frustum.
     * @returns {SpatialBoundingVolume} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialboundingvolume.fromfrustum
     */
    static FromFrustum(coordinateSystem, frustum) {
        if (!SpatialBoundingVolume.HasProp("__ISpatialBoundingVolumeStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.SpatialBoundingVolume")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialBoundingVolumeStatics.IID)
            SpatialBoundingVolume.__ISpatialBoundingVolumeStatics := ISpatialBoundingVolumeStatics(factoryPtr)
        }

        return SpatialBoundingVolume.__ISpatialBoundingVolumeStatics.FromFrustum(coordinateSystem, frustum)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
