#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IGeometry.ahk
#Include .\IGeometryStatics.ahk
#Include .\IGeometryFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a base class for objects that define geometric shapes. Geometry objects can be used for clipping regions and as geometry definitions for rendering two-dimensional graphical data as a [Path](../windows.ui.xaml.shapes/path.md).
 * @remarks
 * For properties that take a Geometry, you need to specify a nonabstract derived type of Geometry, as an object element for XAML, or as a defined instance for code. For details, see reference pages for [EllipseGeometry](ellipsegeometry.md), [GeometryGroup](geometrygroup.md), [LineGeometry](linegeometry.md), [PathGeometry](pathgeometry.md), or [RectangleGeometry](rectanglegeometry.md).
 * 
 * Geometries can be conceptualized as being "simple" or "complex". [EllipseGeometry](ellipsegeometry.md), [LineGeometry](linegeometry.md), and [RectangleGeometry](rectanglegeometry.md) are the simple geometries, which specify the geometrical shape as one element with basic coordinate or dimension properties. [GeometryGroup](geometrygroup.md) and [PathGeometry](pathgeometry.md) are the complex geometries. [GeometryGroup](geometrygroup.md) combines other geometries that it holds as child objects. [PathGeometry](pathgeometry.md) uses either a set of nested figure/segment path definition elements, or a compact string syntax that's usually output by designers, to describe a complex path for the geometry.
 * 
 * 
 * <!--Port the Path Syntax-->
 * A Geometry does not entirely define its own rendering, in that it's not a [UIElement](../windows.ui.xaml/uielement.md) itself and needs to be provided as some property value for a [UIElement](../windows.ui.xaml/uielement.md) in order to cause a rendering effect. Typically, a Geometry is provided as data for a [Path](../windows.ui.xaml.shapes/path.md) (which is a kind of [Shape](../windows.ui.xaml.shapes/shape.md)).
 * 
 * The [PathIcon.Data](../windows.ui.xaml.controls/pathicon_data.md) property takes a Geometry. In practice, you'd typically specify a [PathGeometry](pathgeometry.md) for this, with its [Figures](pathgeometry_figures.md) property value expressed in the compact string syntax for a path.
 * 
 * [GeometryCollection](geometrycollection.md) is a strongly typed collection for Geometry items. The [GeometryGroup.Children](geometrygroup_children.md) property uses a [GeometryCollection](geometrycollection.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.geometry
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class Geometry extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGeometry

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGeometry.IID

    /**
     * Gets an empty geometry object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.geometry.empty
     * @type {Geometry} 
     */
    static Empty {
        get => Geometry.get_Empty()
    }

    /**
     * Gets the standard tolerance used for polygonal approximation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.geometry.standardflatteningtolerance
     * @type {Float} 
     */
    static StandardFlatteningTolerance {
        get => Geometry.get_StandardFlatteningTolerance()
    }

    /**
     * Identifies the [Transform](geometry_transform.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.geometry.transformproperty
     * @type {DependencyProperty} 
     */
    static TransformProperty {
        get => Geometry.get_TransformProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Geometry} 
     */
    static get_Empty() {
        if (!Geometry.HasProp("__IGeometryStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Geometry")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeometryStatics.IID)
            Geometry.__IGeometryStatics := IGeometryStatics(factoryPtr)
        }

        return Geometry.__IGeometryStatics.get_Empty()
    }

    /**
     * 
     * @returns {Float} 
     */
    static get_StandardFlatteningTolerance() {
        if (!Geometry.HasProp("__IGeometryStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Geometry")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeometryStatics.IID)
            Geometry.__IGeometryStatics := IGeometryStatics(factoryPtr)
        }

        return Geometry.__IGeometryStatics.get_StandardFlatteningTolerance()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TransformProperty() {
        if (!Geometry.HasProp("__IGeometryStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Geometry")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGeometryStatics.IID)
            Geometry.__IGeometryStatics := IGeometryStatics(factoryPtr)
        }

        return Geometry.__IGeometryStatics.get_TransformProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the [Transform](transform.md) object applied to a [Geometry](geometry.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.geometry.transform
     * @type {Transform} 
     */
    Transform {
        get => this.get_Transform()
        set => this.put_Transform(value)
    }

    /**
     * Gets a [Rect](../windows.foundation/rect.md) that specifies the axis-aligned bounding box of the [Geometry](geometry.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.geometry.bounds
     * @type {RECT} 
     */
    Bounds {
        get => this.get_Bounds()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Transform} 
     */
    get_Transform() {
        if (!this.HasProp("__IGeometry")) {
            if ((queryResult := this.QueryInterface(IGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeometry := IGeometry(outPtr)
        }

        return this.__IGeometry.get_Transform()
    }

    /**
     * 
     * @param {Transform} value 
     * @returns {HRESULT} 
     */
    put_Transform(value) {
        if (!this.HasProp("__IGeometry")) {
            if ((queryResult := this.QueryInterface(IGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeometry := IGeometry(outPtr)
        }

        return this.__IGeometry.put_Transform(value)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_Bounds() {
        if (!this.HasProp("__IGeometry")) {
            if ((queryResult := this.QueryInterface(IGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeometry := IGeometry(outPtr)
        }

        return this.__IGeometry.get_Bounds()
    }

;@endregion Instance Methods
}
