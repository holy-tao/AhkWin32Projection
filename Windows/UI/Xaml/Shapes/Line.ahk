#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Shape.ahk
#Include .\ILine.ahk
#Include .\ILineStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Draws a straight line between two points.
 * @remarks
 * Set the [Stroke](shape_stroke.md) to specify the color of the line. Set the [StrokeThickness](shape_strokethickness.md) property to specify the thickness of the line.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.line
 * @namespace Windows.UI.Xaml.Shapes
 * @version WindowsRuntime 1.4
 */
class Line extends Shape {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILine

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILine.IID

    /**
     * Identifies the [X1](line_x1.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.line.x1property
     * @type {DependencyProperty} 
     */
    static X1Property {
        get => Line.get_X1Property()
    }

    /**
     * Identifies the [Y1](line_y1.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.line.y1property
     * @type {DependencyProperty} 
     */
    static Y1Property {
        get => Line.get_Y1Property()
    }

    /**
     * Identifies the [X2](line_x2.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.line.x2property
     * @type {DependencyProperty} 
     */
    static X2Property {
        get => Line.get_X2Property()
    }

    /**
     * Identifies the [Y2](line_y2.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.line.y2property
     * @type {DependencyProperty} 
     */
    static Y2Property {
        get => Line.get_Y2Property()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_X1Property() {
        if (!Line.HasProp("__ILineStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Line")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILineStatics.IID)
            Line.__ILineStatics := ILineStatics(factoryPtr)
        }

        return Line.__ILineStatics.get_X1Property()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_Y1Property() {
        if (!Line.HasProp("__ILineStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Line")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILineStatics.IID)
            Line.__ILineStatics := ILineStatics(factoryPtr)
        }

        return Line.__ILineStatics.get_Y1Property()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_X2Property() {
        if (!Line.HasProp("__ILineStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Line")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILineStatics.IID)
            Line.__ILineStatics := ILineStatics(factoryPtr)
        }

        return Line.__ILineStatics.get_X2Property()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_Y2Property() {
        if (!Line.HasProp("__ILineStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Line")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILineStatics.IID)
            Line.__ILineStatics := ILineStatics(factoryPtr)
        }

        return Line.__ILineStatics.get_Y2Property()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the x-coordinate of the [Line](line.md) start point.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.line.x1
     * @type {Float} 
     */
    X1 {
        get => this.get_X1()
        set => this.put_X1(value)
    }

    /**
     * Gets or sets the y-coordinate of the [Line](line.md) start point.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.line.y1
     * @type {Float} 
     */
    Y1 {
        get => this.get_Y1()
        set => this.put_Y1(value)
    }

    /**
     * Gets or sets the x-coordinate of the [Line](line.md) end point.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.line.x2
     * @type {Float} 
     */
    X2 {
        get => this.get_X2()
        set => this.put_X2(value)
    }

    /**
     * Gets or sets the y-coordinate of the [Line](line.md) end point.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.line.y2
     * @type {Float} 
     */
    Y2 {
        get => this.get_Y2()
        set => this.put_Y2(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [Line](line.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Line")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_X1() {
        if (!this.HasProp("__ILine")) {
            if ((queryResult := this.QueryInterface(ILine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILine := ILine(outPtr)
        }

        return this.__ILine.get_X1()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_X1(value) {
        if (!this.HasProp("__ILine")) {
            if ((queryResult := this.QueryInterface(ILine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILine := ILine(outPtr)
        }

        return this.__ILine.put_X1(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Y1() {
        if (!this.HasProp("__ILine")) {
            if ((queryResult := this.QueryInterface(ILine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILine := ILine(outPtr)
        }

        return this.__ILine.get_Y1()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Y1(value) {
        if (!this.HasProp("__ILine")) {
            if ((queryResult := this.QueryInterface(ILine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILine := ILine(outPtr)
        }

        return this.__ILine.put_Y1(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_X2() {
        if (!this.HasProp("__ILine")) {
            if ((queryResult := this.QueryInterface(ILine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILine := ILine(outPtr)
        }

        return this.__ILine.get_X2()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_X2(value) {
        if (!this.HasProp("__ILine")) {
            if ((queryResult := this.QueryInterface(ILine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILine := ILine(outPtr)
        }

        return this.__ILine.put_X2(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Y2() {
        if (!this.HasProp("__ILine")) {
            if ((queryResult := this.QueryInterface(ILine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILine := ILine(outPtr)
        }

        return this.__ILine.get_Y2()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Y2(value) {
        if (!this.HasProp("__ILine")) {
            if ((queryResult := this.QueryInterface(ILine.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILine := ILine(outPtr)
        }

        return this.__ILine.put_Y2(value)
    }

;@endregion Instance Methods
}
