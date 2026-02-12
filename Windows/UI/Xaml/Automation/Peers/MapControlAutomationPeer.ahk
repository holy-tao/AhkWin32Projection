#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IMapControlAutomationPeer.ahk
#Include ..\Provider\IScrollProvider.ahk
#Include ..\Provider\ITransformProvider2.ahk
#Include ..\Provider\ITransformProvider.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) types to Microsoft UI Automation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.mapcontrolautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class MapControlAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapControlAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapControlAutomationPeer.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a Boolean value indicating if the map is scrollable in a horizontal direction.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.mapcontrolautomationpeer.horizontallyscrollable
     * @type {Boolean} 
     */
    HorizontallyScrollable {
        get => this.get_HorizontallyScrollable()
    }

    /**
     * Gets a [Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true) value indicating the percentage of how far the map has been scrolled horizontally.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.mapcontrolautomationpeer.horizontalscrollpercent
     * @type {Float} 
     */
    HorizontalScrollPercent {
        get => this.get_HorizontalScrollPercent()
    }

    /**
     * Gets the horizontal size of the map view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.mapcontrolautomationpeer.horizontalviewsize
     * @type {Float} 
     */
    HorizontalViewSize {
        get => this.get_HorizontalViewSize()
    }

    /**
     * Gets a Boolean value indicating if the map is scrollable in a vetrical direction.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.mapcontrolautomationpeer.verticallyscrollable
     * @type {Boolean} 
     */
    VerticallyScrollable {
        get => this.get_VerticallyScrollable()
    }

    /**
     * Gets a [Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true) value indicating the percentage of how far the map has been scrolled vertically.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.mapcontrolautomationpeer.verticalscrollpercent
     * @type {Float} 
     */
    VerticalScrollPercent {
        get => this.get_VerticalScrollPercent()
    }

    /**
     * Gets the vertical size of the map view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.mapcontrolautomationpeer.verticalviewsize
     * @type {Float} 
     */
    VerticalViewSize {
        get => this.get_VerticalViewSize()
    }

    /**
     * Get a Boolean value indicating if the associated map can be zoomed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.mapcontrolautomationpeer.canzoom
     * @type {Boolean} 
     */
    CanZoom {
        get => this.get_CanZoom()
    }

    /**
     * Gets the zoom level of the associated map, which is a value between 1 and 20 in 2D views.
     * @remarks
     * See the remarks section of the [TryZoomInAsync](/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.TryZoomInAsync) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.mapcontrolautomationpeer.zoomlevel
     * @type {Float} 
     */
    ZoomLevel {
        get => this.get_ZoomLevel()
    }

    /**
     * Gets the maximum zoom level for the associated map.
     * @remarks
     * See the remarks section of the [MaxZoomLevel](/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.MaxZoomLevel) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.mapcontrolautomationpeer.maxzoom
     * @type {Float} 
     */
    MaxZoom {
        get => this.get_MaxZoom()
    }

    /**
     * Gets the minimum zoom level for the associated map.
     * @remarks
     * See the remarks section of the [MaxZoomLevel](/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.MaxZoomLevel) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.mapcontrolautomationpeer.minzoom
     * @type {Float} 
     */
    MinZoom {
        get => this.get_MinZoom()
    }

    /**
     * Gets a Boolean value indicating if the associated map can be repositioned.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.mapcontrolautomationpeer.canmove
     * @type {Boolean} 
     */
    CanMove {
        get => this.get_CanMove()
    }

    /**
     * Gets a Boolean value indicating if the associated map can be resized.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.mapcontrolautomationpeer.canresize
     * @type {Boolean} 
     */
    CanResize {
        get => this.get_CanResize()
    }

    /**
     * Gets a Boolean value indicating if the associated map can be rotated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.mapcontrolautomationpeer.canrotate
     * @type {Boolean} 
     */
    CanRotate {
        get => this.get_CanRotate()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HorizontallyScrollable() {
        if (!this.HasProp("__IScrollProvider")) {
            if ((queryResult := this.QueryInterface(IScrollProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollProvider := IScrollProvider(outPtr)
        }

        return this.__IScrollProvider.get_HorizontallyScrollable()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalScrollPercent() {
        if (!this.HasProp("__IScrollProvider")) {
            if ((queryResult := this.QueryInterface(IScrollProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollProvider := IScrollProvider(outPtr)
        }

        return this.__IScrollProvider.get_HorizontalScrollPercent()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HorizontalViewSize() {
        if (!this.HasProp("__IScrollProvider")) {
            if ((queryResult := this.QueryInterface(IScrollProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollProvider := IScrollProvider(outPtr)
        }

        return this.__IScrollProvider.get_HorizontalViewSize()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_VerticallyScrollable() {
        if (!this.HasProp("__IScrollProvider")) {
            if ((queryResult := this.QueryInterface(IScrollProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollProvider := IScrollProvider(outPtr)
        }

        return this.__IScrollProvider.get_VerticallyScrollable()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalScrollPercent() {
        if (!this.HasProp("__IScrollProvider")) {
            if ((queryResult := this.QueryInterface(IScrollProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollProvider := IScrollProvider(outPtr)
        }

        return this.__IScrollProvider.get_VerticalScrollPercent()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_VerticalViewSize() {
        if (!this.HasProp("__IScrollProvider")) {
            if ((queryResult := this.QueryInterface(IScrollProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollProvider := IScrollProvider(outPtr)
        }

        return this.__IScrollProvider.get_VerticalViewSize()
    }

    /**
     * Scrolls the map by the specified horizontal and vertical amounts.
     * @param {Integer} horizontalAmount The amount to scroll the map horizontally.
     * @param {Integer} verticalAmount The amount to scroll the map vertically.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.mapcontrolautomationpeer.scroll
     */
    Scroll(horizontalAmount, verticalAmount) {
        if (!this.HasProp("__IScrollProvider")) {
            if ((queryResult := this.QueryInterface(IScrollProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollProvider := IScrollProvider(outPtr)
        }

        return this.__IScrollProvider.Scroll(horizontalAmount, verticalAmount)
    }

    /**
     * Sets the percentage that the map is scrolled both horizontally and vertically.
     * @param {Float} horizontalPercent The percentage that the map is scrolled horizontally.
     * @param {Float} verticalPercent The percentage that the map is scrolled vertically.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.mapcontrolautomationpeer.setscrollpercent
     */
    SetScrollPercent(horizontalPercent, verticalPercent) {
        if (!this.HasProp("__IScrollProvider")) {
            if ((queryResult := this.QueryInterface(IScrollProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollProvider := IScrollProvider(outPtr)
        }

        return this.__IScrollProvider.SetScrollPercent(horizontalPercent, verticalPercent)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanZoom() {
        if (!this.HasProp("__ITransformProvider2")) {
            if ((queryResult := this.QueryInterface(ITransformProvider2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITransformProvider2 := ITransformProvider2(outPtr)
        }

        return this.__ITransformProvider2.get_CanZoom()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ZoomLevel() {
        if (!this.HasProp("__ITransformProvider2")) {
            if ((queryResult := this.QueryInterface(ITransformProvider2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITransformProvider2 := ITransformProvider2(outPtr)
        }

        return this.__ITransformProvider2.get_ZoomLevel()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxZoom() {
        if (!this.HasProp("__ITransformProvider2")) {
            if ((queryResult := this.QueryInterface(ITransformProvider2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITransformProvider2 := ITransformProvider2(outPtr)
        }

        return this.__ITransformProvider2.get_MaxZoom()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinZoom() {
        if (!this.HasProp("__ITransformProvider2")) {
            if ((queryResult := this.QueryInterface(ITransformProvider2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITransformProvider2 := ITransformProvider2(outPtr)
        }

        return this.__ITransformProvider2.get_MinZoom()
    }

    /**
     * Zooms the associated map to the specified [ZoomLevel](/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.ZoomLevel).
     * @param {Float} zoom The [ZoomLevel](/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.ZoomLevel) to which to set the associated map.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.mapcontrolautomationpeer.zoom
     */
    Zoom(zoom) {
        if (!this.HasProp("__ITransformProvider2")) {
            if ((queryResult := this.QueryInterface(ITransformProvider2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITransformProvider2 := ITransformProvider2(outPtr)
        }

        return this.__ITransformProvider2.Zoom(zoom)
    }

    /**
     * Zooms the viewport of the associated map by the specified [ZoomUnit](/uwp/api/windows.ui.xaml.automation.zoomunit).
     * @param {Integer} zoomUnit_ The amount to zoom the viewport of the associated map.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.mapcontrolautomationpeer.zoombyunit
     */
    ZoomByUnit(zoomUnit_) {
        if (!this.HasProp("__ITransformProvider2")) {
            if ((queryResult := this.QueryInterface(ITransformProvider2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITransformProvider2 := ITransformProvider2(outPtr)
        }

        return this.__ITransformProvider2.ZoomByUnit(zoomUnit_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanMove() {
        if (!this.HasProp("__ITransformProvider")) {
            if ((queryResult := this.QueryInterface(ITransformProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITransformProvider := ITransformProvider(outPtr)
        }

        return this.__ITransformProvider.get_CanMove()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanResize() {
        if (!this.HasProp("__ITransformProvider")) {
            if ((queryResult := this.QueryInterface(ITransformProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITransformProvider := ITransformProvider(outPtr)
        }

        return this.__ITransformProvider.get_CanResize()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanRotate() {
        if (!this.HasProp("__ITransformProvider")) {
            if ((queryResult := this.QueryInterface(ITransformProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITransformProvider := ITransformProvider(outPtr)
        }

        return this.__ITransformProvider.get_CanRotate()
    }

    /**
     * Moves the map by the specified horizontal and vertical amounts.
     * @param {Float} x The amount to move the map horizontally.
     * @param {Float} y The amount to move the map vertically.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.mapcontrolautomationpeer.move
     */
    Move(x, y) {
        if (!this.HasProp("__ITransformProvider")) {
            if ((queryResult := this.QueryInterface(ITransformProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITransformProvider := ITransformProvider(outPtr)
        }

        return this.__ITransformProvider.Move(x, y)
    }

    /**
     * Resizes the associated map to the specified width and height.
     * @param {Float} width The new width for the associated map.
     * @param {Float} height The new height for the associated map.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.mapcontrolautomationpeer.resize
     */
    Resize(width, height) {
        if (!this.HasProp("__ITransformProvider")) {
            if ((queryResult := this.QueryInterface(ITransformProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITransformProvider := ITransformProvider(outPtr)
        }

        return this.__ITransformProvider.Resize(width, height)
    }

    /**
     * Rotates the map's camera from its current position.
     * @remarks
     * Values greater than 360 degrees are normalized to their equivalent 0-360 degree value.
     * @param {Float} degrees The degrees that the map's camera rotates in a horizontal clockwise direction.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.mapcontrolautomationpeer.rotate
     */
    Rotate(degrees) {
        if (!this.HasProp("__ITransformProvider")) {
            if ((queryResult := this.QueryInterface(ITransformProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITransformProvider := ITransformProvider(outPtr)
        }

        return this.__ITransformProvider.Rotate(degrees)
    }

;@endregion Instance Methods
}
