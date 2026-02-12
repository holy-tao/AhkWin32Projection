#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialGraphInteropFrameOfReferencePreview.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a spatial node created for interop based on a spatial coordinate system from the app.
 * @remarks
 * > [!NOTE]
 * > You generally won't write code against this type yourself.  Instead, you'll use a library designed for a given kind of spatial node, with that library calling into this type on your behalf.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.preview.spatialgraphinteropframeofreferencepreview
 * @namespace Windows.Perception.Spatial.Preview
 * @version WindowsRuntime 1.4
 */
class SpatialGraphInteropFrameOfReferencePreview extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialGraphInteropFrameOfReferencePreview

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialGraphInteropFrameOfReferencePreview.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the coordinate system on which this interop frame of reference is based.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.preview.spatialgraphinteropframeofreferencepreview.coordinatesystem
     * @type {SpatialCoordinateSystem} 
     */
    CoordinateSystem {
        get => this.get_CoordinateSystem()
    }

    /**
     * Gets the spatial node ID created for this interop frame of reference.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.preview.spatialgraphinteropframeofreferencepreview.nodeid
     * @type {Guid} 
     */
    NodeId {
        get => this.get_NodeId()
    }

    /**
     * Gets the transform from the basis coordinate system to the static node.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.preview.spatialgraphinteropframeofreferencepreview.coordinatesystemtonodetransform
     * @type {Matrix4x4} 
     */
    CoordinateSystemToNodeTransform {
        get => this.get_CoordinateSystemToNodeTransform()
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
        if (!this.HasProp("__ISpatialGraphInteropFrameOfReferencePreview")) {
            if ((queryResult := this.QueryInterface(ISpatialGraphInteropFrameOfReferencePreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGraphInteropFrameOfReferencePreview := ISpatialGraphInteropFrameOfReferencePreview(outPtr)
        }

        return this.__ISpatialGraphInteropFrameOfReferencePreview.get_CoordinateSystem()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_NodeId() {
        if (!this.HasProp("__ISpatialGraphInteropFrameOfReferencePreview")) {
            if ((queryResult := this.QueryInterface(ISpatialGraphInteropFrameOfReferencePreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGraphInteropFrameOfReferencePreview := ISpatialGraphInteropFrameOfReferencePreview(outPtr)
        }

        return this.__ISpatialGraphInteropFrameOfReferencePreview.get_NodeId()
    }

    /**
     * 
     * @returns {Matrix4x4} 
     */
    get_CoordinateSystemToNodeTransform() {
        if (!this.HasProp("__ISpatialGraphInteropFrameOfReferencePreview")) {
            if ((queryResult := this.QueryInterface(ISpatialGraphInteropFrameOfReferencePreview.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialGraphInteropFrameOfReferencePreview := ISpatialGraphInteropFrameOfReferencePreview(outPtr)
        }

        return this.__ISpatialGraphInteropFrameOfReferencePreview.get_CoordinateSystemToNodeTransform()
    }

;@endregion Instance Methods
}
