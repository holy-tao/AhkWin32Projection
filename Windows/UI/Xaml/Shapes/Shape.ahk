#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\FrameworkElement.ahk
#Include .\IShape.ahk
#Include .\IShape2.ahk
#Include .\IShapeStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a base class for shape elements, such as [Ellipse](ellipse.md), [Polygon](polygon.md), and [Rectangle](rectangle.md).
 * @remarks
 * Shape defines several properties that are shared by all the Shape derived classes. The most commonly used properties are [Fill](shape_fill.md), [Stroke](shape_stroke.md), and [StrokeThickness](shape_strokethickness.md). [Stroke](shape_stroke.md) uses a [Brush](../windows.ui.xaml.media/brush.md) to draw the outline of the shape, and [Fill](shape_fill.md) uses a [Brush](../windows.ui.xaml.media/brush.md) to draw the interior. For more info on how to use the Shape derived classes in XAML UI, see [Draw shapes](/windows/uwp/graphics/drawing-shapes).
 * 
 * Shape also derives from [FrameworkElement](../windows.ui.xaml/frameworkelement.md) and inherits various properties from that class. Those properties include [Height](../windows.ui.xaml/frameworkelement_height.md) and [Width](../windows.ui.xaml/frameworkelement_width.md). For most other [FrameworkElement](../windows.ui.xaml/frameworkelement.md) derived types, setting [Height](../windows.ui.xaml/frameworkelement_height.md) and [Width](../windows.ui.xaml/frameworkelement_width.md) is the primary way to specify that element's dimensions in UI (although you often would leave them as "Auto" to take advantage of adaptive layout). But not all of the Shape classes use [Height](../windows.ui.xaml/frameworkelement_height.md) or [Width](../windows.ui.xaml/frameworkelement_width.md) to specify their dimensions, and instead use specific properties that might define a set of points. In this case a [Height](../windows.ui.xaml/frameworkelement_height.md) or [Width](../windows.ui.xaml/frameworkelement_width.md) is calculated for layout, but you shouldn't attempt to set the [Height](../windows.ui.xaml/frameworkelement_height.md) or [Width](../windows.ui.xaml/frameworkelement_width.md). See the remarks or descriptions in specific Shape derived classes for more info.
 * 
 * Because the Shape derived classes are UI elements they can be used as content for containers such as controls and panels. They have practical presence in the UI; for example they are hit-testable with input events, they report desired size for layout, and so on. There are other graphics definition classes for XAML that aren't UI elements. These mostly exist in the [Windows.UI.Xaml.Media](../windows.ui.xaml.media/windows_ui_xaml_media.md) namespace. Examples of such graphics classes are the [Geometry](../windows.ui.xaml.media/geometry.md) types, [PathFigure](../windows.ui.xaml.media/pathfigure.md) types and [PathSegment](../windows.ui.xaml.media/pathsegment.md) types.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.shape
 * @namespace Windows.UI.Xaml.Shapes
 * @version WindowsRuntime 1.4
 */
