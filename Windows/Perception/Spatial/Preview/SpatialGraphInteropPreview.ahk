#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialGraphInteropPreviewStatics.ahk
#Include .\ISpatialGraphInteropPreviewStatics2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides preview functionality that lets apps track spatial nodes, allowing the user to reason about places and things in their surroundings.
 * @remarks
 * > [!NOTE]
 * > You generally won't write code against this type yourself.  Instead, you'll use a library designed for a given kind of spatial node, with that library calling into this type on your behalf.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.preview.spatialgraphinteroppreview
 * @namespace Windows.Perception.Spatial.Preview
 * @version WindowsRuntime 1.4
 */
class SpatialGraphInteropPreview extends IInspectable {
;@region Static Methods
    /**
     * Creates a spatial coordinate system that tracks adjustments to a static spatial node with its origin offset by the specified relative position.
     * @param {Guid} nodeId The static spatial node's ID.
     * @returns {SpatialCoordinateSystem} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.preview.spatialgraphinteroppreview.createcoordinatesystemfornode
     */
    static CreateCoordinateSystemForNode(nodeId) {
        if (!SpatialGraphInteropPreview.HasProp("__ISpatialGraphInteropPreviewStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.Preview.SpatialGraphInteropPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialGraphInteropPreviewStatics.IID)
            SpatialGraphInteropPreview.__ISpatialGraphInteropPreviewStatics := ISpatialGraphInteropPreviewStatics(factoryPtr)
        }

        return SpatialGraphInteropPreview.__ISpatialGraphInteropPreviewStatics.CreateCoordinateSystemForNode(nodeId)
    }

    /**
     * Creates a spatial coordinate system that tracks adjustments to a static spatial node with its origin offset and rotated by the specified relative position and orientation.
     * @param {Guid} nodeId The static spatial node's ID.
     * @param {Vector3} relativePosition The rigid positional offset from the spatial node origin to this coordinate system's origin, expressed within the coordinate system of the node origin.
     * @returns {SpatialCoordinateSystem} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.preview.spatialgraphinteroppreview.createcoordinatesystemfornode
     */
    static CreateCoordinateSystemForNodeWithPosition(nodeId, relativePosition) {
        if (!SpatialGraphInteropPreview.HasProp("__ISpatialGraphInteropPreviewStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.Preview.SpatialGraphInteropPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialGraphInteropPreviewStatics.IID)
            SpatialGraphInteropPreview.__ISpatialGraphInteropPreviewStatics := ISpatialGraphInteropPreviewStatics(factoryPtr)
        }

        return SpatialGraphInteropPreview.__ISpatialGraphInteropPreviewStatics.CreateCoordinateSystemForNodeWithPosition(nodeId, relativePosition)
    }

    /**
     * Creates a spatial coordinate system that tracks adjustments to a static spatial node.
     * @param {Guid} nodeId The static spatial node's ID.
     * @param {Vector3} relativePosition 
     * @param {Quaternion} relativeOrientation 
     * @returns {SpatialCoordinateSystem} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.preview.spatialgraphinteroppreview.createcoordinatesystemfornode
     */
    static CreateCoordinateSystemForNodeWithPositionAndOrientation(nodeId, relativePosition, relativeOrientation) {
        if (!SpatialGraphInteropPreview.HasProp("__ISpatialGraphInteropPreviewStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.Preview.SpatialGraphInteropPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialGraphInteropPreviewStatics.IID)
            SpatialGraphInteropPreview.__ISpatialGraphInteropPreviewStatics := ISpatialGraphInteropPreviewStatics(factoryPtr)
        }

        return SpatialGraphInteropPreview.__ISpatialGraphInteropPreviewStatics.CreateCoordinateSystemForNodeWithPositionAndOrientation(nodeId, relativePosition, relativeOrientation)
    }

    /**
     * Creates a spatial locator that tracks the motion of a dynamic spatial node.
     * @param {Guid} nodeId The dynamic spatial node's ID.
     * @returns {SpatialLocator} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.preview.spatialgraphinteroppreview.createlocatorfornode
     */
    static CreateLocatorForNode(nodeId) {
        if (!SpatialGraphInteropPreview.HasProp("__ISpatialGraphInteropPreviewStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.Preview.SpatialGraphInteropPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialGraphInteropPreviewStatics.IID)
            SpatialGraphInteropPreview.__ISpatialGraphInteropPreviewStatics := ISpatialGraphInteropPreviewStatics(factoryPtr)
        }

        return SpatialGraphInteropPreview.__ISpatialGraphInteropPreviewStatics.CreateLocatorForNode(nodeId)
    }

    /**
     * Creates an interop frame of reference based on a given spatial coordinate system with its origin offset by the specified relative position.
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system.
     * @returns {SpatialGraphInteropFrameOfReferencePreview} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.preview.spatialgraphinteroppreview.trycreateframeofreference
     */
    static TryCreateFrameOfReference(coordinateSystem) {
        if (!SpatialGraphInteropPreview.HasProp("__ISpatialGraphInteropPreviewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.Preview.SpatialGraphInteropPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialGraphInteropPreviewStatics2.IID)
            SpatialGraphInteropPreview.__ISpatialGraphInteropPreviewStatics2 := ISpatialGraphInteropPreviewStatics2(factoryPtr)
        }

        return SpatialGraphInteropPreview.__ISpatialGraphInteropPreviewStatics2.TryCreateFrameOfReference(coordinateSystem)
    }

    /**
     * Creates an interop frame of reference based on a given spatial coordinate system with its origin offset and rotated by the specified relative position and orientation.
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system.
     * @param {Vector3} relativePosition The rigid positional offset from the coordinate system's origin to the interop frame of reference's origin, expressed within the coordinate system.
     * @returns {SpatialGraphInteropFrameOfReferencePreview} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.preview.spatialgraphinteroppreview.trycreateframeofreference
     */
    static TryCreateFrameOfReferenceWithPosition(coordinateSystem, relativePosition) {
        if (!SpatialGraphInteropPreview.HasProp("__ISpatialGraphInteropPreviewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.Preview.SpatialGraphInteropPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialGraphInteropPreviewStatics2.IID)
            SpatialGraphInteropPreview.__ISpatialGraphInteropPreviewStatics2 := ISpatialGraphInteropPreviewStatics2(factoryPtr)
        }

        return SpatialGraphInteropPreview.__ISpatialGraphInteropPreviewStatics2.TryCreateFrameOfReferenceWithPosition(coordinateSystem, relativePosition)
    }

    /**
     * Creates an interop frame of reference based on a given spatial coordinate system.
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system.
     * @param {Vector3} relativePosition 
     * @param {Quaternion} relativeOrientation 
     * @returns {SpatialGraphInteropFrameOfReferencePreview} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.preview.spatialgraphinteroppreview.trycreateframeofreference
     */
    static TryCreateFrameOfReferenceWithPositionAndOrientation(coordinateSystem, relativePosition, relativeOrientation) {
        if (!SpatialGraphInteropPreview.HasProp("__ISpatialGraphInteropPreviewStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.Preview.SpatialGraphInteropPreview")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialGraphInteropPreviewStatics2.IID)
            SpatialGraphInteropPreview.__ISpatialGraphInteropPreviewStatics2 := ISpatialGraphInteropPreviewStatics2(factoryPtr)
        }

        return SpatialGraphInteropPreview.__ISpatialGraphInteropPreviewStatics2.TryCreateFrameOfReferenceWithPositionAndOrientation(coordinateSystem, relativePosition, relativeOrientation)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
