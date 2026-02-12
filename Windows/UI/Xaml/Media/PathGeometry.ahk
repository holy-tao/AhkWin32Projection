#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Geometry.ahk
#Include .\IPathGeometry.ahk
#Include .\IPathGeometryStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a complex vector-based shape that may be composed of arcs, curves, ellipses, lines, and rectangles.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.pathgeometry
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class PathGeometry extends Geometry {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPathGeometry

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPathGeometry.IID

    /**
     * Identifies the [FillRule](pathgeometry_fillrule.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.pathgeometry.fillruleproperty
     * @type {DependencyProperty} 
     */
    static FillRuleProperty {
        get => PathGeometry.get_FillRuleProperty()
    }

    /**
     * Identifies the [Figures](pathgeometry_figures.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.pathgeometry.figuresproperty
     * @type {DependencyProperty} 
     */
    static FiguresProperty {
        get => PathGeometry.get_FiguresProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FillRuleProperty() {
        if (!PathGeometry.HasProp("__IPathGeometryStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PathGeometry")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPathGeometryStatics.IID)
            PathGeometry.__IPathGeometryStatics := IPathGeometryStatics(factoryPtr)
        }

        return PathGeometry.__IPathGeometryStatics.get_FillRuleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FiguresProperty() {
        if (!PathGeometry.HasProp("__IPathGeometryStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PathGeometry")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPathGeometryStatics.IID)
            PathGeometry.__IPathGeometryStatics := IPathGeometryStatics(factoryPtr)
        }

        return PathGeometry.__IPathGeometryStatics.get_FiguresProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that determines how the intersecting areas contained in the [PathGeometry](pathgeometry.md) are combined.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.pathgeometry.fillrule
     * @type {Integer} 
     */
    FillRule {
        get => this.get_FillRule()
        set => this.put_FillRule(value)
    }

    /**
     * Gets or sets the collection of [PathFigure](pathfigure.md) objects that describe the contents of a path.
     * @remarks
     * The main reason you'd want more than one [PathFigure](pathfigure.md) is if you want to consider the overall [PathGeometry](pathgeometry.md) as one vector drawing that can "restart" the line in a different place, and use [IsClosed](pathfigure_isclosed.md) to close up each figure.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.pathgeometry.figures
     * @type {PathFigureCollection} 
     */
    Figures {
        get => this.get_Figures()
        set => this.put_Figures(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [PathGeometry](pathgeometry.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PathGeometry")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FillRule() {
        if (!this.HasProp("__IPathGeometry")) {
            if ((queryResult := this.QueryInterface(IPathGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPathGeometry := IPathGeometry(outPtr)
        }

        return this.__IPathGeometry.get_FillRule()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FillRule(value) {
        if (!this.HasProp("__IPathGeometry")) {
            if ((queryResult := this.QueryInterface(IPathGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPathGeometry := IPathGeometry(outPtr)
        }

        return this.__IPathGeometry.put_FillRule(value)
    }

    /**
     * 
     * @returns {PathFigureCollection} 
     */
    get_Figures() {
        if (!this.HasProp("__IPathGeometry")) {
            if ((queryResult := this.QueryInterface(IPathGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPathGeometry := IPathGeometry(outPtr)
        }

        return this.__IPathGeometry.get_Figures()
    }

    /**
     * 
     * @param {PathFigureCollection} value 
     * @returns {HRESULT} 
     */
    put_Figures(value) {
        if (!this.HasProp("__IPathGeometry")) {
            if ((queryResult := this.QueryInterface(IPathGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPathGeometry := IPathGeometry(outPtr)
        }

        return this.__IPathGeometry.put_Figures(value)
    }

;@endregion Instance Methods
}
