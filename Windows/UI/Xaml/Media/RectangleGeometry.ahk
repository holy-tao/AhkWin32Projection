#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Geometry.ahk
#Include .\IRectangleGeometry.ahk
#Include .\IRectangleGeometryStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Describes a two-dimensional rectangular geometry.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.rectanglegeometry
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class RectangleGeometry extends Geometry {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRectangleGeometry

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRectangleGeometry.IID

    /**
     * Identifies the [Rect](rectanglegeometry_rect.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.rectanglegeometry.rectproperty
     * @type {DependencyProperty} 
     */
    static RectProperty {
        get => RectangleGeometry.get_RectProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RectProperty() {
        if (!RectangleGeometry.HasProp("__IRectangleGeometryStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.RectangleGeometry")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRectangleGeometryStatics.IID)
            RectangleGeometry.__IRectangleGeometryStatics := IRectangleGeometryStatics(factoryPtr)
        }

        return RectangleGeometry.__IRectangleGeometryStatics.get_RectProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the dimensions of the rectangle.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.rectanglegeometry.rect
     * @type {RECT} 
     */
    Rect {
        get => this.get_Rect()
        set => this.put_Rect(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [RectangleGeometry](rectanglegeometry.md) class and creates a rectangle with zero area.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.RectangleGeometry")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_Rect() {
        if (!this.HasProp("__IRectangleGeometry")) {
            if ((queryResult := this.QueryInterface(IRectangleGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRectangleGeometry := IRectangleGeometry(outPtr)
        }

        return this.__IRectangleGeometry.get_Rect()
    }

    /**
     * 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    put_Rect(value) {
        if (!this.HasProp("__IRectangleGeometry")) {
            if ((queryResult := this.QueryInterface(IRectangleGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRectangleGeometry := IRectangleGeometry(outPtr)
        }

        return this.__IRectangleGeometry.put_Rect(value)
    }

;@endregion Instance Methods
}
