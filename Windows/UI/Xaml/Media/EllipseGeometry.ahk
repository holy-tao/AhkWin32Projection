#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Geometry.ahk
#Include .\IEllipseGeometry.ahk
#Include .\IEllipseGeometryStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the geometry of a circle or ellipse.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.ellipsegeometry
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class EllipseGeometry extends Geometry {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEllipseGeometry

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEllipseGeometry.IID

    /**
     * Identifies the [Center](ellipsegeometry_center.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.ellipsegeometry.centerproperty
     * @type {DependencyProperty} 
     */
    static CenterProperty {
        get => EllipseGeometry.get_CenterProperty()
    }

    /**
     * Identifies the [RadiusX](ellipsegeometry_radiusx.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.ellipsegeometry.radiusxproperty
     * @type {DependencyProperty} 
     */
    static RadiusXProperty {
        get => EllipseGeometry.get_RadiusXProperty()
    }

    /**
     * Identifies the [RadiusY](ellipsegeometry_radiusy.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.ellipsegeometry.radiusyproperty
     * @type {DependencyProperty} 
     */
    static RadiusYProperty {
        get => EllipseGeometry.get_RadiusYProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CenterProperty() {
        if (!EllipseGeometry.HasProp("__IEllipseGeometryStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.EllipseGeometry")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEllipseGeometryStatics.IID)
            EllipseGeometry.__IEllipseGeometryStatics := IEllipseGeometryStatics(factoryPtr)
        }

        return EllipseGeometry.__IEllipseGeometryStatics.get_CenterProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RadiusXProperty() {
        if (!EllipseGeometry.HasProp("__IEllipseGeometryStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.EllipseGeometry")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEllipseGeometryStatics.IID)
            EllipseGeometry.__IEllipseGeometryStatics := IEllipseGeometryStatics(factoryPtr)
        }

        return EllipseGeometry.__IEllipseGeometryStatics.get_RadiusXProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RadiusYProperty() {
        if (!EllipseGeometry.HasProp("__IEllipseGeometryStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.EllipseGeometry")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEllipseGeometryStatics.IID)
            EllipseGeometry.__IEllipseGeometryStatics := IEllipseGeometryStatics(factoryPtr)
        }

        return EllipseGeometry.__IEllipseGeometryStatics.get_RadiusYProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the center point of the [EllipseGeometry](ellipsegeometry.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.ellipsegeometry.center
     * @type {POINT} 
     */
    Center {
        get => this.get_Center()
        set => this.put_Center(value)
    }

    /**
     * Gets or sets the x-radius value of the [EllipseGeometry](ellipsegeometry.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.ellipsegeometry.radiusx
     * @type {Float} 
     */
    RadiusX {
        get => this.get_RadiusX()
        set => this.put_RadiusX(value)
    }

    /**
     * Gets or sets the y-radius value of the [EllipseGeometry](ellipsegeometry.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.ellipsegeometry.radiusy
     * @type {Float} 
     */
    RadiusY {
        get => this.get_RadiusY()
        set => this.put_RadiusY(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [EllipseGeometry](ellipsegeometry.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.EllipseGeometry")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Center() {
        if (!this.HasProp("__IEllipseGeometry")) {
            if ((queryResult := this.QueryInterface(IEllipseGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEllipseGeometry := IEllipseGeometry(outPtr)
        }

        return this.__IEllipseGeometry.get_Center()
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_Center(value) {
        if (!this.HasProp("__IEllipseGeometry")) {
            if ((queryResult := this.QueryInterface(IEllipseGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEllipseGeometry := IEllipseGeometry(outPtr)
        }

        return this.__IEllipseGeometry.put_Center(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RadiusX() {
        if (!this.HasProp("__IEllipseGeometry")) {
            if ((queryResult := this.QueryInterface(IEllipseGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEllipseGeometry := IEllipseGeometry(outPtr)
        }

        return this.__IEllipseGeometry.get_RadiusX()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RadiusX(value) {
        if (!this.HasProp("__IEllipseGeometry")) {
            if ((queryResult := this.QueryInterface(IEllipseGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEllipseGeometry := IEllipseGeometry(outPtr)
        }

        return this.__IEllipseGeometry.put_RadiusX(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RadiusY() {
        if (!this.HasProp("__IEllipseGeometry")) {
            if ((queryResult := this.QueryInterface(IEllipseGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEllipseGeometry := IEllipseGeometry(outPtr)
        }

        return this.__IEllipseGeometry.get_RadiusY()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RadiusY(value) {
        if (!this.HasProp("__IEllipseGeometry")) {
            if ((queryResult := this.QueryInterface(IEllipseGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEllipseGeometry := IEllipseGeometry(outPtr)
        }

        return this.__IEllipseGeometry.put_RadiusY(value)
    }

;@endregion Instance Methods
}
