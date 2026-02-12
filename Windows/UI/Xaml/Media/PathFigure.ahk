#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IPathFigure.ahk
#Include .\IPathFigureStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a subsection of a geometry, a single connected series of two-dimensional geometric segments.
 * @remarks
 * [PathFigureCollection](pathfigurecollection.md) is a strongly typed collection for PathFigure items. [PathFigureCollection](pathfigurecollection.md) is the type used by the [PathGeometry.Figures](pathgeometry_figures.md) property. In XAML, specify one or more PathFigure elements for this property.
 * 
 * This class is relevant for setting the vector data for either a [Path](../windows.ui.xaml.shapes/path.md) or a [PathIcon](../windows.ui.xaml.controls/pathicon.md).
 * 
 * Rather than creating an instance or an object element, you can also define segments and a single PathFigure as part of a vector within the string for a [Move and draw commands syntax](/windows/uwp/xaml-platform/move-draw-commands-syntax).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.pathfigure
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class PathFigure extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPathFigure

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPathFigure.IID

    /**
     * Identifies the [Segments](pathfigure_segments.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.pathfigure.segmentsproperty
     * @type {DependencyProperty} 
     */
    static SegmentsProperty {
        get => PathFigure.get_SegmentsProperty()
    }

    /**
     * Identifies the [StartPoint](pathfigure_startpoint.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.pathfigure.startpointproperty
     * @type {DependencyProperty} 
     */
    static StartPointProperty {
        get => PathFigure.get_StartPointProperty()
    }

    /**
     * Identifies the [IsClosed](pathfigure_isclosed.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.pathfigure.isclosedproperty
     * @type {DependencyProperty} 
     */
    static IsClosedProperty {
        get => PathFigure.get_IsClosedProperty()
    }

    /**
     * Identifies the [IsFilled](pathfigure_isfilled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.pathfigure.isfilledproperty
     * @type {DependencyProperty} 
     */
    static IsFilledProperty {
        get => PathFigure.get_IsFilledProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SegmentsProperty() {
        if (!PathFigure.HasProp("__IPathFigureStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PathFigure")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPathFigureStatics.IID)
            PathFigure.__IPathFigureStatics := IPathFigureStatics(factoryPtr)
        }

        return PathFigure.__IPathFigureStatics.get_SegmentsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StartPointProperty() {
        if (!PathFigure.HasProp("__IPathFigureStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PathFigure")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPathFigureStatics.IID)
            PathFigure.__IPathFigureStatics := IPathFigureStatics(factoryPtr)
        }

        return PathFigure.__IPathFigureStatics.get_StartPointProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsClosedProperty() {
        if (!PathFigure.HasProp("__IPathFigureStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PathFigure")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPathFigureStatics.IID)
            PathFigure.__IPathFigureStatics := IPathFigureStatics(factoryPtr)
        }

        return PathFigure.__IPathFigureStatics.get_IsClosedProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsFilledProperty() {
        if (!PathFigure.HasProp("__IPathFigureStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PathFigure")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPathFigureStatics.IID)
            PathFigure.__IPathFigureStatics := IPathFigureStatics(factoryPtr)
        }

        return PathFigure.__IPathFigureStatics.get_IsFilledProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the collection of segments that define the shape of this [PathFigure](pathfigure.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.pathfigure.segments
     * @type {PathSegmentCollection} 
     */
    Segments {
        get => this.get_Segments()
        set => this.put_Segments(value)
    }

    /**
     * Gets or sets the [Point](../windows.foundation/point.md) where the [PathFigure](pathfigure.md) begins.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.pathfigure.startpoint
     * @type {POINT} 
     */
    StartPoint {
        get => this.get_StartPoint()
        set => this.put_StartPoint(value)
    }

    /**
     * Gets or sets a value that indicates whether this figure's first and last segments are connected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.pathfigure.isclosed
     * @type {Boolean} 
     */
    IsClosed {
        get => this.get_IsClosed()
        set => this.put_IsClosed(value)
    }

    /**
     * Gets or sets a value that indicates whether the contained area of this [PathFigure](pathfigure.md) is to be used for hit-testing, rendering, and clipping.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.pathfigure.isfilled
     * @type {Boolean} 
     */
    IsFilled {
        get => this.get_IsFilled()
        set => this.put_IsFilled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [PathFigure](pathfigure.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PathFigure")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {PathSegmentCollection} 
     */
    get_Segments() {
        if (!this.HasProp("__IPathFigure")) {
            if ((queryResult := this.QueryInterface(IPathFigure.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPathFigure := IPathFigure(outPtr)
        }

        return this.__IPathFigure.get_Segments()
    }

    /**
     * 
     * @param {PathSegmentCollection} value 
     * @returns {HRESULT} 
     */
    put_Segments(value) {
        if (!this.HasProp("__IPathFigure")) {
            if ((queryResult := this.QueryInterface(IPathFigure.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPathFigure := IPathFigure(outPtr)
        }

        return this.__IPathFigure.put_Segments(value)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_StartPoint() {
        if (!this.HasProp("__IPathFigure")) {
            if ((queryResult := this.QueryInterface(IPathFigure.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPathFigure := IPathFigure(outPtr)
        }

        return this.__IPathFigure.get_StartPoint()
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_StartPoint(value) {
        if (!this.HasProp("__IPathFigure")) {
            if ((queryResult := this.QueryInterface(IPathFigure.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPathFigure := IPathFigure(outPtr)
        }

        return this.__IPathFigure.put_StartPoint(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsClosed() {
        if (!this.HasProp("__IPathFigure")) {
            if ((queryResult := this.QueryInterface(IPathFigure.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPathFigure := IPathFigure(outPtr)
        }

        return this.__IPathFigure.get_IsClosed()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsClosed(value) {
        if (!this.HasProp("__IPathFigure")) {
            if ((queryResult := this.QueryInterface(IPathFigure.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPathFigure := IPathFigure(outPtr)
        }

        return this.__IPathFigure.put_IsClosed(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFilled() {
        if (!this.HasProp("__IPathFigure")) {
            if ((queryResult := this.QueryInterface(IPathFigure.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPathFigure := IPathFigure(outPtr)
        }

        return this.__IPathFigure.get_IsFilled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsFilled(value) {
        if (!this.HasProp("__IPathFigure")) {
            if ((queryResult := this.QueryInterface(IPathFigure.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPathFigure := IPathFigure(outPtr)
        }

        return this.__IPathFigure.put_IsFilled(value)
    }

;@endregion Instance Methods
}
