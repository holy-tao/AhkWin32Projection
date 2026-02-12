#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\MapElement.ahk
#Include .\IMapBillboard.ahk
#Include .\IMapBillboardStatics.ahk
#Include .\IMapBillboardFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Displays an image that scales and fades in relation to its distance from the [ReferenceCamera](mapbillboard_referencecamera.md) of the MapBillboard.
 * @remarks
 * A MapBillboard is very similar to a [MapIcon](mapicon.md). Use a [MapIcon](mapicon.md) to emphasize a location on a map. Because images used to mark locations are typically small, they can remain the same size as users zoom in and out on a map.
 * 
 * Use a MapBillboard to show things like large images that relate to map locations. As users zoom out, the image will shrink proportionally in size to enable the user to view more of the map.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapbillboard
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapBillboard extends MapElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapBillboard

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapBillboard.IID

    /**
     * Identifies the [Location](mapbillboard_location.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapbillboard.locationproperty
     * @type {DependencyProperty} 
     */
    static LocationProperty {
        get => MapBillboard.get_LocationProperty()
    }

    /**
     * Identifies the [NormalizedAnchorPoint](mapbillboard_normalizedanchorpoint.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapbillboard.normalizedanchorpointproperty
     * @type {DependencyProperty} 
     */
    static NormalizedAnchorPointProperty {
        get => MapBillboard.get_NormalizedAnchorPointProperty()
    }

    /**
     * Identifies the [CollisionBehaviorDesired](mapbillboard_collisionbehaviordesired.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapbillboard.collisionbehaviordesiredproperty
     * @type {DependencyProperty} 
     */
    static CollisionBehaviorDesiredProperty {
        get => MapBillboard.get_CollisionBehaviorDesiredProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LocationProperty() {
        if (!MapBillboard.HasProp("__IMapBillboardStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapBillboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapBillboardStatics.IID)
            MapBillboard.__IMapBillboardStatics := IMapBillboardStatics(factoryPtr)
        }

        return MapBillboard.__IMapBillboardStatics.get_LocationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_NormalizedAnchorPointProperty() {
        if (!MapBillboard.HasProp("__IMapBillboardStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapBillboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapBillboardStatics.IID)
            MapBillboard.__IMapBillboardStatics := IMapBillboardStatics(factoryPtr)
        }

        return MapBillboard.__IMapBillboardStatics.get_NormalizedAnchorPointProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CollisionBehaviorDesiredProperty() {
        if (!MapBillboard.HasProp("__IMapBillboardStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapBillboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapBillboardStatics.IID)
            MapBillboard.__IMapBillboardStatics := IMapBillboardStatics(factoryPtr)
        }

        return MapBillboard.__IMapBillboardStatics.get_CollisionBehaviorDesiredProperty()
    }

    /**
     * Initializes a new instance of the [MapBillboard](mapbillboard.md) class.
     * @param {MapCamera} camera The [MapCamera](mapcamera.md) settings that define the current position of the reference camera.
     * @returns {MapBillboard} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapbillboard.#ctor
     */
    static CreateInstanceFromCamera(camera) {
        if (!MapBillboard.HasProp("__IMapBillboardFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapBillboard")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapBillboardFactory.IID)
            MapBillboard.__IMapBillboardFactory := IMapBillboardFactory(factoryPtr)
        }

        return MapBillboard.__IMapBillboardFactory.CreateInstanceFromCamera(camera)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the geographic location of the [MapBillboard](mapbillboard.md) on the [MapControl](mapcontrol.md). The location is the geographic location on the [MapControl](mapcontrol.md) at which the [NormalizedAnchorPoint](mapbillboard_normalizedanchorpoint.md) of the [MapBillboard](mapbillboard.md) is positioned.
     * @remarks
     * If you provide an altitude and altitude reference system in 3D views, then [MapBillboard](mapbillboard.md) elements added to the [MapControl](mapcontrol.md) end up being placed underground or floating in space.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapbillboard.location
     * @type {Geopoint} 
     */
    Location {
        get => this.get_Location()
        set => this.put_Location(value)
    }

    /**
     * Gets or sets the anchor point of the [MapBillboard](mapbillboard.md). The anchor point is the point on the [MapBillboard](mapbillboard.md) that is positioned at the point on the [MapControl](mapcontrol.md) specified by the [Location](mapbillboard_location.md) property.
     * @remarks
     * The default value of (0.5, 1), which represents the bottom center of the image.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapbillboard.normalizedanchorpoint
     * @type {POINT} 
     */
    NormalizedAnchorPoint {
        get => this.get_NormalizedAnchorPoint()
        set => this.put_NormalizedAnchorPoint(value)
    }

    /**
     * Gets or sets the image for the [MapBillboard](mapbillboard.md). Provide an optional custom image to replace the default point of interest (POI) image.
     * @remarks
     * The following line of code displays the [MapBillboard](mapbillboard.md) with a custom image saved in the Assets folder of the project.
     * ```csharp
     * MapBillboard1.Image = RandomAccessStreamReference.CreateFromUri(new Uri("ms-appx:///Assets/customicon.png"));
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapbillboard.image
     * @type {IRandomAccessStreamReference} 
     */
    Image {
        get => this.get_Image()
        set => this.put_Image(value)
    }

    /**
     * Gets or sets the behavior of a [MapBillboard](mapbillboard.md) when it collides with other map features due to zoom level.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapbillboard.collisionbehaviordesired
     * @type {Integer} 
     */
    CollisionBehaviorDesired {
        get => this.get_CollisionBehaviorDesired()
        set => this.put_CollisionBehaviorDesired(value)
    }

    /**
     * Gets the [MapCamera](mapcamera.md) settings that define the position and orientation where the image appears at a 1x scale.
     * @remarks
     * Because a [MapBillboard](mapbillboard.md) image scales in and out as the [ZoomLevel](mapcontrol_zoomlevel.md) of the map changes, it's important to define where in that [ZoomLevel](mapcontrol_zoomlevel.md) the image appears at a normal 1x scale. You define that position in a [Geopoint](../windows.devices.geolocation/geopoint.md), and then pass that [Geopoint](../windows.devices.geolocation/geopoint.md) as a parameter to the [MapBillboard](mapbillboard.md) constructor.
     * 
     * For example, if you use the map's [ActualCamera](mapcontrol_actualcamera.md) as that constructor parameter, the position defined in the reference camera becomes equal to the position defined in the maps internal camera. This becomes the position of the camera where the [MapBillboard](mapbillboard.md) image appears at 1x scale. However, if your app gives users the ability to zoom out on the map, the image decreases in size because the maps internal camera is rising in altitude while the image at 1x scale remains fixed at the reference camera's position.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapbillboard.referencecamera
     * @type {MapCamera} 
     */
    ReferenceCamera {
        get => this.get_ReferenceCamera()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Geopoint} 
     */
    get_Location() {
        if (!this.HasProp("__IMapBillboard")) {
            if ((queryResult := this.QueryInterface(IMapBillboard.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapBillboard := IMapBillboard(outPtr)
        }

        return this.__IMapBillboard.get_Location()
    }

    /**
     * 
     * @param {Geopoint} value 
     * @returns {HRESULT} 
     */
    put_Location(value) {
        if (!this.HasProp("__IMapBillboard")) {
            if ((queryResult := this.QueryInterface(IMapBillboard.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapBillboard := IMapBillboard(outPtr)
        }

        return this.__IMapBillboard.put_Location(value)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_NormalizedAnchorPoint() {
        if (!this.HasProp("__IMapBillboard")) {
            if ((queryResult := this.QueryInterface(IMapBillboard.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapBillboard := IMapBillboard(outPtr)
        }

        return this.__IMapBillboard.get_NormalizedAnchorPoint()
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_NormalizedAnchorPoint(value) {
        if (!this.HasProp("__IMapBillboard")) {
            if ((queryResult := this.QueryInterface(IMapBillboard.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapBillboard := IMapBillboard(outPtr)
        }

        return this.__IMapBillboard.put_NormalizedAnchorPoint(value)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Image() {
        if (!this.HasProp("__IMapBillboard")) {
            if ((queryResult := this.QueryInterface(IMapBillboard.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapBillboard := IMapBillboard(outPtr)
        }

        return this.__IMapBillboard.get_Image()
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_Image(value) {
        if (!this.HasProp("__IMapBillboard")) {
            if ((queryResult := this.QueryInterface(IMapBillboard.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapBillboard := IMapBillboard(outPtr)
        }

        return this.__IMapBillboard.put_Image(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CollisionBehaviorDesired() {
        if (!this.HasProp("__IMapBillboard")) {
            if ((queryResult := this.QueryInterface(IMapBillboard.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapBillboard := IMapBillboard(outPtr)
        }

        return this.__IMapBillboard.get_CollisionBehaviorDesired()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CollisionBehaviorDesired(value) {
        if (!this.HasProp("__IMapBillboard")) {
            if ((queryResult := this.QueryInterface(IMapBillboard.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapBillboard := IMapBillboard(outPtr)
        }

        return this.__IMapBillboard.put_CollisionBehaviorDesired(value)
    }

    /**
     * 
     * @returns {MapCamera} 
     */
    get_ReferenceCamera() {
        if (!this.HasProp("__IMapBillboard")) {
            if ((queryResult := this.QueryInterface(IMapBillboard.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapBillboard := IMapBillboard(outPtr)
        }

        return this.__IMapBillboard.get_ReferenceCamera()
    }

;@endregion Instance Methods
}
