#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IMapRouteView.ahk
#Include .\IMapRouteViewFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Displays a [MapRoute](../windows.services.maps/maproute.md) on a [MapControl](mapcontrol.md).
 * @remarks
 * To display a route on a map, construct a MapRouteView with the [MapRoute](../windows.services.maps/maproute.md) and add the MapRouteView to the [Routes](mapcontrol_routes.md) collection of the [MapControl](mapcontrol.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maprouteview
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapRouteView extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapRouteView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapRouteView.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {MapRoute} route 
     * @returns {MapRouteView} 
     */
    static CreateInstanceWithMapRoute(route) {
        if (!MapRouteView.HasProp("__IMapRouteViewFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapRouteView")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapRouteViewFactory.IID)
            MapRouteView.__IMapRouteViewFactory := IMapRouteViewFactory(factoryPtr)
        }

        return MapRouteView.__IMapRouteViewFactory.CreateInstanceWithMapRoute(route, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the color of the route displayed in the [MapRouteView](maprouteview.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maprouteview.routecolor
     * @type {Color} 
     */
    RouteColor {
        get => this.get_RouteColor()
        set => this.put_RouteColor(value)
    }

    /**
     * Gets or sets the color of the outline of the route displayed in the [MapRouteView](maprouteview.md).
     * @remarks
     * By default, the fill color of the route does not have a colored outline.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maprouteview.outlinecolor
     * @type {Color} 
     */
    OutlineColor {
        get => this.get_OutlineColor()
        set => this.put_OutlineColor(value)
    }

    /**
     * Gets the [MapRoute](../windows.services.maps/maproute.md) displayed by the [MapRouteView](maprouteview.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maprouteview.route
     * @type {MapRoute} 
     */
    Route {
        get => this.get_Route()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_RouteColor() {
        if (!this.HasProp("__IMapRouteView")) {
            if ((queryResult := this.QueryInterface(IMapRouteView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteView := IMapRouteView(outPtr)
        }

        return this.__IMapRouteView.get_RouteColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_RouteColor(value) {
        if (!this.HasProp("__IMapRouteView")) {
            if ((queryResult := this.QueryInterface(IMapRouteView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteView := IMapRouteView(outPtr)
        }

        return this.__IMapRouteView.put_RouteColor(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_OutlineColor() {
        if (!this.HasProp("__IMapRouteView")) {
            if ((queryResult := this.QueryInterface(IMapRouteView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteView := IMapRouteView(outPtr)
        }

        return this.__IMapRouteView.get_OutlineColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_OutlineColor(value) {
        if (!this.HasProp("__IMapRouteView")) {
            if ((queryResult := this.QueryInterface(IMapRouteView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteView := IMapRouteView(outPtr)
        }

        return this.__IMapRouteView.put_OutlineColor(value)
    }

    /**
     * 
     * @returns {MapRoute} 
     */
    get_Route() {
        if (!this.HasProp("__IMapRouteView")) {
            if ((queryResult := this.QueryInterface(IMapRouteView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteView := IMapRouteView(outPtr)
        }

        return this.__IMapRouteView.get_Route()
    }

;@endregion Instance Methods
}