class Shape extends FrameworkElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IShape

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IShape.IID

    /**
     * Identifies the [Fill](shape_fill.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.shape.fillproperty
     * @type {DependencyProperty} 
     */
    static FillProperty {
        get => Shape.get_FillProperty()
    }

    /**
     * Identifies the [Stroke](shape_stroke.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.shape.strokeproperty
     * @type {DependencyProperty} 
     */
    static StrokeProperty {
        get => Shape.get_StrokeProperty()
    }

    /**
     * Identifies the [StrokeMiterLimit](shape_strokemiterlimit.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.shape.strokemiterlimitproperty
     * @type {DependencyProperty} 
     */
    static StrokeMiterLimitProperty {
        get => Shape.get_StrokeMiterLimitProperty()
    }

    /**
     * Identifies the [StrokeThickness](shape_strokethickness.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.shape.strokethicknessproperty
     * @type {DependencyProperty} 
     */
    static StrokeThicknessProperty {
        get => Shape.get_StrokeThicknessProperty()
    }

    /**
     * Identifies the [StrokeStartLineCap](shape_strokestartlinecap.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.shape.strokestartlinecapproperty
     * @type {DependencyProperty} 
     */
    static StrokeStartLineCapProperty {
        get => Shape.get_StrokeStartLineCapProperty()
    }

    /**
     * Identifies the [StrokeEndLineCap](shape_strokeendlinecap.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.shape.strokeendlinecapproperty
     * @type {DependencyProperty} 
     */
    static StrokeEndLineCapProperty {
        get => Shape.get_StrokeEndLineCapProperty()
    }

    /**
     * Identifies the [StrokeLineJoin](shape_strokelinejoin.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.shape.strokelinejoinproperty
     * @type {DependencyProperty} 
     */
    static StrokeLineJoinProperty {
        get => Shape.get_StrokeLineJoinProperty()
    }

    /**
     * Identifies the [StrokeDashOffset](shape_strokedashoffset.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.shape.strokedashoffsetproperty
     * @type {DependencyProperty} 
     */
    static StrokeDashOffsetProperty {
        get => Shape.get_StrokeDashOffsetProperty()
    }

    /**
     * Identifies the [StrokeDashCap](shape_strokedashcap.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.shape.strokedashcapproperty
     * @type {DependencyProperty} 
     */
    static StrokeDashCapProperty {
        get => Shape.get_StrokeDashCapProperty()
    }

    /**
     * Identifies the [StrokeDashArray](shape_strokedasharray.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.shape.strokedasharrayproperty
     * @type {DependencyProperty} 
     */
    static StrokeDashArrayProperty {
        get => Shape.get_StrokeDashArrayProperty()
    }

    /**
     * Identifies the [Stretch](shape_stretch.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.shape.stretchproperty
     * @type {DependencyProperty} 
     */
    static StretchProperty {
        get => Shape.get_StretchProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FillProperty() {
        if (!Shape.HasProp("__IShapeStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Shape")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IShapeStatics.IID)
            Shape.__IShapeStatics := IShapeStatics(factoryPtr)
        }

        return Shape.__IShapeStatics.get_FillProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StrokeProperty() {
        if (!Shape.HasProp("__IShapeStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Shape")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IShapeStatics.IID)
            Shape.__IShapeStatics := IShapeStatics(factoryPtr)
        }

        return Shape.__IShapeStatics.get_StrokeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StrokeMiterLimitProperty() {
        if (!Shape.HasProp("__IShapeStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Shape")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IShapeStatics.IID)
            Shape.__IShapeStatics := IShapeStatics(factoryPtr)
        }

        return Shape.__IShapeStatics.get_StrokeMiterLimitProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StrokeThicknessProperty() {
        if (!Shape.HasProp("__IShapeStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Shape")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IShapeStatics.IID)
            Shape.__IShapeStatics := IShapeStatics(factoryPtr)
        }

        return Shape.__IShapeStatics.get_StrokeThicknessProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StrokeStartLineCapProperty() {
        if (!Shape.HasProp("__IShapeStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Shape")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IShapeStatics.IID)
            Shape.__IShapeStatics := IShapeStatics(factoryPtr)
        }

        return Shape.__IShapeStatics.get_StrokeStartLineCapProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StrokeEndLineCapProperty() {
        if (!Shape.HasProp("__IShapeStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Shape")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IShapeStatics.IID)
            Shape.__IShapeStatics := IShapeStatics(factoryPtr)
        }

        return Shape.__IShapeStatics.get_StrokeEndLineCapProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StrokeLineJoinProperty() {
        if (!Shape.HasProp("__IShapeStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Shape")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IShapeStatics.IID)
            Shape.__IShapeStatics := IShapeStatics(factoryPtr)
        }

        return Shape.__IShapeStatics.get_StrokeLineJoinProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StrokeDashOffsetProperty() {
        if (!Shape.HasProp("__IShapeStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Shape")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IShapeStatics.IID)
            Shape.__IShapeStatics := IShapeStatics(factoryPtr)
        }

        return Shape.__IShapeStatics.get_StrokeDashOffsetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StrokeDashCapProperty() {
        if (!Shape.HasProp("__IShapeStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Shape")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IShapeStatics.IID)
            Shape.__IShapeStatics := IShapeStatics(factoryPtr)
        }

        return Shape.__IShapeStatics.get_StrokeDashCapProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StrokeDashArrayProperty() {
        if (!Shape.HasProp("__IShapeStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Shape")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IShapeStatics.IID)
            Shape.__IShapeStatics := IShapeStatics(factoryPtr)
        }

        return Shape.__IShapeStatics.get_StrokeDashArrayProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StretchProperty() {
        if (!Shape.HasProp("__IShapeStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Shape")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IShapeStatics.IID)
            Shape.__IShapeStatics := IShapeStatics(factoryPtr)
        }

        return Shape.__IShapeStatics.get_StretchProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the [Brush](../windows.ui.xaml.media/brush.md) that paints the interior area of the shape.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.shape.fill
     * @type {Brush} 
     */
    Fill {
        get => this.get_Fill()
        set => this.put_Fill(value)
    }

    /**
     * Gets or sets the [Brush](../windows.ui.xaml.media/brush.md) that specifies how the [Shape](shape.md) outline is painted.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.shape.stroke
     * @type {Brush} 
     */
    Stroke {
        get => this.get_Stroke()
        set => this.put_Stroke(value)
    }

    /**
     * Gets or sets a limit on the ratio of the miter length to half the [StrokeThickness](shape_strokethickness.md) of a [Shape](shape.md) element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.shape.strokemiterlimit
     * @type {Float} 
     */
    StrokeMiterLimit {
        get => this.get_StrokeMiterLimit()
        set => this.put_StrokeMiterLimit(value)
    }

    /**
     * Gets or sets the width of the [Shape](shape.md) stroke outline.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.shape.strokethickness
     * @type {Float} 
     */
    StrokeThickness {
        get => this.get_StrokeThickness()
        set => this.put_StrokeThickness(value)
    }

    /**
     * Gets or sets a [PenLineCap](../windows.ui.xaml.media/penlinecap.md) enumeration value that describes the [Shape](shape.md) at the start of a [Stroke](shape_stroke.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.shape.strokestartlinecap
     * @type {Integer} 
     */
    StrokeStartLineCap {
        get => this.get_StrokeStartLineCap()
        set => this.put_StrokeStartLineCap(value)
    }

    /**
     * Gets or sets a [PenLineCap](../windows.ui.xaml.media/penlinecap.md) enumeration value that describes the [Shape](shape.md) at the end of a line.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.shape.strokeendlinecap
     * @type {Integer} 
     */
    StrokeEndLineCap {
        get => this.get_StrokeEndLineCap()
        set => this.put_StrokeEndLineCap(value)
    }

    /**
     * Gets or sets a [PenLineJoin](../windows.ui.xaml.media/penlinejoin.md) enumeration value that specifies the type of join that is used at the vertices of a [Shape](shape.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.shape.strokelinejoin
     * @type {Integer} 
     */
    StrokeLineJoin {
        get => this.get_StrokeLineJoin()
        set => this.put_StrokeLineJoin(value)
    }

    /**
     * Gets or sets a value that specifies the distance within the dash pattern where a dash begins.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.shape.strokedashoffset
     * @type {Float} 
     */
    StrokeDashOffset {
        get => this.get_StrokeDashOffset()
        set => this.put_StrokeDashOffset(value)
    }

    /**
     * Gets or sets a [PenLineCap](../windows.ui.xaml.media/penlinecap.md) enumeration value that specifies how the ends of a dash are drawn.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.shape.strokedashcap
     * @type {Integer} 
     */
    StrokeDashCap {
        get => this.get_StrokeDashCap()
        set => this.put_StrokeDashCap(value)
    }

    /**
     * Gets or sets a collection of [Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true) values that indicates the pattern of dashes and gaps that is used to outline shapes.
     * @remarks
     * A valid _strokeDashString_ for the StrokeDashArray property describes a repeating pattern of strokes and gaps. Each Double in the collection specifies the length of a dash or gap relative to the Thickness of the pen. For example, a value of 1 creates a dash or gap that has the same length as the thickness of the pen (a square). You can use a space, a comma, or a mixture of both as the separator.
     * 
     * Because the pattern repeats, `StrokeDashArray="1"` has the same result as `StrokeDashArray="1 1"`. If the collection has an odd number of values, the pattern alternates between starting with a stroke and starting with a gap, as shown in the examples.
     * 
     * You should typically use integral numeric values. Non-integral values can cause subpixel rendering and may alter the apparent color of the stroke.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.shape.strokedasharray
     * @type {DoubleCollection} 
     */
    StrokeDashArray {
        get => this.get_StrokeDashArray()
        set => this.put_StrokeDashArray(value)
    }

    /**
     * Gets or sets a [Stretch](../windows.ui.xaml.media/stretch.md) enumeration value that describes how the shape fills its allocated space.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.shape.stretch
     * @type {Integer} 
     */
    Stretch {
        get => this.get_Stretch()
        set => this.put_Stretch(value)
    }

    /**
     * Gets a value that represents a [Transform](../windows.ui.xaml.media/transform.md) that is applied to the geometry of a [Shape](shape.md) before it is drawn.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.shape.geometrytransform
     * @type {Transform} 
     */
    GeometryTransform {
        get => this.get_GeometryTransform()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Fill() {
        if (!this.HasProp("__IShape")) {
            if ((queryResult := this.QueryInterface(IShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShape := IShape(outPtr)
        }

        return this.__IShape.get_Fill()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Fill(value) {
        if (!this.HasProp("__IShape")) {
            if ((queryResult := this.QueryInterface(IShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShape := IShape(outPtr)
        }

        return this.__IShape.put_Fill(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Stroke() {
        if (!this.HasProp("__IShape")) {
            if ((queryResult := this.QueryInterface(IShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShape := IShape(outPtr)
        }

        return this.__IShape.get_Stroke()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Stroke(value) {
        if (!this.HasProp("__IShape")) {
            if ((queryResult := this.QueryInterface(IShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShape := IShape(outPtr)
        }

        return this.__IShape.put_Stroke(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_StrokeMiterLimit() {
        if (!this.HasProp("__IShape")) {
            if ((queryResult := this.QueryInterface(IShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShape := IShape(outPtr)
        }

        return this.__IShape.get_StrokeMiterLimit()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_StrokeMiterLimit(value) {
        if (!this.HasProp("__IShape")) {
            if ((queryResult := this.QueryInterface(IShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShape := IShape(outPtr)
        }

        return this.__IShape.put_StrokeMiterLimit(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_StrokeThickness() {
        if (!this.HasProp("__IShape")) {
            if ((queryResult := this.QueryInterface(IShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShape := IShape(outPtr)
        }

        return this.__IShape.get_StrokeThickness()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_StrokeThickness(value) {
        if (!this.HasProp("__IShape")) {
            if ((queryResult := this.QueryInterface(IShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShape := IShape(outPtr)
        }

        return this.__IShape.put_StrokeThickness(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StrokeStartLineCap() {
        if (!this.HasProp("__IShape")) {
            if ((queryResult := this.QueryInterface(IShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShape := IShape(outPtr)
        }

        return this.__IShape.get_StrokeStartLineCap()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StrokeStartLineCap(value) {
        if (!this.HasProp("__IShape")) {
            if ((queryResult := this.QueryInterface(IShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShape := IShape(outPtr)
        }

        return this.__IShape.put_StrokeStartLineCap(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StrokeEndLineCap() {
        if (!this.HasProp("__IShape")) {
            if ((queryResult := this.QueryInterface(IShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShape := IShape(outPtr)
        }

        return this.__IShape.get_StrokeEndLineCap()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StrokeEndLineCap(value) {
        if (!this.HasProp("__IShape")) {
            if ((queryResult := this.QueryInterface(IShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShape := IShape(outPtr)
        }

        return this.__IShape.put_StrokeEndLineCap(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StrokeLineJoin() {
        if (!this.HasProp("__IShape")) {
            if ((queryResult := this.QueryInterface(IShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShape := IShape(outPtr)
        }

        return this.__IShape.get_StrokeLineJoin()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StrokeLineJoin(value) {
        if (!this.HasProp("__IShape")) {
            if ((queryResult := this.QueryInterface(IShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShape := IShape(outPtr)
        }

        return this.__IShape.put_StrokeLineJoin(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_StrokeDashOffset() {
        if (!this.HasProp("__IShape")) {
            if ((queryResult := this.QueryInterface(IShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShape := IShape(outPtr)
        }

        return this.__IShape.get_StrokeDashOffset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_StrokeDashOffset(value) {
        if (!this.HasProp("__IShape")) {
            if ((queryResult := this.QueryInterface(IShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShape := IShape(outPtr)
        }

        return this.__IShape.put_StrokeDashOffset(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StrokeDashCap() {
        if (!this.HasProp("__IShape")) {
            if ((queryResult := this.QueryInterface(IShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShape := IShape(outPtr)
        }

        return this.__IShape.get_StrokeDashCap()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StrokeDashCap(value) {
        if (!this.HasProp("__IShape")) {
            if ((queryResult := this.QueryInterface(IShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShape := IShape(outPtr)
        }

        return this.__IShape.put_StrokeDashCap(value)
    }

    /**
     * 
     * @returns {DoubleCollection} 
     */
    get_StrokeDashArray() {
        if (!this.HasProp("__IShape")) {
            if ((queryResult := this.QueryInterface(IShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShape := IShape(outPtr)
        }

        return this.__IShape.get_StrokeDashArray()
    }

    /**
     * 
     * @param {DoubleCollection} value 
     * @returns {HRESULT} 
     */
    put_StrokeDashArray(value) {
        if (!this.HasProp("__IShape")) {
            if ((queryResult := this.QueryInterface(IShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShape := IShape(outPtr)
        }

        return this.__IShape.put_StrokeDashArray(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Stretch() {
        if (!this.HasProp("__IShape")) {
            if ((queryResult := this.QueryInterface(IShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShape := IShape(outPtr)
        }

        return this.__IShape.get_Stretch()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Stretch(value) {
        if (!this.HasProp("__IShape")) {
            if ((queryResult := this.QueryInterface(IShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShape := IShape(outPtr)
        }

        return this.__IShape.put_Stretch(value)
    }

    /**
     * 
     * @returns {Transform} 
     */
    get_GeometryTransform() {
        if (!this.HasProp("__IShape")) {
            if ((queryResult := this.QueryInterface(IShape.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShape := IShape(outPtr)
        }

        return this.__IShape.get_GeometryTransform()
    }

    /**
     * Returns a mask that represents the alpha channel of a XAML shape as a [CompositionBrush](../windows.ui.composition/compositionbrush.md).
     * @remarks
     * This method gets an alpha mask from a XAML shape as a [CompositionBrush](../windows.ui.composition/compositionbrush.md) that you can use as an input to composition shadows and effects. The alpha mask [CompositionBrush](../windows.ui.composition/compositionbrush.md) has the same alignment and stretch property values that the source XAML shape applies to its rendered content so that you can use those values to correctly position shadows or effects relative to the XAML element.
     * @returns {CompositionBrush} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.shape.getalphamask
     */
    GetAlphaMask() {
        if (!this.HasProp("__IShape2")) {
            if ((queryResult := this.QueryInterface(IShape2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShape2 := IShape2(outPtr)
        }

        return this.__IShape2.GetAlphaMask()
    }

;@endregion Instance Methods
}
