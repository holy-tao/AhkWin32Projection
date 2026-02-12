#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IMapScene.ahk
#Include .\IMapSceneStatics.ahk
#Include ..\..\..\..\Foundation\TypedEventHandler.ahk
#Include .\MapScene.ahk
#Include .\MapTargetCameraChangedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a view of a map.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapscene
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapScene extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapScene

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapScene.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a scene to appear in a map based on a four-sided geographic area.
     * @remarks
     * This constructor is equivalent to calling [CreateFromBoundingBox(GeoboundingBox, Double, Double)](mapscene_createfromboundingbox_1417269839.md) with the following default parameter values: *headingInDegrees* = 0 (North) and *pitchInDegrees* = 0 (looking straight down). For more information, see the remarks section of the [CreateFromBoundingBox(GeoboundingBox, Double, Double)](mapscene_createfromboundingbox_1417269839.md) method.
     * @param {GeoboundingBox} bounds The four-sided geographic area to appear in the scene.
     * @returns {MapScene} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapscene.createfromboundingbox
     */
    static CreateFromBoundingBox(bounds) {
        if (!MapScene.HasProp("__IMapSceneStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapScene")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapSceneStatics.IID)
            MapScene.__IMapSceneStatics := IMapSceneStatics(factoryPtr)
        }

        return MapScene.__IMapSceneStatics.CreateFromBoundingBox(bounds)
    }

    /**
     * Creates a scene to appear in a map based on a four-sided geographic area.
     * @remarks
     * This constructor is equivalent to calling [CreateFromBoundingBox(GeoboundingBox, Double, Double)](mapscene_createfromboundingbox_1417269839.md) with the following default parameter values: *headingInDegrees* = 0 (North) and *pitchInDegrees* = 0 (looking straight down). For more information, see the remarks section of the [CreateFromBoundingBox(GeoboundingBox, Double, Double)](mapscene_createfromboundingbox_1417269839.md) method.
     * @param {GeoboundingBox} bounds The four-sided geographic area to appear in the scene.
     * @param {Float} headingInDegrees 
     * @param {Float} pitchInDegrees 
     * @returns {MapScene} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapscene.createfromboundingbox
     */
    static CreateFromBoundingBoxWithHeadingAndPitch(bounds, headingInDegrees, pitchInDegrees) {
        if (!MapScene.HasProp("__IMapSceneStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapScene")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapSceneStatics.IID)
            MapScene.__IMapSceneStatics := IMapSceneStatics(factoryPtr)
        }

        return MapScene.__IMapSceneStatics.CreateFromBoundingBoxWithHeadingAndPitch(bounds, headingInDegrees, pitchInDegrees)
    }

    /**
     * Creates a scene to appear in a map based on the position of the specified [MapCamera](mapcamera.md).
     * @remarks
     * The following image demonstrates the location of the map's camera relative to the scene.
     * 
     * <img src="images/MapControl_TechDiagram.png" alt="The relationship between MapCamera location and MapScene location relative to the map." />
     * @param {MapCamera} camera The current position of the specified camera.
     * @returns {MapScene} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapscene.createfromcamera
     */
    static CreateFromCamera(camera) {
        if (!MapScene.HasProp("__IMapSceneStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapScene")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapSceneStatics.IID)
            MapScene.__IMapSceneStatics := IMapSceneStatics(factoryPtr)
        }

        return MapScene.__IMapSceneStatics.CreateFromCamera(camera)
    }

    /**
     * Creates a scene to appear in a map based on a single geographic location.
     * @remarks
     * This constructor is equivalent to calling [CreateFromLocation(Geopoint, Double, Double)](mapscene_createfromlocation_1703638387.md) with the following default parameter values: *headingInDegrees* = 0 (North) and *pitchInDegrees* = 0 (looking straight down).
     * 
     * For more information, see the remarks section of the [CreateFromLocation(Geopoint, Double, Double)](mapscene_createfromlocation_1703638387.md) method.
     * @param {Geopoint} location_ The center of the scene.
     * @returns {MapScene} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapscene.createfromlocation
     */
    static CreateFromLocation(location_) {
        if (!MapScene.HasProp("__IMapSceneStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapScene")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapSceneStatics.IID)
            MapScene.__IMapSceneStatics := IMapSceneStatics(factoryPtr)
        }

        return MapScene.__IMapSceneStatics.CreateFromLocation(location_)
    }

    /**
     * Creates a scene to appear in a map based on a single geographic location.
     * @remarks
     * This constructor is equivalent to calling [CreateFromLocation(Geopoint, Double, Double)](mapscene_createfromlocation_1703638387.md) with the following default parameter values: *headingInDegrees* = 0 (North) and *pitchInDegrees* = 0 (looking straight down).
     * 
     * For more information, see the remarks section of the [CreateFromLocation(Geopoint, Double, Double)](mapscene_createfromlocation_1703638387.md) method.
     * @param {Geopoint} location_ The center of the scene.
     * @param {Float} headingInDegrees 
     * @param {Float} pitchInDegrees 
     * @returns {MapScene} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapscene.createfromlocation
     */
    static CreateFromLocationWithHeadingAndPitch(location_, headingInDegrees, pitchInDegrees) {
        if (!MapScene.HasProp("__IMapSceneStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapScene")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapSceneStatics.IID)
            MapScene.__IMapSceneStatics := IMapSceneStatics(factoryPtr)
        }

        return MapScene.__IMapSceneStatics.CreateFromLocationWithHeadingAndPitch(location_, headingInDegrees, pitchInDegrees)
    }

    /**
     * Creates a scene to appear in a map based on a single geographic location and radius.
     * @remarks
     * This constructor is equivalent to calling [CreateFromLocationAndRadius(Geopoint, Double, Double, Double)](mapscene_createfromlocationandradius_1545989472.md) with the following default parameter values: *headingInDegrees* = 0 (North) and *pitchInDegrees* = 0 (looking straight down). For more information, see the remarks section of the [CreateFromLocationAndRadius(Geopoint, Double, Double, Double)](mapscene_createfromlocationandradius_1545989472.md) method.
     * @param {Geopoint} location_ The center of the scene.
     * @param {Float} radiusInMeters The radius around the center to appear in the scene, in meters.
     * @returns {MapScene} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapscene.createfromlocationandradius
     */
    static CreateFromLocationAndRadius(location_, radiusInMeters) {
        if (!MapScene.HasProp("__IMapSceneStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapScene")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapSceneStatics.IID)
            MapScene.__IMapSceneStatics := IMapSceneStatics(factoryPtr)
        }

        return MapScene.__IMapSceneStatics.CreateFromLocationAndRadius(location_, radiusInMeters)
    }

    /**
     * Creates a scene to appear in a map based on a single geographic location and radius.
     * @remarks
     * This constructor is equivalent to calling [CreateFromLocationAndRadius(Geopoint, Double, Double, Double)](mapscene_createfromlocationandradius_1545989472.md) with the following default parameter values: *headingInDegrees* = 0 (North) and *pitchInDegrees* = 0 (looking straight down). For more information, see the remarks section of the [CreateFromLocationAndRadius(Geopoint, Double, Double, Double)](mapscene_createfromlocationandradius_1545989472.md) method.
     * @param {Geopoint} location_ The center of the scene.
     * @param {Float} radiusInMeters The radius around the center to appear in the scene, in meters.
     * @param {Float} headingInDegrees 
     * @param {Float} pitchInDegrees 
     * @returns {MapScene} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapscene.createfromlocationandradius
     */
    static CreateFromLocationAndRadiusWithHeadingAndPitch(location_, radiusInMeters, headingInDegrees, pitchInDegrees) {
        if (!MapScene.HasProp("__IMapSceneStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapScene")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapSceneStatics.IID)
            MapScene.__IMapSceneStatics := IMapSceneStatics(factoryPtr)
        }

        return MapScene.__IMapSceneStatics.CreateFromLocationAndRadiusWithHeadingAndPitch(location_, radiusInMeters, headingInDegrees, pitchInDegrees)
    }

    /**
     * Creates a scene to appear in a map based on multiple geographic locations.
     * @remarks
     * This constructor is equivalent to calling [CreateFromLocations(IIterable(Geopoint), Double, Double)](mapscene_createfromlocations_326810990.md) with the following default parameter values: *headingInDegrees* = 0 (North) and *pitchInDegrees* = 0 (looking straight down). For more information, see the [CreateFromLocations(IIterable(Geopoint), Double, Double)](mapscene_createfromlocations_326810990.md) method.
     * @param {IIterable<Geopoint>} locations The locations to appear in the scene.
     * @returns {MapScene} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapscene.createfromlocations
     */
    static CreateFromLocations(locations) {
        if (!MapScene.HasProp("__IMapSceneStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapScene")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapSceneStatics.IID)
            MapScene.__IMapSceneStatics := IMapSceneStatics(factoryPtr)
        }

        return MapScene.__IMapSceneStatics.CreateFromLocations(locations)
    }

    /**
     * Creates a scene to appear in a map based on multiple geographic locations.
     * @remarks
     * This constructor is equivalent to calling [CreateFromLocations(IIterable(Geopoint), Double, Double)](mapscene_createfromlocations_326810990.md) with the following default parameter values: *headingInDegrees* = 0 (North) and *pitchInDegrees* = 0 (looking straight down). For more information, see the [CreateFromLocations(IIterable(Geopoint), Double, Double)](mapscene_createfromlocations_326810990.md) method.
     * @param {IIterable<Geopoint>} locations The locations to appear in the scene.
     * @param {Float} headingInDegrees 
     * @param {Float} pitchInDegrees 
     * @returns {MapScene} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapscene.createfromlocations
     */
    static CreateFromLocationsWithHeadingAndPitch(locations, headingInDegrees, pitchInDegrees) {
        if (!MapScene.HasProp("__IMapSceneStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapScene")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapSceneStatics.IID)
            MapScene.__IMapSceneStatics := IMapSceneStatics(factoryPtr)
        }

        return MapScene.__IMapSceneStatics.CreateFromLocationsWithHeadingAndPitch(locations, headingInDegrees, pitchInDegrees)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the [MapCamera](mapcamera.md) settings that define the final position of the camera.
     * @remarks
     * During an animation of the map, the [ActualCamera](mapcontrol_actualcamera.md) defines the current position of the map's camera and [TargetCamera](mapcontrol_targetcamera.md) defines the final position of the camera.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapscene.targetcamera
     * @type {MapCamera} 
     */
    TargetCamera {
        get => this.get_TargetCamera()
    }

    /**
     * Occurs when the final position of the map's camera has changed.
     * @remarks
     * During an animation of the map, the [ActualCamera](mapcontrol_actualcamera.md) defines the current position of the map's camera and [TargetCamera](mapcontrol_targetcamera.md) defines the final position of the camera.
     * @type {TypedEventHandler<MapScene, MapTargetCameraChangedEventArgs>}
    */
    OnTargetCameraChanged {
        get {
            if(!this.HasProp("__OnTargetCameraChanged")){
                this.__OnTargetCameraChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{766ed4a8-e810-5f78-bc96-9aff9f58cfca}"),
                    MapScene,
                    MapTargetCameraChangedEventArgs
                )
                this.__OnTargetCameraChangedToken := this.add_TargetCameraChanged(this.__OnTargetCameraChanged.iface)
            }
            return this.__OnTargetCameraChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnTargetCameraChangedToken")) {
            this.remove_TargetCameraChanged(this.__OnTargetCameraChangedToken)
            this.__OnTargetCameraChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {MapCamera} 
     */
    get_TargetCamera() {
        if (!this.HasProp("__IMapScene")) {
            if ((queryResult := this.QueryInterface(IMapScene.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapScene := IMapScene(outPtr)
        }

        return this.__IMapScene.get_TargetCamera()
    }

    /**
     * 
     * @param {TypedEventHandler<MapScene, MapTargetCameraChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TargetCameraChanged(handler) {
        if (!this.HasProp("__IMapScene")) {
            if ((queryResult := this.QueryInterface(IMapScene.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapScene := IMapScene(outPtr)
        }

        return this.__IMapScene.add_TargetCameraChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TargetCameraChanged(token) {
        if (!this.HasProp("__IMapScene")) {
            if ((queryResult := this.QueryInterface(IMapScene.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapScene := IMapScene(outPtr)
        }

        return this.__IMapScene.remove_TargetCameraChanged(token)
    }

;@endregion Instance Methods
}
