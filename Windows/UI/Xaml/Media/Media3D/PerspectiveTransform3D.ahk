#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Transform3D.ahk
#Include .\IPerspectiveTransform3D.ahk
#Include .\IPerspectiveTransform3DStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a 3-D perspective effect.
 * @remarks
 * For more info about using PerspectiveTransform3D, see the [UIElement.Transform3D](../windows.ui.xaml/uielement_transform3d.md) property.
 * 
 * Adding a PerspectiveTransform3D element to a scene with no other 3-D transforms will not change the appearance of any 2-D elements. It will preserve the X and Y coordinates in the plane of Z=0. To take advantage of the perspective effect, you need to use [CompositeTransform3D](compositetransform3d.md) in conjunction with PerspectiveTransform3D.
 * 
 * Following the guidelines of the [The Direct3D Transformation Pipeline](XREF:TODO:dxtecharts.the_direct3d_transformation_pipeline), PerspectiveTransform3D represents a projection transform. In comparison, [CompositeTransform3D](compositetransform3d.md) represents a world or view transform. Because of this, PerspectiveTransform3D should usually be applied at the root of the XAML scene. In most cases, this would be the [Page](../windows.ui.xaml.controls/page.md) element.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.perspectivetransform3d
 * @namespace Windows.UI.Xaml.Media.Media3D
 * @version WindowsRuntime 1.4
 */
class PerspectiveTransform3D extends Transform3D {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerspectiveTransform3D

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerspectiveTransform3D.IID

    /**
     * Identifies the [Depth](perspectivetransform3d_depth.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.perspectivetransform3d.depthproperty
     * @type {DependencyProperty} 
     */
    static DepthProperty {
        get => PerspectiveTransform3D.get_DepthProperty()
    }

    /**
     * Identifies the [OffsetX](perspectivetransform3d_offsetx.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.perspectivetransform3d.offsetxproperty
     * @type {DependencyProperty} 
     */
    static OffsetXProperty {
        get => PerspectiveTransform3D.get_OffsetXProperty()
    }

    /**
     * Identifies the [OffsetY](perspectivetransform3d_offsety.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.perspectivetransform3d.offsetyproperty
     * @type {DependencyProperty} 
     */
    static OffsetYProperty {
        get => PerspectiveTransform3D.get_OffsetYProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DepthProperty() {
        if (!PerspectiveTransform3D.HasProp("__IPerspectiveTransform3DStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Media3D.PerspectiveTransform3D")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerspectiveTransform3DStatics.IID)
            PerspectiveTransform3D.__IPerspectiveTransform3DStatics := IPerspectiveTransform3DStatics(factoryPtr)
        }

        return PerspectiveTransform3D.__IPerspectiveTransform3DStatics.get_DepthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OffsetXProperty() {
        if (!PerspectiveTransform3D.HasProp("__IPerspectiveTransform3DStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Media3D.PerspectiveTransform3D")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerspectiveTransform3DStatics.IID)
            PerspectiveTransform3D.__IPerspectiveTransform3DStatics := IPerspectiveTransform3DStatics(factoryPtr)
        }

        return PerspectiveTransform3D.__IPerspectiveTransform3DStatics.get_OffsetXProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OffsetYProperty() {
        if (!PerspectiveTransform3D.HasProp("__IPerspectiveTransform3DStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Media3D.PerspectiveTransform3D")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerspectiveTransform3DStatics.IID)
            PerspectiveTransform3D.__IPerspectiveTransform3DStatics := IPerspectiveTransform3DStatics(factoryPtr)
        }

        return PerspectiveTransform3D.__IPerspectiveTransform3DStatics.get_OffsetYProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the distance in pixels to the plane where z=0.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.perspectivetransform3d.depth
     * @type {Float} 
     */
    Depth {
        get => this.get_Depth()
        set => this.put_Depth(value)
    }

    /**
     * Gets or sets the x-offset in pixels for the perspective's origin from the center of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.perspectivetransform3d.offsetx
     * @type {Float} 
     */
    OffsetX {
        get => this.get_OffsetX()
        set => this.put_OffsetX(value)
    }

    /**
     * Gets or sets the y-offset in pixels for the perspective's origin from the center of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.perspectivetransform3d.offsety
     * @type {Float} 
     */
    OffsetY {
        get => this.get_OffsetY()
        set => this.put_OffsetY(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [PerspectiveTransform3D](perspectivetransform3d.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Media3D.PerspectiveTransform3D")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Depth() {
        if (!this.HasProp("__IPerspectiveTransform3D")) {
            if ((queryResult := this.QueryInterface(IPerspectiveTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerspectiveTransform3D := IPerspectiveTransform3D(outPtr)
        }

        return this.__IPerspectiveTransform3D.get_Depth()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Depth(value) {
        if (!this.HasProp("__IPerspectiveTransform3D")) {
            if ((queryResult := this.QueryInterface(IPerspectiveTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerspectiveTransform3D := IPerspectiveTransform3D(outPtr)
        }

        return this.__IPerspectiveTransform3D.put_Depth(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OffsetX() {
        if (!this.HasProp("__IPerspectiveTransform3D")) {
            if ((queryResult := this.QueryInterface(IPerspectiveTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerspectiveTransform3D := IPerspectiveTransform3D(outPtr)
        }

        return this.__IPerspectiveTransform3D.get_OffsetX()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_OffsetX(value) {
        if (!this.HasProp("__IPerspectiveTransform3D")) {
            if ((queryResult := this.QueryInterface(IPerspectiveTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerspectiveTransform3D := IPerspectiveTransform3D(outPtr)
        }

        return this.__IPerspectiveTransform3D.put_OffsetX(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OffsetY() {
        if (!this.HasProp("__IPerspectiveTransform3D")) {
            if ((queryResult := this.QueryInterface(IPerspectiveTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerspectiveTransform3D := IPerspectiveTransform3D(outPtr)
        }

        return this.__IPerspectiveTransform3D.get_OffsetY()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_OffsetY(value) {
        if (!this.HasProp("__IPerspectiveTransform3D")) {
            if ((queryResult := this.QueryInterface(IPerspectiveTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerspectiveTransform3D := IPerspectiveTransform3D(outPtr)
        }

        return this.__IPerspectiveTransform3D.put_OffsetY(value)
    }

;@endregion Instance Methods
}
