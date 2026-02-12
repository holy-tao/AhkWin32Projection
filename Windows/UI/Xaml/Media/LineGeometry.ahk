#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Geometry.ahk
#Include .\ILineGeometry.ahk
#Include .\ILineGeometryStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the geometry of a line.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.linegeometry
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class LineGeometry extends Geometry {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILineGeometry

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILineGeometry.IID

    /**
     * Identifies the [StartPoint](linegeometry_startpoint.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.linegeometry.startpointproperty
     * @type {DependencyProperty} 
     */
    static StartPointProperty {
        get => LineGeometry.get_StartPointProperty()
    }

    /**
     * Identifies the [EndPoint](linegeometry_endpoint.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.linegeometry.endpointproperty
     * @type {DependencyProperty} 
     */
    static EndPointProperty {
        get => LineGeometry.get_EndPointProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StartPointProperty() {
        if (!LineGeometry.HasProp("__ILineGeometryStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.LineGeometry")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILineGeometryStatics.IID)
            LineGeometry.__ILineGeometryStatics := ILineGeometryStatics(factoryPtr)
        }

        return LineGeometry.__ILineGeometryStatics.get_StartPointProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_EndPointProperty() {
        if (!LineGeometry.HasProp("__ILineGeometryStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.LineGeometry")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILineGeometryStatics.IID)
            LineGeometry.__ILineGeometryStatics := ILineGeometryStatics(factoryPtr)
        }

        return LineGeometry.__ILineGeometryStatics.get_EndPointProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the start point of the line.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.linegeometry.startpoint
     * @type {POINT} 
     */
    StartPoint {
        get => this.get_StartPoint()
        set => this.put_StartPoint(value)
    }

    /**
     * Gets or sets the end point of a line.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.linegeometry.endpoint
     * @type {POINT} 
     */
    EndPoint {
        get => this.get_EndPoint()
        set => this.put_EndPoint(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [LineGeometry](linegeometry.md) class that has no length.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.LineGeometry")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_StartPoint() {
        if (!this.HasProp("__ILineGeometry")) {
            if ((queryResult := this.QueryInterface(ILineGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineGeometry := ILineGeometry(outPtr)
        }

        return this.__ILineGeometry.get_StartPoint()
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_StartPoint(value) {
        if (!this.HasProp("__ILineGeometry")) {
            if ((queryResult := this.QueryInterface(ILineGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineGeometry := ILineGeometry(outPtr)
        }

        return this.__ILineGeometry.put_StartPoint(value)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_EndPoint() {
        if (!this.HasProp("__ILineGeometry")) {
            if ((queryResult := this.QueryInterface(ILineGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineGeometry := ILineGeometry(outPtr)
        }

        return this.__ILineGeometry.get_EndPoint()
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_EndPoint(value) {
        if (!this.HasProp("__ILineGeometry")) {
            if ((queryResult := this.QueryInterface(ILineGeometry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineGeometry := ILineGeometry(outPtr)
        }

        return this.__ILineGeometry.put_EndPoint(value)
    }

;@endregion Instance Methods
}
