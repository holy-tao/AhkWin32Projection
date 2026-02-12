#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\MapElement.ahk
#Include .\IMapIcon.ahk
#Include .\IMapIcon2.ahk
#Include .\IMapIconStatics.ahk
#Include .\IMapIconStatics2.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Displays an image such as a pushpin with optional text on a [MapControl](mapcontrol.md). Use the default image or provide a custom image.
 * @remarks
 * Display pushpins, images, and shapes on the [MapControl](mapcontrol.md) by adding them to its [MapElements](mapcontrol_mapelements.md) collection.
 * 
 * 
 * + Display an **image** such as a pushpin with optional text by using the MapIcon class. Keep the default image or provide a custom image.
 * + Define and display a [MapPolygon](mappolygon.md) or a [MapPolyline](mappolyline.md).
 * Alternately, to display XAML elements on the [MapControl](mapcontrol.md), add them to its [Children](mapcontrol_children.md) collection.
 * 
 * If you don't explicitly set an [Altitude](/uwp/api/windows.devices.geolocation.basicgeoposition) and [AltitudeReferenceSystem](/uwp/api/windows.devices.geolocation.geopoint.AltitudeReferenceSystem), the [**MapIcon**](/uwp/api/Windows.UI.Xaml.Controls.Maps.MapIcon) will be placed on the surface.
 * 
 * > > [!TIP]
 * > When you display a MapIcon image that points to a specific location on the map - for example, a pushpin or an arrow - consider setting the value of the [NormalizedAnchorPoint](mapicon_normalizedanchorpoint.md) property to the approximate location of the pointer on the image. If you leave the value of [NormalizedAnchorPoint](mapicon_normalizedanchorpoint.md) at its default value of (0, 0), which represents the upper left corner of the image, changes in the [ZoomLevel](mapcontrol_zoomlevel.md) of the map may leave the image pointing to a different location.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapicon
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapIcon extends MapElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapIcon

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapIcon.IID

    /**
     * Identifies the [Location](mapicon_location.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapicon.locationproperty
     * @type {DependencyProperty} 
     */
    static LocationProperty {
        get => MapIcon.get_LocationProperty()
    }

    /**
     * Identifies the [Title](mapicon_title.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapicon.titleproperty
     * @type {DependencyProperty} 
     */
    static TitleProperty {
        get => MapIcon.get_TitleProperty()
    }

    /**
     * Identifies the [NormalizedAnchorPoint](mapicon_normalizedanchorpoint.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapicon.normalizedanchorpointproperty
     * @type {DependencyProperty} 
     */
    static NormalizedAnchorPointProperty {
        get => MapIcon.get_NormalizedAnchorPointProperty()
    }

    /**
     * Identifies the [CollisionBehaviorDesired](mapicon_collisionbehaviordesired.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapicon.collisionbehaviordesiredproperty
     * @type {DependencyProperty} 
     */
    static CollisionBehaviorDesiredProperty {
        get => MapIcon.get_CollisionBehaviorDesiredProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LocationProperty() {
        if (!MapIcon.HasProp("__IMapIconStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapIcon")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapIconStatics.IID)
            MapIcon.__IMapIconStatics := IMapIconStatics(factoryPtr)
        }

        return MapIcon.__IMapIconStatics.get_LocationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TitleProperty() {
        if (!MapIcon.HasProp("__IMapIconStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapIcon")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapIconStatics.IID)
            MapIcon.__IMapIconStatics := IMapIconStatics(factoryPtr)
        }

        return MapIcon.__IMapIconStatics.get_TitleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_NormalizedAnchorPointProperty() {
        if (!MapIcon.HasProp("__IMapIconStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapIcon")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapIconStatics.IID)
            MapIcon.__IMapIconStatics := IMapIconStatics(factoryPtr)
        }

        return MapIcon.__IMapIconStatics.get_NormalizedAnchorPointProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CollisionBehaviorDesiredProperty() {
        if (!MapIcon.HasProp("__IMapIconStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapIcon")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapIconStatics2.IID)
            MapIcon.__IMapIconStatics2 := IMapIconStatics2(factoryPtr)
        }

        return MapIcon.__IMapIconStatics2.get_CollisionBehaviorDesiredProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the geographic location of the [MapIcon](mapicon.md) on the [MapControl](mapcontrol.md). The location is the geographic location on the [MapControl](mapcontrol.md) at which the [NormalizedAnchorPoint](mapicon_normalizedanchorpoint.md) of the [MapIcon](mapicon.md) is positioned.
     * @remarks
     * If you provide an Alititude and AltitudeReferenceSystem in 3D views, then MapIcon elements added to the MapControl end up being placed underground or floating in space.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapicon.location
     * @type {Geopoint} 
     */
    Location {
        get => this.get_Location()
        set => this.put_Location(value)
    }

    /**
     * Gets or sets the optional text of the [MapIcon](mapicon.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapicon.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets or sets the anchor point of the [MapIcon](mapicon.md). The anchor point is the point on the [MapIcon](mapicon.md) that is positioned at the point on the [MapControl](mapcontrol.md) specified by the [Location](mapicon_location.md) property.
     * @remarks
     * When you display a [MapIcon](mapicon.md) image that points to a specific location on the map - for example, a pushpin or an arrow - consider setting the value of the NormalizedAnchorPoint property to the approximate location of the pointer on the image. If you leave the value of NormalizedAnchorPoint at its default value of (0, 0), which represents the upper left corner of the image, changes in the [ZoomLevel](mapcontrol_zoomlevel.md) of the map may leave the image pointing to a different location.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapicon.normalizedanchorpoint
     * @type {POINT} 
     */
    NormalizedAnchorPoint {
        get => this.get_NormalizedAnchorPoint()
        set => this.put_NormalizedAnchorPoint(value)
    }

    /**
     * Gets or sets the image for the [MapIcon](mapicon.md). Provide an optional custom image to replace the default point of interest (POI) image.
     * The following stream formats are supported:
     * * PNG - a compressed PNG formatted stream
     * * JPG - a compressed JPG formatted stream
     * * SVG - a compressed SVG formatted stream
     * * BMP - an uncompressed BMP format stream
     * * Raw RGB bytes. The size of the image is assumed to be square. This is only valid for a stream with an integral square root length.
     * @remarks
     * The following line of code displays the [MapIcon](mapicon.md) with a custom image saved in the Assets folder of the project.
     * 
     * `            MapIcon1.Image = RandomAccessStreamReference.CreateFromUri(new Uri("ms-appx:///Assets/customicon.png"));`
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapicon.image
     * @type {IRandomAccessStreamReference} 
     */
    Image {
        get => this.get_Image()
        set => this.put_Image(value)
    }

    /**
     * Gets or sets the behavior of a [MapIcon](mapicon.md) when it collides with other map features due to zoom level.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapicon.collisionbehaviordesired
     * @type {Integer} 
     */
    CollisionBehaviorDesired {
        get => this.get_CollisionBehaviorDesired()
        set => this.put_CollisionBehaviorDesired(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MapIcon](mapicon.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapIcon")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Geopoint} 
     */
    get_Location() {
        if (!this.HasProp("__IMapIcon")) {
            if ((queryResult := this.QueryInterface(IMapIcon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapIcon := IMapIcon(outPtr)
        }

        return this.__IMapIcon.get_Location()
    }

    /**
     * 
     * @param {Geopoint} value 
     * @returns {HRESULT} 
     */
    put_Location(value) {
        if (!this.HasProp("__IMapIcon")) {
            if ((queryResult := this.QueryInterface(IMapIcon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapIcon := IMapIcon(outPtr)
        }

        return this.__IMapIcon.put_Location(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IMapIcon")) {
            if ((queryResult := this.QueryInterface(IMapIcon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapIcon := IMapIcon(outPtr)
        }

        return this.__IMapIcon.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__IMapIcon")) {
            if ((queryResult := this.QueryInterface(IMapIcon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapIcon := IMapIcon(outPtr)
        }

        return this.__IMapIcon.put_Title(value)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_NormalizedAnchorPoint() {
        if (!this.HasProp("__IMapIcon")) {
            if ((queryResult := this.QueryInterface(IMapIcon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapIcon := IMapIcon(outPtr)
        }

        return this.__IMapIcon.get_NormalizedAnchorPoint()
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_NormalizedAnchorPoint(value) {
        if (!this.HasProp("__IMapIcon")) {
            if ((queryResult := this.QueryInterface(IMapIcon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapIcon := IMapIcon(outPtr)
        }

        return this.__IMapIcon.put_NormalizedAnchorPoint(value)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Image() {
        if (!this.HasProp("__IMapIcon")) {
            if ((queryResult := this.QueryInterface(IMapIcon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapIcon := IMapIcon(outPtr)
        }

        return this.__IMapIcon.get_Image()
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_Image(value) {
        if (!this.HasProp("__IMapIcon")) {
            if ((queryResult := this.QueryInterface(IMapIcon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapIcon := IMapIcon(outPtr)
        }

        return this.__IMapIcon.put_Image(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CollisionBehaviorDesired() {
        if (!this.HasProp("__IMapIcon2")) {
            if ((queryResult := this.QueryInterface(IMapIcon2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapIcon2 := IMapIcon2(outPtr)
        }

        return this.__IMapIcon2.get_CollisionBehaviorDesired()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CollisionBehaviorDesired(value) {
        if (!this.HasProp("__IMapIcon2")) {
            if ((queryResult := this.QueryInterface(IMapIcon2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapIcon2 := IMapIcon2(outPtr)
        }

        return this.__IMapIcon2.put_CollisionBehaviorDesired(value)
    }

;@endregion Instance Methods
}
