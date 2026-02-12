#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Shape.ahk
#Include .\IRectangle.ahk
#Include .\IRectangleStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Draws a rectangle with a given [Height](../windows.ui.xaml/frameworkelement_height.md) and [Width](../windows.ui.xaml/frameworkelement_width.md) specified in device-independent pixel (DIP).
 * @remarks
 * You can set the [Fill](shape_fill.md) property to give the shape a background fill, like a solid color, gradient, or image. You can set the [Stroke](shape_stroke.md) and other related stroke properties to specify the look of the shape's outline.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.rectangle
 * @namespace Windows.UI.Xaml.Shapes
 * @version WindowsRuntime 1.4
 */
class Rectangle extends Shape {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRectangle

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRectangle.IID

    /**
     * Identifies the [RadiusX](rectangle_radiusx.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.rectangle.radiusxproperty
     * @type {DependencyProperty} 
     */
    static RadiusXProperty {
        get => Rectangle.get_RadiusXProperty()
    }

    /**
     * Identifies the [RadiusY](rectangle_radiusy.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.rectangle.radiusyproperty
     * @type {DependencyProperty} 
     */
    static RadiusYProperty {
        get => Rectangle.get_RadiusYProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RadiusXProperty() {
        if (!Rectangle.HasProp("__IRectangleStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Rectangle")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRectangleStatics.IID)
            Rectangle.__IRectangleStatics := IRectangleStatics(factoryPtr)
        }

        return Rectangle.__IRectangleStatics.get_RadiusXProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RadiusYProperty() {
        if (!Rectangle.HasProp("__IRectangleStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Rectangle")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRectangleStatics.IID)
            Rectangle.__IRectangleStatics := IRectangleStatics(factoryPtr)
        }

        return Rectangle.__IRectangleStatics.get_RadiusYProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the x-axis radius of the ellipse that is used to round the corners of the rectangle.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.rectangle.radiusx
     * @type {Float} 
     */
    RadiusX {
        get => this.get_RadiusX()
        set => this.put_RadiusX(value)
    }

    /**
     * Gets or sets the y-axis radius of the ellipse that is used to round the corners of the rectangle.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.rectangle.radiusy
     * @type {Float} 
     */
    RadiusY {
        get => this.get_RadiusY()
        set => this.put_RadiusY(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [Rectangle](rectangle.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Rectangle")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RadiusX() {
        if (!this.HasProp("__IRectangle")) {
            if ((queryResult := this.QueryInterface(IRectangle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRectangle := IRectangle(outPtr)
        }

        return this.__IRectangle.get_RadiusX()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RadiusX(value) {
        if (!this.HasProp("__IRectangle")) {
            if ((queryResult := this.QueryInterface(IRectangle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRectangle := IRectangle(outPtr)
        }

        return this.__IRectangle.put_RadiusX(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RadiusY() {
        if (!this.HasProp("__IRectangle")) {
            if ((queryResult := this.QueryInterface(IRectangle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRectangle := IRectangle(outPtr)
        }

        return this.__IRectangle.get_RadiusY()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RadiusY(value) {
        if (!this.HasProp("__IRectangle")) {
            if ((queryResult := this.QueryInterface(IRectangle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRectangle := IRectangle(outPtr)
        }

        return this.__IRectangle.put_RadiusY(value)
    }

;@endregion Instance Methods
}
