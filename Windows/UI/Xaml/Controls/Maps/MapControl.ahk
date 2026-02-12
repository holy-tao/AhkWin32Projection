#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Control.ahk
#Include .\IMapControl.ahk
#Include .\IMapControl2.ahk
#Include .\IMapControl3.ahk
#Include .\IMapControl4.ahk
#Include .\IMapControl5.ahk
#Include .\IMapControl6.ahk
#Include .\IMapControl7.ahk
#Include .\IMapControl8.ahk
#Include .\IMapControlStatics6.ahk
#Include .\IMapControlStatics5.ahk
#Include .\IMapControlStatics4.ahk
#Include .\IMapControlStatics8.ahk
#Include .\IMapControlStatics2.ahk
#Include .\IMapControlStatics.ahk
#Include .\IMapControlStatics7.ahk
#Include ..\..\..\..\Foundation\TypedEventHandler.ahk
#Include .\MapControl.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\MapInputEventArgs.ahk
#Include .\MapElementClickEventArgs.ahk
#Include .\MapElementPointerEnteredEventArgs.ahk
#Include .\MapElementPointerExitedEventArgs.ahk
#Include .\MapActualCameraChangedEventArgs.ahk
#Include .\MapActualCameraChangingEventArgs.ahk
#Include .\MapTargetCameraChangedEventArgs.ahk
#Include .\MapCustomExperienceChangedEventArgs.ahk
#Include .\MapRightTappedEventArgs.ahk
#Include .\MapContextRequestedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * [Deprecated - see Remarks.] Represents a symbolic or photorealistic map of the Earth.
 * @remarks
 * > [!IMPORTANT]
 * > The UWP MapControl and Windows Maps platform APIs ([Windows.Services.Maps](../windows.services.maps/windows_services_maps.md)) are deprecated and may not be available in future versions of Windows. For more information, see [Resources for deprecated features](/windows/whats-new/deprecated-features-resources#windows-uwp-map-control-and-windows-maps-platform-apis).
 * 
 * > [!IMPORTANT]
 * > **Bing Maps for Enterprise service retirement**
 * >
 * > The UWP MapControl and map services from the [Windows.Services.Maps](../windows.services.maps/windows_services_maps.md) namespaces rely on Bing Maps. Bing Maps for Enterprise is deprecated and will be retired, at which point the MapControl and services will no longer receive data.
 * >
 * > For more information, see the [Bing Maps Developer Center](https://www.bingmapsportal.com/) and [Bing Maps documentation](/bingmaps/getting-started/).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapControl extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapControl.IID

    /**
     * Identifies the [Layers](mapcontrol_layers.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.layersproperty
     * @type {DependencyProperty} 
     */
    static LayersProperty {
        get => MapControl.get_LayersProperty()
    }

    /**
     * Identifies the [MapProjection](mapcontrol_mapprojection.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.mapprojectionproperty
     * @type {DependencyProperty} 
     */
    static MapProjectionProperty {
        get => MapControl.get_MapProjectionProperty()
    }

    /**
     * Identifies the [StyleSheet](mapcontrol_stylesheet.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.stylesheetproperty
     * @type {DependencyProperty} 
     */
    static StyleSheetProperty {
        get => MapControl.get_StyleSheetProperty()
    }

    /**
     * Identifies the [ViewPadding](mapcontrol_viewpadding.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.viewpaddingproperty
     * @type {DependencyProperty} 
     */
    static ViewPaddingProperty {
        get => MapControl.get_ViewPaddingProperty()
    }

    /**
     * This property is not implemented.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.businesslandmarksenabledproperty
     * @type {DependencyProperty} 
     */
    static BusinessLandmarksEnabledProperty {
        get => MapControl.get_BusinessLandmarksEnabledProperty()
    }

    /**
     * This property is not implemented.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.transitfeaturesenabledproperty
     * @type {DependencyProperty} 
     */
    static TransitFeaturesEnabledProperty {
        get => MapControl.get_TransitFeaturesEnabledProperty()
    }

    /**
     * Identifies the [CanTiltDown](mapcontrol_cantiltdown.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.cantiltdownproperty
     * @type {DependencyProperty} 
     */
    static CanTiltDownProperty {
        get => MapControl.get_CanTiltDownProperty()
    }

    /**
     * Identifies the [CanTiltUp](mapcontrol_cantiltup.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.cantiltupproperty
     * @type {DependencyProperty} 
     */
    static CanTiltUpProperty {
        get => MapControl.get_CanTiltUpProperty()
    }

    /**
     * Identifies the [CanZoomIn](mapcontrol_canzoomin.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.canzoominproperty
     * @type {DependencyProperty} 
     */
    static CanZoomInProperty {
        get => MapControl.get_CanZoomInProperty()
    }

    /**
     * Identifies the [CanZoomOut](mapcontrol_canzoomout.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.canzoomoutproperty
     * @type {DependencyProperty} 
     */
    static CanZoomOutProperty {
        get => MapControl.get_CanZoomOutProperty()
    }

    /**
     * Identifies the [BusinessLandmarksVisible](mapcontrol_businesslandmarksvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.businesslandmarksvisibleproperty
     * @type {DependencyProperty} 
     */
    static BusinessLandmarksVisibleProperty {
        get => MapControl.get_BusinessLandmarksVisibleProperty()
    }

    /**
     * Identifies the [TransitFeaturesVisible](mapcontrol_transitfeaturesvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.transitfeaturesvisibleproperty
     * @type {DependencyProperty} 
     */
    static TransitFeaturesVisibleProperty {
        get => MapControl.get_TransitFeaturesVisibleProperty()
    }

    /**
     * Identifies the [PanInteractionMode](mapcontrol_paninteractionmode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.paninteractionmodeproperty
     * @type {DependencyProperty} 
     */
    static PanInteractionModeProperty {
        get => MapControl.get_PanInteractionModeProperty()
    }

    /**
     * Identifies the [RotateInteractionMode](mapcontrol_rotateinteractionmode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.rotateinteractionmodeproperty
     * @type {DependencyProperty} 
     */
    static RotateInteractionModeProperty {
        get => MapControl.get_RotateInteractionModeProperty()
    }

    /**
     * Identifies the [TiltInteractionMode](mapcontrol_tiltinteractionmode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.tiltinteractionmodeproperty
     * @type {DependencyProperty} 
     */
    static TiltInteractionModeProperty {
        get => MapControl.get_TiltInteractionModeProperty()
    }

    /**
     * Identifies the [ZoomInteractionMode](mapcontrol_zoominteractionmode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.zoominteractionmodeproperty
     * @type {DependencyProperty} 
     */
    static ZoomInteractionModeProperty {
        get => MapControl.get_ZoomInteractionModeProperty()
    }

    /**
     * Identifies the [Is3DSupported](mapcontrol_is3dsupported.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.is3dsupportedproperty
     * @type {DependencyProperty} 
     */
    static Is3DSupportedProperty {
        get => MapControl.get_Is3DSupportedProperty()
    }

    /**
     * Identifies the [IsStreetsideSupported](mapcontrol_isstreetsidesupported.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.isstreetsidesupportedproperty
     * @type {DependencyProperty} 
     */
    static IsStreetsideSupportedProperty {
        get => MapControl.get_IsStreetsideSupportedProperty()
    }

    /**
     * Identifies the [Scene](mapcontrol_scene.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.sceneproperty
     * @type {DependencyProperty} 
     */
    static SceneProperty {
        get => MapControl.get_SceneProperty()
    }

    /**
     * Identifies the [Center](mapcontrol_center.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.centerproperty
     * @type {DependencyProperty} 
     */
    static CenterProperty {
        get => MapControl.get_CenterProperty()
    }

    /**
     * Identifies the [Children](mapcontrol_children.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.childrenproperty
     * @type {DependencyProperty} 
     */
    static ChildrenProperty {
        get => MapControl.get_ChildrenProperty()
    }

    /**
     * Identifies the [ColorScheme](mapcontrol_colorscheme.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.colorschemeproperty
     * @type {DependencyProperty} 
     */
    static ColorSchemeProperty {
        get => MapControl.get_ColorSchemeProperty()
    }

    /**
     * Identifies the [DesiredPitch](mapcontrol_desiredpitch.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.desiredpitchproperty
     * @type {DependencyProperty} 
     */
    static DesiredPitchProperty {
        get => MapControl.get_DesiredPitchProperty()
    }

    /**
     * Identifies the [Heading](mapcontrol_heading.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.headingproperty
     * @type {DependencyProperty} 
     */
    static HeadingProperty {
        get => MapControl.get_HeadingProperty()
    }

    /**
     * Identifies the [LandmarksVisible](mapcontrol_landmarksvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.landmarksvisibleproperty
     * @type {DependencyProperty} 
     */
    static LandmarksVisibleProperty {
        get => MapControl.get_LandmarksVisibleProperty()
    }

    /**
     * Identifies the [LoadingStatus](mapcontrol_loadingstatus.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.loadingstatusproperty
     * @type {DependencyProperty} 
     */
    static LoadingStatusProperty {
        get => MapControl.get_LoadingStatusProperty()
    }

    /**
     * Identifies the [MapServiceToken](mapcontrol_mapservicetoken.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.mapservicetokenproperty
     * @type {DependencyProperty} 
     */
    static MapServiceTokenProperty {
        get => MapControl.get_MapServiceTokenProperty()
    }

    /**
     * Identifies the [PedestrianFeaturesVisible](mapcontrol_pedestrianfeaturesvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.pedestrianfeaturesvisibleproperty
     * @type {DependencyProperty} 
     */
    static PedestrianFeaturesVisibleProperty {
        get => MapControl.get_PedestrianFeaturesVisibleProperty()
    }

    /**
     * Identifies the [Pitch](mapcontrol_pitch.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.pitchproperty
     * @type {DependencyProperty} 
     */
    static PitchProperty {
        get => MapControl.get_PitchProperty()
    }

    /**
     * Identifies the [Style](mapcontrol_style.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.styleproperty
     * @type {DependencyProperty} 
     */
    static StyleProperty {
        get => MapControl.get_StyleProperty()
    }

    /**
     * Identifies the [TrafficFlowVisible](mapcontrol_trafficflowvisible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.trafficflowvisibleproperty
     * @type {DependencyProperty} 
     */
    static TrafficFlowVisibleProperty {
        get => MapControl.get_TrafficFlowVisibleProperty()
    }

    /**
     * Identifies the [TransformOrigin](mapcontrol_transformorigin.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.transformoriginproperty
     * @type {DependencyProperty} 
     */
    static TransformOriginProperty {
        get => MapControl.get_TransformOriginProperty()
    }

    /**
     * Identifies the [WatermarkMode](mapcontrol_watermarkmode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.watermarkmodeproperty
     * @type {DependencyProperty} 
     */
    static WatermarkModeProperty {
        get => MapControl.get_WatermarkModeProperty()
    }

    /**
     * Identifies the [ZoomLevel](mapcontrol_zoomlevel.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.zoomlevelproperty
     * @type {DependencyProperty} 
     */
    static ZoomLevelProperty {
        get => MapControl.get_ZoomLevelProperty()
    }

    /**
     * Identifies the [MapElements](mapcontrol_mapelements.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.mapelementsproperty
     * @type {DependencyProperty} 
     */
    static MapElementsProperty {
        get => MapControl.get_MapElementsProperty()
    }

    /**
     * Identifies the [Routes](mapcontrol_routes.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.routesproperty
     * @type {DependencyProperty} 
     */
    static RoutesProperty {
        get => MapControl.get_RoutesProperty()
    }

    /**
     * Identifies the [TileSources](mapcontrol_tilesources.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.tilesourcesproperty
     * @type {DependencyProperty} 
     */
    static TileSourcesProperty {
        get => MapControl.get_TileSourcesProperty()
    }

    /**
     * Identifies the [MapControl.Location](mapcontrol_location.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.locationproperty
     * @type {DependencyProperty} 
     */
    static LocationProperty {
        get => MapControl.get_LocationProperty()
    }

    /**
     * Identifies the [MapControl.NormalizedAnchorPoint](mapcontrol_normalizedanchorpoint.md) XAML attached property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.normalizedanchorpointproperty
     * @type {DependencyProperty} 
     */
    static NormalizedAnchorPointProperty {
        get => MapControl.get_NormalizedAnchorPointProperty()
    }

    /**
     * Identifies the [Region](mapcontrol_region.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.regionproperty
     * @type {DependencyProperty} 
     */
    static RegionProperty {
        get => MapControl.get_RegionProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LayersProperty() {
        if (!MapControl.HasProp("__IMapControlStatics6")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics6.IID)
            MapControl.__IMapControlStatics6 := IMapControlStatics6(factoryPtr)
        }

        return MapControl.__IMapControlStatics6.get_LayersProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MapProjectionProperty() {
        if (!MapControl.HasProp("__IMapControlStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics5.IID)
            MapControl.__IMapControlStatics5 := IMapControlStatics5(factoryPtr)
        }

        return MapControl.__IMapControlStatics5.get_MapProjectionProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StyleSheetProperty() {
        if (!MapControl.HasProp("__IMapControlStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics5.IID)
            MapControl.__IMapControlStatics5 := IMapControlStatics5(factoryPtr)
        }

        return MapControl.__IMapControlStatics5.get_StyleSheetProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ViewPaddingProperty() {
        if (!MapControl.HasProp("__IMapControlStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics5.IID)
            MapControl.__IMapControlStatics5 := IMapControlStatics5(factoryPtr)
        }

        return MapControl.__IMapControlStatics5.get_ViewPaddingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BusinessLandmarksEnabledProperty() {
        if (!MapControl.HasProp("__IMapControlStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics4.IID)
            MapControl.__IMapControlStatics4 := IMapControlStatics4(factoryPtr)
        }

        return MapControl.__IMapControlStatics4.get_BusinessLandmarksEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TransitFeaturesEnabledProperty() {
        if (!MapControl.HasProp("__IMapControlStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics4.IID)
            MapControl.__IMapControlStatics4 := IMapControlStatics4(factoryPtr)
        }

        return MapControl.__IMapControlStatics4.get_TransitFeaturesEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CanTiltDownProperty() {
        if (!MapControl.HasProp("__IMapControlStatics8")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics8.IID)
            MapControl.__IMapControlStatics8 := IMapControlStatics8(factoryPtr)
        }

        return MapControl.__IMapControlStatics8.get_CanTiltDownProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CanTiltUpProperty() {
        if (!MapControl.HasProp("__IMapControlStatics8")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics8.IID)
            MapControl.__IMapControlStatics8 := IMapControlStatics8(factoryPtr)
        }

        return MapControl.__IMapControlStatics8.get_CanTiltUpProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CanZoomInProperty() {
        if (!MapControl.HasProp("__IMapControlStatics8")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics8.IID)
            MapControl.__IMapControlStatics8 := IMapControlStatics8(factoryPtr)
        }

        return MapControl.__IMapControlStatics8.get_CanZoomInProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CanZoomOutProperty() {
        if (!MapControl.HasProp("__IMapControlStatics8")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics8.IID)
            MapControl.__IMapControlStatics8 := IMapControlStatics8(factoryPtr)
        }

        return MapControl.__IMapControlStatics8.get_CanZoomOutProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BusinessLandmarksVisibleProperty() {
        if (!MapControl.HasProp("__IMapControlStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics2.IID)
            MapControl.__IMapControlStatics2 := IMapControlStatics2(factoryPtr)
        }

        return MapControl.__IMapControlStatics2.get_BusinessLandmarksVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TransitFeaturesVisibleProperty() {
        if (!MapControl.HasProp("__IMapControlStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics2.IID)
            MapControl.__IMapControlStatics2 := IMapControlStatics2(factoryPtr)
        }

        return MapControl.__IMapControlStatics2.get_TransitFeaturesVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PanInteractionModeProperty() {
        if (!MapControl.HasProp("__IMapControlStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics2.IID)
            MapControl.__IMapControlStatics2 := IMapControlStatics2(factoryPtr)
        }

        return MapControl.__IMapControlStatics2.get_PanInteractionModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RotateInteractionModeProperty() {
        if (!MapControl.HasProp("__IMapControlStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics2.IID)
            MapControl.__IMapControlStatics2 := IMapControlStatics2(factoryPtr)
        }

        return MapControl.__IMapControlStatics2.get_RotateInteractionModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TiltInteractionModeProperty() {
        if (!MapControl.HasProp("__IMapControlStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics2.IID)
            MapControl.__IMapControlStatics2 := IMapControlStatics2(factoryPtr)
        }

        return MapControl.__IMapControlStatics2.get_TiltInteractionModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ZoomInteractionModeProperty() {
        if (!MapControl.HasProp("__IMapControlStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics2.IID)
            MapControl.__IMapControlStatics2 := IMapControlStatics2(factoryPtr)
        }

        return MapControl.__IMapControlStatics2.get_ZoomInteractionModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_Is3DSupportedProperty() {
        if (!MapControl.HasProp("__IMapControlStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics2.IID)
            MapControl.__IMapControlStatics2 := IMapControlStatics2(factoryPtr)
        }

        return MapControl.__IMapControlStatics2.get_Is3DSupportedProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsStreetsideSupportedProperty() {
        if (!MapControl.HasProp("__IMapControlStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics2.IID)
            MapControl.__IMapControlStatics2 := IMapControlStatics2(factoryPtr)
        }

        return MapControl.__IMapControlStatics2.get_IsStreetsideSupportedProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SceneProperty() {
        if (!MapControl.HasProp("__IMapControlStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics2.IID)
            MapControl.__IMapControlStatics2 := IMapControlStatics2(factoryPtr)
        }

        return MapControl.__IMapControlStatics2.get_SceneProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CenterProperty() {
        if (!MapControl.HasProp("__IMapControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics.IID)
            MapControl.__IMapControlStatics := IMapControlStatics(factoryPtr)
        }

        return MapControl.__IMapControlStatics.get_CenterProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ChildrenProperty() {
        if (!MapControl.HasProp("__IMapControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics.IID)
            MapControl.__IMapControlStatics := IMapControlStatics(factoryPtr)
        }

        return MapControl.__IMapControlStatics.get_ChildrenProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ColorSchemeProperty() {
        if (!MapControl.HasProp("__IMapControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics.IID)
            MapControl.__IMapControlStatics := IMapControlStatics(factoryPtr)
        }

        return MapControl.__IMapControlStatics.get_ColorSchemeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DesiredPitchProperty() {
        if (!MapControl.HasProp("__IMapControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics.IID)
            MapControl.__IMapControlStatics := IMapControlStatics(factoryPtr)
        }

        return MapControl.__IMapControlStatics.get_DesiredPitchProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeadingProperty() {
        if (!MapControl.HasProp("__IMapControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics.IID)
            MapControl.__IMapControlStatics := IMapControlStatics(factoryPtr)
        }

        return MapControl.__IMapControlStatics.get_HeadingProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LandmarksVisibleProperty() {
        if (!MapControl.HasProp("__IMapControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics.IID)
            MapControl.__IMapControlStatics := IMapControlStatics(factoryPtr)
        }

        return MapControl.__IMapControlStatics.get_LandmarksVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LoadingStatusProperty() {
        if (!MapControl.HasProp("__IMapControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics.IID)
            MapControl.__IMapControlStatics := IMapControlStatics(factoryPtr)
        }

        return MapControl.__IMapControlStatics.get_LoadingStatusProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MapServiceTokenProperty() {
        if (!MapControl.HasProp("__IMapControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics.IID)
            MapControl.__IMapControlStatics := IMapControlStatics(factoryPtr)
        }

        return MapControl.__IMapControlStatics.get_MapServiceTokenProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PedestrianFeaturesVisibleProperty() {
        if (!MapControl.HasProp("__IMapControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics.IID)
            MapControl.__IMapControlStatics := IMapControlStatics(factoryPtr)
        }

        return MapControl.__IMapControlStatics.get_PedestrianFeaturesVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PitchProperty() {
        if (!MapControl.HasProp("__IMapControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics.IID)
            MapControl.__IMapControlStatics := IMapControlStatics(factoryPtr)
        }

        return MapControl.__IMapControlStatics.get_PitchProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StyleProperty() {
        if (!MapControl.HasProp("__IMapControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics.IID)
            MapControl.__IMapControlStatics := IMapControlStatics(factoryPtr)
        }

        return MapControl.__IMapControlStatics.get_StyleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TrafficFlowVisibleProperty() {
        if (!MapControl.HasProp("__IMapControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics.IID)
            MapControl.__IMapControlStatics := IMapControlStatics(factoryPtr)
        }

        return MapControl.__IMapControlStatics.get_TrafficFlowVisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TransformOriginProperty() {
        if (!MapControl.HasProp("__IMapControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics.IID)
            MapControl.__IMapControlStatics := IMapControlStatics(factoryPtr)
        }

        return MapControl.__IMapControlStatics.get_TransformOriginProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_WatermarkModeProperty() {
        if (!MapControl.HasProp("__IMapControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics.IID)
            MapControl.__IMapControlStatics := IMapControlStatics(factoryPtr)
        }

        return MapControl.__IMapControlStatics.get_WatermarkModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ZoomLevelProperty() {
        if (!MapControl.HasProp("__IMapControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics.IID)
            MapControl.__IMapControlStatics := IMapControlStatics(factoryPtr)
        }

        return MapControl.__IMapControlStatics.get_ZoomLevelProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MapElementsProperty() {
        if (!MapControl.HasProp("__IMapControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics.IID)
            MapControl.__IMapControlStatics := IMapControlStatics(factoryPtr)
        }

        return MapControl.__IMapControlStatics.get_MapElementsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RoutesProperty() {
        if (!MapControl.HasProp("__IMapControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics.IID)
            MapControl.__IMapControlStatics := IMapControlStatics(factoryPtr)
        }

        return MapControl.__IMapControlStatics.get_RoutesProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TileSourcesProperty() {
        if (!MapControl.HasProp("__IMapControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics.IID)
            MapControl.__IMapControlStatics := IMapControlStatics(factoryPtr)
        }

        return MapControl.__IMapControlStatics.get_TileSourcesProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LocationProperty() {
        if (!MapControl.HasProp("__IMapControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics.IID)
            MapControl.__IMapControlStatics := IMapControlStatics(factoryPtr)
        }

        return MapControl.__IMapControlStatics.get_LocationProperty()
    }

    /**
     * Gets the value of the [MapControl.Location](mapcontrol_location.md) XAML attached property from the specified child element of a [MapControl](mapcontrol.md). The location is the geographic location on the [MapControl](mapcontrol.md) at which the [MapControl.NormalizedAnchorPoint](mapcontrol_location.md) of the child element is positioned.
     * @param {DependencyObject} element The element from which to read the property value.
     * @returns {Geopoint} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.getlocation
     */
    static GetLocation(element) {
        if (!MapControl.HasProp("__IMapControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics.IID)
            MapControl.__IMapControlStatics := IMapControlStatics(factoryPtr)
        }

        return MapControl.__IMapControlStatics.GetLocation(element)
    }

    /**
     * Sets the value of the [MapControl.Location](mapcontrol_location.md) XAML attached property on the specified child element of a [MapControl](mapcontrol.md). The location is the geographic location on the [MapControl](mapcontrol.md) at which the [MapControl.NormalizedAnchorPoint](mapcontrol_location.md) of the child element is positioned.
     * @param {DependencyObject} element The element on which to set the property value.
     * @param {Geopoint} value The value of the [MapControl.Location](mapcontrol_location.md) XAML attached property to set on the specified child element of a [MapControl](mapcontrol.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.setlocation
     */
    static SetLocation(element, value) {
        if (!MapControl.HasProp("__IMapControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics.IID)
            MapControl.__IMapControlStatics := IMapControlStatics(factoryPtr)
        }

        return MapControl.__IMapControlStatics.SetLocation(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_NormalizedAnchorPointProperty() {
        if (!MapControl.HasProp("__IMapControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics.IID)
            MapControl.__IMapControlStatics := IMapControlStatics(factoryPtr)
        }

        return MapControl.__IMapControlStatics.get_NormalizedAnchorPointProperty()
    }

    /**
     * Gets the value of the [MapControl.NormalizedAnchorPoint](mapcontrol_normalizedanchorpoint.md) XAML attached property from the specified child element of a [MapControl](mapcontrol.md). The anchor point is the point on the child element that is positioned at the point on the [MapControl](mapcontrol.md) specified by the [MapControl.Location](mapcontrol_normalizedanchorpoint.md) attached property.
     * @param {DependencyObject} element The element from which to read the property value.
     * @returns {POINT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.getnormalizedanchorpoint
     */
    static GetNormalizedAnchorPoint(element) {
        if (!MapControl.HasProp("__IMapControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics.IID)
            MapControl.__IMapControlStatics := IMapControlStatics(factoryPtr)
        }

        return MapControl.__IMapControlStatics.GetNormalizedAnchorPoint(element)
    }

    /**
     * Sets the value of the [MapControl.NormalizedAnchorPoint](mapcontrol_normalizedanchorpoint.md) XAML attached property on the specified child element of a [MapControl](mapcontrol.md). The anchor point is the point on the child element that is positioned at the point on the [MapControl](mapcontrol.md) specified by the [MapControl.Location](mapcontrol_normalizedanchorpoint.md) attached property.
     * @param {DependencyObject} element The element on which to set the property value.
     * @param {POINT} value The value of the [MapControl.NormalizedAnchorPoint](mapcontrol_normalizedanchorpoint.md) XAML attached property to set on the specified child element of a [MapControl](mapcontrol.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.setnormalizedanchorpoint
     */
    static SetNormalizedAnchorPoint(element, value) {
        if (!MapControl.HasProp("__IMapControlStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics.IID)
            MapControl.__IMapControlStatics := IMapControlStatics(factoryPtr)
        }

        return MapControl.__IMapControlStatics.SetNormalizedAnchorPoint(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RegionProperty() {
        if (!MapControl.HasProp("__IMapControlStatics7")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlStatics7.IID)
            MapControl.__IMapControlStatics7 := IMapControlStatics7(factoryPtr)
        }

        return MapControl.__IMapControlStatics7.get_RegionProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the center of the map.
     * @remarks
     * Since a string can't be converted to a [Geopoint](../windows.devices.geolocation/geopoint.md), you can't specify a value for the Center property in XAML markup unless you use data binding.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.center
     * @type {Geopoint} 
     */
    Center {
        get => this.get_Center()
        set => this.put_Center(value)
    }

    /**
     * Gets the collection of objects that are children of the [MapControl](mapcontrol.md).
     * @remarks
     * Display XAML user interface elements such as a [Button](../windows.ui.xaml.controls/button.md), a [HyperlinkButton](../windows.ui.xaml.controls/hyperlinkbutton.md), or a [TextBlock](../windows.ui.xaml.controls/textblock.md) by adding them as Children of the [MapControl](mapcontrol.md). You can also add them to the [MapItemsControl](mapitemscontrol.md), or bind the [MapItemsControl](mapitemscontrol.md) to an item or a collection of items.
     * 
     * Alternately, to display pushpins, images, and shapes on the [MapControl](mapcontrol.md), add them to its [MapElements](mapcontrol_mapelements.md) collection.
     * 
     * For more info, see [Display maps with 2D, 3D, and Streetside views](/windows/uwp/maps-and-location/display-maps).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.children
     * @type {IVector<DependencyObject>} 
     */
    Children {
        get => this.get_Children()
    }

    /**
     * Gets or sets the color scheme of the map – for example, light or dark.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.colorscheme
     * @type {Integer} 
     */
    ColorScheme {
        get => this.get_ColorScheme()
        set => this.put_ColorScheme(value)
    }

    /**
     * Gets or sets a value that indicates by how many degrees you want the map to be tilted. Sometimes the desired pitch cannot be set.
     * @remarks
     * For more information about pitch, see the remarks section of the [MapCamera(Geopoint, Double, Double, Double, Double)](mapcamera_mapcamera_1532703584.md) overload.
     * 
     * The maximum and minimum values of pitch/tilt depend on the type of map view: 2D, 3D, or Streetside.<table>
     *    <tr><th>Property</th><th>2D range</th><th>3D range</th><th>Streetside range</th></tr>
     *    <tr><td>DesiredPitch</td><td>0-75</td><td>0-90</td><td>0-180</td></tr>
     * </table>
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.desiredpitch
     * @type {Float} 
     */
    DesiredPitch {
        get => this.get_DesiredPitch()
        set => this.put_DesiredPitch(value)
    }

    /**
     * Gets or sets the directional heading of the map in degrees, where 0 or 360 = North, 90 = East, 180 = South, and 270 = West.
     * @remarks
     * Heading values greater than 360 degrees are normalized to their equivalent 0-360 degree value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.heading
     * @type {Float} 
     */
    Heading {
        get => this.get_Heading()
        set => this.put_Heading(value)
    }

    /**
     * Gets or sets a value that indicates whether 3D buildings are displayed on the map.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.landmarksvisible
     * @type {Boolean} 
     */
    LandmarksVisible {
        get => this.get_LandmarksVisible()
        set => this.put_LandmarksVisible(value)
    }

    /**
     * Gets the loading status of the map to be displayed in the [MapControl](mapcontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.loadingstatus
     * @type {Integer} 
     */
    LoadingStatus {
        get => this.get_LoadingStatus()
    }

    /**
     * [Deprecated - see Remarks.] Gets or sets the authentication key required for using the [MapControl](mapcontrol.md) and online mapping services.
     * @remarks
     * > [!IMPORTANT]
     * > **Bing Maps for Enterprise service retirement**
     * >
     * > The UWP [MapControl](mapcontrol.md) and map services from the [Windows.Services.Maps](../windows.services.maps/windows_services_maps.md) namespaces rely on Bing Maps. Bing Maps for Enterprise is deprecated and will be retired, at which point the MapControl and services will no longer receive data.
     * >
     * > For more information, see the [Bing Maps Developer Center](https://www.bingmapsportal.com/) and [Bing Maps documentation](/bingmaps/getting-started/).
     * 
     * Your app must be authenticated before it can use the [MapControl](mapcontrol.md) and map services in the [Windows.Services.Maps](../windows.services.maps/windows_services_maps.md) namespace. To authenticate your app, you must specify a maps authentication key.
     * 
     * See [Request a maps authentication key](/windows/uwp/maps-and-location/authentication-key).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.mapservicetoken
     * @type {HSTRING} 
     */
    MapServiceToken {
        get => this.get_MapServiceToken()
        set => this.put_MapServiceToken(value)
    }

    /**
     * Gets the maximum zoom level for the map.
     * @remarks
     * The maximum and minimum values of [ZoomLevel](mapcontrol_zoomlevel.md) depend on the type of map view: 2D, 3D, or Streetside.<table>
     *    <tr><th>Property</th><th>2D range</th><th>3D range</th><th>Streetside range</th></tr>
     *    <tr><td>ZoomLevel</td><td>1-20</td><td>1-20</td><td>24-26</td></tr>
     * </table>
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.maxzoomlevel
     * @type {Float} 
     */
    MaxZoomLevel {
        get => this.get_MaxZoomLevel()
    }

    /**
     * Gets the minimum zoom level for the map.
     * @remarks
     * See the remarks section of the [MaxZoomLevel](mapcontrol_maxzoomlevel.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.minzoomlevel
     * @type {Float} 
     */
    MinZoomLevel {
        get => this.get_MinZoomLevel()
    }

    /**
     * Gets or sets a value that indicates whether pedestrian features such as public stairs are displayed on the map.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.pedestrianfeaturesvisible
     * @type {Boolean} 
     */
    PedestrianFeaturesVisible {
        get => this.get_PedestrianFeaturesVisible()
        set => this.put_PedestrianFeaturesVisible(value)
    }

    /**
     * Gets the actual pitch of the map. Sometimes the pitch requested by setting the [DesiredPitch](mapcontrol_desiredpitch.md) property cannot be set.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.pitch
     * @type {Float} 
     */
    Pitch {
        get => this.get_Pitch()
    }

    /**
     * Specifies the style of the map - for example, a road map or an aerial map.
     * @remarks
     * > [!IMPORTANT]
     * > Aerial styles are not available when the network is disconnected from the internet.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.style
     * @type {Integer} 
     */
    Style {
        get => this.get_Style()
        set => this.put_Style(value)
    }

    /**
     * Gets or sets a value that indicates whether traffic conditions are displayed on the map.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.trafficflowvisible
     * @type {Boolean} 
     */
    TrafficFlowVisible {
        get => this.get_TrafficFlowVisible()
        set => this.put_TrafficFlowVisible(value)
    }

    /**
     * Gets or sets a point to which the logical center of the map is transformed.
     * @remarks
     * The TransformOrigin represents a point around which the map rotates – for example, when the user manipulates the map, or when you change the value of the [Heading](mapcontrol_heading.md) property. Consider setting the Y value of the TransformOrigin to a value greater than 0.5 when the map is tilted - that is, when the [Pitch](mapcontrol_pitch.md) is greater than 0. This moves the logical center closer to the user - that is, closer to the bottom of the screen - and shows the user more of what’s in the distance when the map is rotated.
     * 
     * After you set the value of the TransformOrigin property for the [MapControl](mapcontrol.md), the [Center](mapcontrol_center.md) property continues to return the previous center until you set the [Center](mapcontrol_center.md) to the same value as the TransformOrigin.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.transformorigin
     * @type {POINT} 
     */
    TransformOrigin {
        get => this.get_TransformOrigin()
        set => this.put_TransformOrigin(value)
    }

    /**
     * Gets or sets a value that determines when the watermark of the map is displayed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.watermarkmode
     * @type {Integer} 
     */
    WatermarkMode {
        get => this.get_WatermarkMode()
        set => this.put_WatermarkMode(value)
    }

    /**
     * Gets or sets the zoom level of the map, which is a value between 1 and 20 in 2D views.
     * @remarks
     * See the remarks section of the [TryZoomInAsync](mapcontrol_tryzoominasync_1251712457.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.zoomlevel
     * @type {Float} 
     */
    ZoomLevel {
        get => this.get_ZoomLevel()
        set => this.put_ZoomLevel(value)
    }

    /**
     * Gets the collection of [MapElement](mapelement.md) objects that are children of the [MapControl](mapcontrol.md).
     * @remarks
     * >[!Note]
     * In the Windows 10 Fall Creators Update, we recommend that you add [MapElement](mapelement.md) objects to a [MapElementsLayer](mapelementslayer.md) instead of adding them to the MapElements collection.
     * 
     * Display pushpins, images, and shapes on the [MapControl](mapcontrol.md) by adding them to its MapElements collection.
     * 
     * 
     * + Display an **image** such as a pushpin with optional text by using the [MapIcon](mapicon.md) class. Keep the default image or provide a custom image.
     * + Define and display a [MapPolygon](mappolygon.md) or a [MapPolyline](mappolyline.md).
     * Alternately, to display XAML elements on the [MapControl](mapcontrol.md), add them to its [Children](mapcontrol_children.md) collection.
     * 
     * For more info, see [Display maps with 2D, 3D, and Streetside views](/windows/uwp/maps-and-location/display-maps).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.mapelements
     * @type {IVector<MapElement>} 
     */
    MapElements {
        get => this.get_MapElements()
    }

    /**
     * Gets the collection of [MapRouteView](maprouteview.md) objects displayed on the map.
     * @remarks
     * To display a route on a map, construct a [MapRouteView](maprouteview.md) with the [MapRoute](../windows.services.maps/maproute.md) and add the [MapRouteView](maprouteview.md) to the Routes collection of the [MapControl](mapcontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.routes
     * @type {IVector<MapRouteView>} 
     */
    Routes {
        get => this.get_Routes()
    }

    /**
     * Gets or sets the collection of [MapTileSource](maptilesource.md) objects that are children of the [MapControl](mapcontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.tilesources
     * @type {IVector<MapTileSource>} 
     */
    TileSources {
        get => this.get_TileSources()
    }

    /**
     * Gets or sets a value that indicates whether businesses are displayed on the map.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.businesslandmarksvisible
     * @type {Boolean} 
     */
    BusinessLandmarksVisible {
        get => this.get_BusinessLandmarksVisible()
        set => this.put_BusinessLandmarksVisible(value)
    }

    /**
     * Gets or sets a value that indicates if transit features are displayed on the map.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.transitfeaturesvisible
     * @type {Boolean} 
     */
    TransitFeaturesVisible {
        get => this.get_TransitFeaturesVisible()
        set => this.put_TransitFeaturesVisible(value)
    }

    /**
     * Gets or sets a value that indicates if the pan gesture is recognized on the map.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.paninteractionmode
     * @type {Integer} 
     */
    PanInteractionMode {
        get => this.get_PanInteractionMode()
        set => this.put_PanInteractionMode(value)
    }

    /**
     * Gets or sets a value that indicates if the map responds to the rotate gesture and if the corresponding UI control appears on the map.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.rotateinteractionmode
     * @type {Integer} 
     */
    RotateInteractionMode {
        get => this.get_RotateInteractionMode()
        set => this.put_RotateInteractionMode(value)
    }

    /**
     * Gets or sets a value that indicates if the map responds to the tilt gesture and if the corresponding UI control appears on the map.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.tiltinteractionmode
     * @type {Integer} 
     */
    TiltInteractionMode {
        get => this.get_TiltInteractionMode()
        set => this.put_TiltInteractionMode(value)
    }

    /**
     * Gets or sets a value that indicates if the map responds to the zoom gesture and if the corresponding UI control appears on the map.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.zoominteractionmode
     * @type {Integer} 
     */
    ZoomInteractionMode {
        get => this.get_ZoomInteractionMode()
        set => this.put_ZoomInteractionMode(value)
    }

    /**
     * Gets a value that indicates if 3D is supported within the map.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.is3dsupported
     * @type {Boolean} 
     */
    Is3DSupported {
        get => this.get_Is3DSupported()
    }

    /**
     * Gets a value that indicates if Streetside is supported within the map.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.isstreetsidesupported
     * @type {Boolean} 
     */
    IsStreetsideSupported {
        get => this.get_IsStreetsideSupported()
    }

    /**
     * Gets or sets the [MapScene](mapscene.md) associated with this [MapControl](mapcontrol.md).
     * @remarks
     * Setting the scene is a synchronous operation, there is no animation involved.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.scene
     * @type {MapScene} 
     */
    Scene {
        get => this.get_Scene()
        set => this.put_Scene(value)
    }

    /**
     * Gets the [MapCamera](mapcamera.md) settings that define the current position of the camera.
     * @remarks
     * During an animation of the map, the ActualCamera defines the current position of the map's camera and [TargetCamera](mapcontrol_targetcamera.md) defines the final position of the camera.
     * 
     * The map's camera settings are updated whenever the view of the map is changed. For example, when updating the [Center](mapcontrol_center.md) property or calling the [TrySetSceneAsync](/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.trysetsceneasync) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.actualcamera
     * @type {MapCamera} 
     */
    ActualCamera {
        get => this.get_ActualCamera()
    }

    /**
     * Gets the [MapCamera](mapcamera.md) settings that define the final position of the camera.
     * @remarks
     * During an animation of the map, the [ActualCamera](mapcontrol_actualcamera.md) defines the current position of the map's camera and TargetCamera defines the final position of the camera.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.targetcamera
     * @type {MapCamera} 
     */
    TargetCamera {
        get => this.get_TargetCamera()
    }

    /**
     * Gets or sets a custom experience for the [MapControl](mapcontrol.md).
     * @remarks
     * A custom experience changes the way a map appears in the [MapControl](mapcontrol.md). For example, the [StreetsideExperience](streetsideexperience.md) changes the perspective of the map to appear as though you were viewing a location from the street level.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.customexperience
     * @type {MapCustomExperience} 
     */
    CustomExperience {
        get => this.get_CustomExperience()
        set => this.put_CustomExperience(value)
    }

    /**
     * This property is not implemented.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.businesslandmarksenabled
     * @type {Boolean} 
     */
    BusinessLandmarksEnabled {
        get => this.get_BusinessLandmarksEnabled()
        set => this.put_BusinessLandmarksEnabled(value)
    }

    /**
     * This property is not implemented.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.transitfeaturesenabled
     * @type {Boolean} 
     */
    TransitFeaturesEnabled {
        get => this.get_TransitFeaturesEnabled()
        set => this.put_TransitFeaturesEnabled(value)
    }

    /**
     * Gets or sets a [MapProjection](mapprojection.md) that specifies how to transform the latitudes and longitudes of the map.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.mapprojection
     * @type {Integer} 
     */
    MapProjection {
        get => this.get_MapProjection()
        set => this.put_MapProjection(value)
    }

    /**
     * Gets or sets an object that defines the style of the map control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.stylesheet
     * @type {MapStyleSheet} 
     */
    StyleSheet {
        get => this.get_StyleSheet()
        set => this.put_StyleSheet(value)
    }

    /**
     * Gets or sets the padding inside a map control.
     * @remarks
     * For more information about how this property behaves, see the [Control.Padding](../windows.ui.xaml.controls/control_padding.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.viewpadding
     * @type {Thickness} 
     */
    ViewPadding {
        get => this.get_ViewPadding()
        set => this.put_ViewPadding(value)
    }

    /**
     * Gets the collection of [MapLayer](maplayer.md) objects that are children of the [MapControl](mapcontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.layers
     * @type {IVector<MapLayer>} 
     */
    Layers {
        get => this.get_Layers()
        set => this.put_Layers(value)
    }

    /**
     * Gets or sets the region (for example, the state or province) of an address.
     * @remarks
     * You can use this property to show contents in a map control based on the language of a specific region. The default value of this property is null. If you don’t set this property, the map control shows contents based on the language of the user’s region. The region is usually defined in the system settings of the user’s PC or device.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.region
     * @type {HSTRING} 
     */
    Region {
        get => this.get_Region()
        set => this.put_Region(value)
    }

    /**
     * Gets a value indicating if the map can be tilted down
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.cantiltdown
     * @type {Boolean} 
     */
    CanTiltDown {
        get => this.get_CanTiltDown()
    }

    /**
     * Gets a value indicating if the map can be tilted up
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.cantiltup
     * @type {Boolean} 
     */
    CanTiltUp {
        get => this.get_CanTiltUp()
    }

    /**
     * Gets a value indicating if the map can be zoomed in
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.canzoomin
     * @type {Boolean} 
     */
    CanZoomIn {
        get => this.get_CanZoomIn()
    }

    /**
     * Gets a value indicating if the map can be zoomed out
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.canzoomout
     * @type {Boolean} 
     */
    CanZoomOut {
        get => this.get_CanZoomOut()
    }

    /**
     * Occurs when the value of the [Center](mapcontrol_center.md) property of the [MapControl](mapcontrol.md) changes.
     * @type {TypedEventHandler<MapControl, IInspectable>}
    */
    OnCenterChanged {
        get {
            if(!this.HasProp("__OnCenterChanged")){
                this.__OnCenterChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f250dd93-e636-51ef-bc93-ee78d431a6bd}"),
                    MapControl,
                    IInspectable
                )
                this.__OnCenterChangedToken := this.add_CenterChanged(this.__OnCenterChanged.iface)
            }
            return this.__OnCenterChanged
        }
    }

    /**
     * Occurs when the value of the [Heading](mapcontrol_heading.md) property of the [MapControl](mapcontrol.md) changes.
     * @type {TypedEventHandler<MapControl, IInspectable>}
    */
    OnHeadingChanged {
        get {
            if(!this.HasProp("__OnHeadingChanged")){
                this.__OnHeadingChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f250dd93-e636-51ef-bc93-ee78d431a6bd}"),
                    MapControl,
                    IInspectable
                )
                this.__OnHeadingChangedToken := this.add_HeadingChanged(this.__OnHeadingChanged.iface)
            }
            return this.__OnHeadingChanged
        }
    }

    /**
     * Occurs when the value of the [LoadingStatus](mapcontrol_loadingstatus.md) property of the [MapControl](mapcontrol.md) changes.
     * @type {TypedEventHandler<MapControl, IInspectable>}
    */
    OnLoadingStatusChanged {
        get {
            if(!this.HasProp("__OnLoadingStatusChanged")){
                this.__OnLoadingStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f250dd93-e636-51ef-bc93-ee78d431a6bd}"),
                    MapControl,
                    IInspectable
                )
                this.__OnLoadingStatusChangedToken := this.add_LoadingStatusChanged(this.__OnLoadingStatusChanged.iface)
            }
            return this.__OnLoadingStatusChanged
        }
    }

    /**
     * Occurs when the user double-taps the [MapControl](mapcontrol.md). An instance of [MapInputEventArgs](mapinputeventargs.md) provides data for this event.
     * @type {TypedEventHandler<MapControl, MapInputEventArgs>}
    */
    OnMapDoubleTapped {
        get {
            if(!this.HasProp("__OnMapDoubleTapped")){
                this.__OnMapDoubleTapped := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b92f6816-4d0a-52c2-9868-94b5c942007e}"),
                    MapControl,
                    MapInputEventArgs
                )
                this.__OnMapDoubleTappedToken := this.add_MapDoubleTapped(this.__OnMapDoubleTapped.iface)
            }
            return this.__OnMapDoubleTapped
        }
    }

    /**
     * Occurs when the user taps and holds on the [MapControl](mapcontrol.md). An instance of [MapInputEventArgs](mapinputeventargs.md) provides data for this event.
     * @type {TypedEventHandler<MapControl, MapInputEventArgs>}
    */
    OnMapHolding {
        get {
            if(!this.HasProp("__OnMapHolding")){
                this.__OnMapHolding := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b92f6816-4d0a-52c2-9868-94b5c942007e}"),
                    MapControl,
                    MapInputEventArgs
                )
                this.__OnMapHoldingToken := this.add_MapHolding(this.__OnMapHolding.iface)
            }
            return this.__OnMapHolding
        }
    }

    /**
     * Occurs when the user taps the [MapControl](mapcontrol.md) or clicks on it with the left mouse button. An instance of [MapInputEventArgs](mapinputeventargs.md) provides data for this event.
     * @type {TypedEventHandler<MapControl, MapInputEventArgs>}
    */
    OnMapTapped {
        get {
            if(!this.HasProp("__OnMapTapped")){
                this.__OnMapTapped := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b92f6816-4d0a-52c2-9868-94b5c942007e}"),
                    MapControl,
                    MapInputEventArgs
                )
                this.__OnMapTappedToken := this.add_MapTapped(this.__OnMapTapped.iface)
            }
            return this.__OnMapTapped
        }
    }

    /**
     * Occurs when the value of the [Pitch](mapcontrol_pitch.md) property of the [MapControl](mapcontrol.md) changes.
     * @type {TypedEventHandler<MapControl, IInspectable>}
    */
    OnPitchChanged {
        get {
            if(!this.HasProp("__OnPitchChanged")){
                this.__OnPitchChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f250dd93-e636-51ef-bc93-ee78d431a6bd}"),
                    MapControl,
                    IInspectable
                )
                this.__OnPitchChangedToken := this.add_PitchChanged(this.__OnPitchChanged.iface)
            }
            return this.__OnPitchChanged
        }
    }

    /**
     * Occurs when the value of the [TransformOrigin](mapcontrol_transformorigin.md) property of the [MapControl](mapcontrol.md) changes.
     * @type {TypedEventHandler<MapControl, IInspectable>}
    */
    OnTransformOriginChanged {
        get {
            if(!this.HasProp("__OnTransformOriginChanged")){
                this.__OnTransformOriginChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f250dd93-e636-51ef-bc93-ee78d431a6bd}"),
                    MapControl,
                    IInspectable
                )
                this.__OnTransformOriginChangedToken := this.add_TransformOriginChanged(this.__OnTransformOriginChanged.iface)
            }
            return this.__OnTransformOriginChanged
        }
    }

    /**
     * Occurs when the value of the [ZoomLevel](mapcontrol_zoomlevel.md) property of the [MapControl](mapcontrol.md) changes.
     * @type {TypedEventHandler<MapControl, IInspectable>}
    */
    OnZoomLevelChanged {
        get {
            if(!this.HasProp("__OnZoomLevelChanged")){
                this.__OnZoomLevelChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f250dd93-e636-51ef-bc93-ee78d431a6bd}"),
                    MapControl,
                    IInspectable
                )
                this.__OnZoomLevelChangedToken := this.add_ZoomLevelChanged(this.__OnZoomLevelChanged.iface)
            }
            return this.__OnZoomLevelChanged
        }
    }

    /**
     * Occurs when the user taps or clicks a [MapElement](mapelement.md) on the [MapControl](mapcontrol.md).
     * @remarks
     * Touch, mouse, and pen/stylus interactions are received, processed, and managed as pointers. Any of these devices and their interactions can produce a MapElementClick event. An instance of [MapElementClickEventArgs](mapelementclickeventargs.md) provides data for this event.
     * @type {TypedEventHandler<MapControl, MapElementClickEventArgs>}
    */
    OnMapElementClick {
        get {
            if(!this.HasProp("__OnMapElementClick")){
                this.__OnMapElementClick := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4c7821a1-d570-597d-acc7-068853c4ab27}"),
                    MapControl,
                    MapElementClickEventArgs
                )
                this.__OnMapElementClickToken := this.add_MapElementClick(this.__OnMapElementClick.iface)
            }
            return this.__OnMapElementClick
        }
    }

    /**
     * Occurs when a pointer moves into the bounding area of a [MapElement](mapelement.md) on a [MapControl](mapcontrol.md).
     * @remarks
     * Mouse interactions are received, processed, and managed as pointers. The MapElementPointerEntered event is triggered as the user moves their mouse over an element. An instance of [MapElementPointerEnteredEventArgs](mapelementpointerenteredeventargs.md) provides data for this event.
     * @type {TypedEventHandler<MapControl, MapElementPointerEnteredEventArgs>}
    */
    OnMapElementPointerEntered {
        get {
            if(!this.HasProp("__OnMapElementPointerEntered")){
                this.__OnMapElementPointerEntered := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ca2638e5-7c33-5b90-9b66-273731fc7091}"),
                    MapControl,
                    MapElementPointerEnteredEventArgs
                )
                this.__OnMapElementPointerEnteredToken := this.add_MapElementPointerEntered(this.__OnMapElementPointerEntered.iface)
            }
            return this.__OnMapElementPointerEntered
        }
    }

    /**
     * Occurs when a pointer moves out of the bounding area of a [MapElement](mapelement.md) on a [MapControl](mapcontrol.md).
     * @remarks
     * Mouse interactions are received, processed, and managed as pointers. The MapElementPointerExited event is triggered as the user moves their mouse out from over an element. An instance of [MapElementPointerExitedEventArgs](mapelementpointerexitedeventargs.md) provides data for this event.
     * @type {TypedEventHandler<MapControl, MapElementPointerExitedEventArgs>}
    */
    OnMapElementPointerExited {
        get {
            if(!this.HasProp("__OnMapElementPointerExited")){
                this.__OnMapElementPointerExited := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f6a7bfd1-2c79-5191-b382-75b141d18846}"),
                    MapControl,
                    MapElementPointerExitedEventArgs
                )
                this.__OnMapElementPointerExitedToken := this.add_MapElementPointerExited(this.__OnMapElementPointerExited.iface)
            }
            return this.__OnMapElementPointerExited
        }
    }

    /**
     * Occurs when the current position of the map's camera has changed.
     * @remarks
     * During an animation of the map, the [ActualCamera](mapcontrol_actualcamera.md) defines the current position of the map's camera and [TargetCamera](mapcontrol_targetcamera.md) defines the final position of the camera.
     * @type {TypedEventHandler<MapControl, MapActualCameraChangedEventArgs>}
    */
    OnActualCameraChanged {
        get {
            if(!this.HasProp("__OnActualCameraChanged")){
                this.__OnActualCameraChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{1b536ae0-08b0-5c54-bb30-679e6a875d61}"),
                    MapControl,
                    MapActualCameraChangedEventArgs
                )
                this.__OnActualCameraChangedToken := this.add_ActualCameraChanged(this.__OnActualCameraChanged.iface)
            }
            return this.__OnActualCameraChanged
        }
    }

    /**
     * Occurs when the current position of the map's camera changes.
     * @remarks
     * During an animation of the map, the [ActualCamera](mapcontrol_actualcamera.md) defines the current position of the map's camera and [TargetCamera](mapcontrol_targetcamera.md) defines the final position of the camera.
     * @type {TypedEventHandler<MapControl, MapActualCameraChangingEventArgs>}
    */
    OnActualCameraChanging {
        get {
            if(!this.HasProp("__OnActualCameraChanging")){
                this.__OnActualCameraChanging := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{78bfb71b-2d80-50e1-a2e9-e5667ff89ef2}"),
                    MapControl,
                    MapActualCameraChangingEventArgs
                )
                this.__OnActualCameraChangingToken := this.add_ActualCameraChanging(this.__OnActualCameraChanging.iface)
            }
            return this.__OnActualCameraChanging
        }
    }

    /**
     * Occurs when the final position of the map's camera has changed.
     * @remarks
     * During an animation of the map, the [ActualCamera](mapcontrol_actualcamera.md) defines the current position of the map's camera and [TargetCamera](mapcontrol_targetcamera.md) defines the final position of the camera.
     * @type {TypedEventHandler<MapControl, MapTargetCameraChangedEventArgs>}
    */
    OnTargetCameraChanged {
        get {
            if(!this.HasProp("__OnTargetCameraChanged")){
                this.__OnTargetCameraChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{2671c2dd-e212-5e43-80e2-ab6ff3f3086c}"),
                    MapControl,
                    MapTargetCameraChangedEventArgs
                )
                this.__OnTargetCameraChangedToken := this.add_TargetCameraChanged(this.__OnTargetCameraChanged.iface)
            }
            return this.__OnTargetCameraChanged
        }
    }

    /**
     * Occurs when the custom experience of the [MapControl](mapcontrol.md) changes.
     * @remarks
     * Custom experiences change the way maps appear in the [MapControl](mapcontrol.md). For example, the [StreetsideExperience](streetsideexperience.md) changes the perspective of the map to appear as though you were viewing a location from the street level. Entering or existing a street-level view will trigger the CustomExperienceChanged event.
     * @type {TypedEventHandler<MapControl, MapCustomExperienceChangedEventArgs>}
    */
    OnCustomExperienceChanged {
        get {
            if(!this.HasProp("__OnCustomExperienceChanged")){
                this.__OnCustomExperienceChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{272cf26f-18da-599e-896f-3bfbf6fb1326}"),
                    MapControl,
                    MapCustomExperienceChangedEventArgs
                )
                this.__OnCustomExperienceChangedToken := this.add_CustomExperienceChanged(this.__OnCustomExperienceChanged.iface)
            }
            return this.__OnCustomExperienceChanged
        }
    }

    /**
     * Occurs when the user presses-and-holds the [MapControl](mapcontrol.md) or clicks on it using the right mouse button. An instance of [MapRightTappedEventArgs](maprighttappedeventargs.md) provides data for this event.
     * @type {TypedEventHandler<MapControl, MapRightTappedEventArgs>}
    */
    OnMapRightTapped {
        get {
            if(!this.HasProp("__OnMapRightTapped")){
                this.__OnMapRightTapped := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{efc52f2d-ad6b-59af-a0f0-2253d434414f}"),
                    MapControl,
                    MapRightTappedEventArgs
                )
                this.__OnMapRightTappedToken := this.add_MapRightTapped(this.__OnMapRightTapped.iface)
            }
            return this.__OnMapRightTapped
        }
    }

    /**
     * Occurs when the user has completed a context input gesture on a map, such as a right-click.
     * @type {TypedEventHandler<MapControl, MapContextRequestedEventArgs>}
    */
    OnMapContextRequested {
        get {
            if(!this.HasProp("__OnMapContextRequested")){
                this.__OnMapContextRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e5239641-ba1f-5d89-aae1-c7b499a47b0c}"),
                    MapControl,
                    MapContextRequestedEventArgs
                )
                this.__OnMapContextRequestedToken := this.add_MapContextRequested(this.__OnMapContextRequested.iface)
            }
            return this.__OnMapContextRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MapControl](mapcontrol.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControl")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCenterChangedToken")) {
            this.remove_CenterChanged(this.__OnCenterChangedToken)
            this.__OnCenterChanged.iface.Dispose()
        }

        if(this.HasProp("__OnHeadingChangedToken")) {
            this.remove_HeadingChanged(this.__OnHeadingChangedToken)
            this.__OnHeadingChanged.iface.Dispose()
        }

        if(this.HasProp("__OnLoadingStatusChangedToken")) {
            this.remove_LoadingStatusChanged(this.__OnLoadingStatusChangedToken)
            this.__OnLoadingStatusChanged.iface.Dispose()
        }

        if(this.HasProp("__OnMapDoubleTappedToken")) {
            this.remove_MapDoubleTapped(this.__OnMapDoubleTappedToken)
            this.__OnMapDoubleTapped.iface.Dispose()
        }

        if(this.HasProp("__OnMapHoldingToken")) {
            this.remove_MapHolding(this.__OnMapHoldingToken)
            this.__OnMapHolding.iface.Dispose()
        }

        if(this.HasProp("__OnMapTappedToken")) {
            this.remove_MapTapped(this.__OnMapTappedToken)
            this.__OnMapTapped.iface.Dispose()
        }

        if(this.HasProp("__OnPitchChangedToken")) {
            this.remove_PitchChanged(this.__OnPitchChangedToken)
            this.__OnPitchChanged.iface.Dispose()
        }

        if(this.HasProp("__OnTransformOriginChangedToken")) {
            this.remove_TransformOriginChanged(this.__OnTransformOriginChangedToken)
            this.__OnTransformOriginChanged.iface.Dispose()
        }

        if(this.HasProp("__OnZoomLevelChangedToken")) {
            this.remove_ZoomLevelChanged(this.__OnZoomLevelChangedToken)
            this.__OnZoomLevelChanged.iface.Dispose()
        }

        if(this.HasProp("__OnMapElementClickToken")) {
            this.remove_MapElementClick(this.__OnMapElementClickToken)
            this.__OnMapElementClick.iface.Dispose()
        }

        if(this.HasProp("__OnMapElementPointerEnteredToken")) {
            this.remove_MapElementPointerEntered(this.__OnMapElementPointerEnteredToken)
            this.__OnMapElementPointerEntered.iface.Dispose()
        }

        if(this.HasProp("__OnMapElementPointerExitedToken")) {
            this.remove_MapElementPointerExited(this.__OnMapElementPointerExitedToken)
            this.__OnMapElementPointerExited.iface.Dispose()
        }

        if(this.HasProp("__OnActualCameraChangedToken")) {
            this.remove_ActualCameraChanged(this.__OnActualCameraChangedToken)
            this.__OnActualCameraChanged.iface.Dispose()
        }

        if(this.HasProp("__OnActualCameraChangingToken")) {
            this.remove_ActualCameraChanging(this.__OnActualCameraChangingToken)
            this.__OnActualCameraChanging.iface.Dispose()
        }

        if(this.HasProp("__OnTargetCameraChangedToken")) {
            this.remove_TargetCameraChanged(this.__OnTargetCameraChangedToken)
            this.__OnTargetCameraChanged.iface.Dispose()
        }

        if(this.HasProp("__OnCustomExperienceChangedToken")) {
            this.remove_CustomExperienceChanged(this.__OnCustomExperienceChangedToken)
            this.__OnCustomExperienceChanged.iface.Dispose()
        }

        if(this.HasProp("__OnMapRightTappedToken")) {
            this.remove_MapRightTapped(this.__OnMapRightTappedToken)
            this.__OnMapRightTapped.iface.Dispose()
        }

        if(this.HasProp("__OnMapContextRequestedToken")) {
            this.remove_MapContextRequested(this.__OnMapContextRequestedToken)
            this.__OnMapContextRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Geopoint} 
     */
    get_Center() {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.get_Center()
    }

    /**
     * 
     * @param {Geopoint} value 
     * @returns {HRESULT} 
     */
    put_Center(value) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.put_Center(value)
    }

    /**
     * 
     * @returns {IVector<DependencyObject>} 
     */
    get_Children() {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.get_Children()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColorScheme() {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.get_ColorScheme()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ColorScheme(value) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.put_ColorScheme(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DesiredPitch() {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.get_DesiredPitch()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DesiredPitch(value) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.put_DesiredPitch(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Heading() {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.get_Heading()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Heading(value) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.put_Heading(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_LandmarksVisible() {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.get_LandmarksVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_LandmarksVisible(value) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.put_LandmarksVisible(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LoadingStatus() {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.get_LoadingStatus()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MapServiceToken() {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.get_MapServiceToken()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_MapServiceToken(value) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.put_MapServiceToken(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxZoomLevel() {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.get_MaxZoomLevel()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinZoomLevel() {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.get_MinZoomLevel()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PedestrianFeaturesVisible() {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.get_PedestrianFeaturesVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_PedestrianFeaturesVisible(value) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.put_PedestrianFeaturesVisible(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Pitch() {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.get_Pitch()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Style() {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.get_Style()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Style(value) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.put_Style(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_TrafficFlowVisible() {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.get_TrafficFlowVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_TrafficFlowVisible(value) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.put_TrafficFlowVisible(value)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_TransformOrigin() {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.get_TransformOrigin()
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_TransformOrigin(value) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.put_TransformOrigin(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WatermarkMode() {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.get_WatermarkMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_WatermarkMode(value) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.put_WatermarkMode(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ZoomLevel() {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.get_ZoomLevel()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ZoomLevel(value) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.put_ZoomLevel(value)
    }

    /**
     * 
     * @returns {IVector<MapElement>} 
     */
    get_MapElements() {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.get_MapElements()
    }

    /**
     * 
     * @returns {IVector<MapRouteView>} 
     */
    get_Routes() {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.get_Routes()
    }

    /**
     * 
     * @returns {IVector<MapTileSource>} 
     */
    get_TileSources() {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.get_TileSources()
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CenterChanged(handler) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.add_CenterChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CenterChanged(token) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.remove_CenterChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_HeadingChanged(handler) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.add_HeadingChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_HeadingChanged(token) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.remove_HeadingChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LoadingStatusChanged(handler) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.add_LoadingStatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LoadingStatusChanged(token) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.remove_LoadingStatusChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapInputEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MapDoubleTapped(handler) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.add_MapDoubleTapped(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MapDoubleTapped(token) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.remove_MapDoubleTapped(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapInputEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MapHolding(handler) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.add_MapHolding(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MapHolding(token) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.remove_MapHolding(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapInputEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MapTapped(handler) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.add_MapTapped(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MapTapped(token) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.remove_MapTapped(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PitchChanged(handler) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.add_PitchChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PitchChanged(token) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.remove_PitchChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TransformOriginChanged(handler) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.add_TransformOriginChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TransformOriginChanged(token) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.remove_TransformOriginChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ZoomLevelChanged(handler) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.add_ZoomLevelChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ZoomLevelChanged(token) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.remove_ZoomLevelChanged(token)
    }

    /**
     * Retrieves the collection of [MapElement](mapcontrol_mapelements.md) objects within the specified radius.
     * @remarks
     * Use this overload to retrieve a collection of map objects by using a hit test area that your app captures from touch interactions.
     * @param {POINT} offset The point on the map that marks the center of a radius from which to retrieve the collection of [MapElement](mapelement.md) objects.
     * @returns {IVectorView<MapElement>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.findmapelementsatoffset
     */
    FindMapElementsAtOffset(offset) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.FindMapElementsAtOffset(offset)
    }

    /**
     * Converts a point on the map to a geographic location.
     * > [!NOTE]
     * This method is deprecated. Use the [TryGetLocationFromOffset](mapcontrol_trygetlocationfromoffset_77980665.md) method instead.
     * @remarks
     * This method will throw an exception if the point is invalid.
     * @param {POINT} offset A point on the map to convert to a geographic location.
     * @param {Pointer<Geopoint>} location_ When this method returns, contains the corresponding geographic location.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.getlocationfromoffset
     */
    GetLocationFromOffset(offset, location_) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.GetLocationFromOffset(offset, location_)
    }

    /**
     * Converts a geographic location to a point on the map.
     * @remarks
     * This method returns a valid point only when the geographic location appears within the map control view.
     *  
     * Compare the [GetLocationFromOffset](mapcontrol_getlocationfromoffset_1281571330.md) method.
     * @param {Geopoint} location_ A geographic location to convert to a point on the map.
     * @param {Pointer<POINT>} offset When this method returns, contains the corresponding point on the map.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.getoffsetfromlocation
     */
    GetOffsetFromLocation(location_, offset) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.GetOffsetFromLocation(location_, offset)
    }

    /**
     * Determines whether the specified geographic location is located in the portion of the map currently visible in the [MapControl](mapcontrol.md).
     * @param {Geopoint} location_ A geographic location.
     * @param {Pointer<Boolean>} isInView When this method returns, contains **true** if the specified geographic location is located in the portion of the map currently visible in the [MapControl](mapcontrol.md); otherwise, contains **false**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.islocationinview
     */
    IsLocationInView(location_, isInView) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.IsLocationInView(location_, isInView)
    }

    /**
     * Sets the view of the map displayed in the [MapControl](mapcontrol.md) to the contents of the specified [GeoboundingBox](../windows.devices.geolocation/geoboundingbox.md) with the specified margin. The view change uses the specified animation.
     * @remarks
     * If the area specified by the [GeoboundingBox](../windows.devices.geolocation/geoboundingbox.md) doesn't fill the [MapControl](mapcontrol.md), the control also displays the surrounding area outside the [GeoboundingBox](../windows.devices.geolocation/geoboundingbox.md).
     * @param {GeoboundingBox} bounds The geographic area to display in the view.
     * @param {IReference<Thickness>} margin The margin to use in the view.
     * @param {Integer} animation The animation to use when changing the view. For more info, see [MapAnimationKind](mapanimationkind.md).
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.trysetviewboundsasync
     */
    TrySetViewBoundsAsync(bounds, margin, animation) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.TrySetViewBoundsAsync(bounds, margin, animation)
    }

    /**
     * Sets the view of the map displayed in the [MapControl](mapcontrol.md) using the specified center and zoom level.
     * @remarks
     * The maximum and minimum values of [ZoomLevel](mapcontrol_zoomlevel.md) depend on the type of map view: 2D, 3D, or Streetside.<table>
     *    <tr><th>Property</th><th>2D range</th><th>3D range</th><th>Streetside range</th></tr>
     *    <tr><td>ZoomLevel</td><td>1-20</td><td>1-20</td><td>24-26</td></tr>
     * </table>
     * 
     *  When leaving a Streetside view, the map returns to the previous view settings. The Streetside ZoomLevel is not maintained outside of the Streetside experience.
     * @param {Geopoint} center The center to use in the view. For more info, see the [Center](mapcontrol_center.md) property.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.trysetviewasync
     */
    TrySetViewWithCenterAsync(center) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.TrySetViewWithCenterAsync(center)
    }

    /**
     * Sets the view of the map displayed in the [MapControl](mapcontrol.md) using the specified center.
     * @param {Geopoint} center The center to use in the view. For more info, see the [Center](mapcontrol_center.md) property.
     * @param {IReference<Float>} zoomLevel 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.trysetviewasync
     */
    TrySetViewWithCenterAndZoomAsync(center, zoomLevel) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.TrySetViewWithCenterAndZoomAsync(center, zoomLevel)
    }

    /**
     * Sets the view of the map displayed in the [MapControl ](mapcontrol.md) using the specified center, zoom level, heading, and pitch. The view change uses the specified animation.
     * @remarks
     * The valid range of pitch and zoom level differs between 2D, 3D, and Streetside map views. When switching from 3D to 2D for example, values that are acceptable in the current view may be out of range in the next view. If that’s the case, the current pitch value will be truncated to the nearest acceptable value in the next view.
     * 
     * When leaving a Streetside view, the map returns to the previous view settings. The Streetside pitch is not maintained outside of the Streetside experience.
     * 
     * The maximum and minimum values of pitch/tilt depend on the type of map view: 2D, 3D, or Streetside. <table>
     *    <tr><th>Property</th><th>2D range</th><th>3D range</th><th>Streetside range</th></tr>
     *    <tr><td>pitch/tilt</td><td>0-75</td><td>0-90</td><td>0-180</td></tr>
     *    <tr><td>ZoomLevel</td><td>1-20</td><td>1-20</td><td>24-26</td></tr>
     * </table>
     * 
     * Heading values greater than 360 degrees are normalized to their equivalent 0-360 degree value.
     * @param {Geopoint} center The center to use in the view. For more info, see the [Center](mapcontrol_center.md) property.
     * @param {IReference<Float>} zoomLevel The zoom level to use in the view. For more info, see the [ZoomLevel](mapcontrol_zoomlevel.md) property.
     * @param {IReference<Float>} heading The heading to use in the view. For more info, see the [Heading](mapcontrol_heading.md) property.
     * @param {IReference<Float>} desiredPitch The pitch to use in the view. For more info, see the [DesiredPitch](mapcontrol_desiredpitch.md) property.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.trysetviewasync
     */
    TrySetViewWithCenterZoomHeadingAndPitchAsync(center, zoomLevel, heading, desiredPitch) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.TrySetViewWithCenterZoomHeadingAndPitchAsync(center, zoomLevel, heading, desiredPitch)
    }

    /**
     * Sets the view of the map displayed in the [MapControl](mapcontrol.md) using the specified center.
     * @param {Geopoint} center The center to use in the view. For more info, see the [Center](mapcontrol_center.md) property.
     * @param {IReference<Float>} zoomLevel 
     * @param {IReference<Float>} heading 
     * @param {IReference<Float>} desiredPitch 
     * @param {Integer} animation 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.trysetviewasync
     */
    TrySetViewWithCenterZoomHeadingPitchAndAnimationAsync(center, zoomLevel, heading, desiredPitch, animation) {
        if (!this.HasProp("__IMapControl")) {
            if ((queryResult := this.QueryInterface(IMapControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl := IMapControl(outPtr)
        }

        return this.__IMapControl.TrySetViewWithCenterZoomHeadingPitchAndAnimationAsync(center, zoomLevel, heading, desiredPitch, animation)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_BusinessLandmarksVisible() {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.get_BusinessLandmarksVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_BusinessLandmarksVisible(value) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.put_BusinessLandmarksVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_TransitFeaturesVisible() {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.get_TransitFeaturesVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_TransitFeaturesVisible(value) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.put_TransitFeaturesVisible(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PanInteractionMode() {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.get_PanInteractionMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PanInteractionMode(value) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.put_PanInteractionMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RotateInteractionMode() {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.get_RotateInteractionMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RotateInteractionMode(value) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.put_RotateInteractionMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TiltInteractionMode() {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.get_TiltInteractionMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TiltInteractionMode(value) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.put_TiltInteractionMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ZoomInteractionMode() {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.get_ZoomInteractionMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ZoomInteractionMode(value) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.put_ZoomInteractionMode(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Is3DSupported() {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.get_Is3DSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStreetsideSupported() {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.get_IsStreetsideSupported()
    }

    /**
     * 
     * @returns {MapScene} 
     */
    get_Scene() {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.get_Scene()
    }

    /**
     * 
     * @param {MapScene} value 
     * @returns {HRESULT} 
     */
    put_Scene(value) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.put_Scene(value)
    }

    /**
     * 
     * @returns {MapCamera} 
     */
    get_ActualCamera() {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.get_ActualCamera()
    }

    /**
     * 
     * @returns {MapCamera} 
     */
    get_TargetCamera() {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.get_TargetCamera()
    }

    /**
     * 
     * @returns {MapCustomExperience} 
     */
    get_CustomExperience() {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.get_CustomExperience()
    }

    /**
     * 
     * @param {MapCustomExperience} value 
     * @returns {HRESULT} 
     */
    put_CustomExperience(value) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.put_CustomExperience(value)
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapElementClickEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MapElementClick(handler) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.add_MapElementClick(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MapElementClick(token) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.remove_MapElementClick(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapElementPointerEnteredEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MapElementPointerEntered(handler) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.add_MapElementPointerEntered(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MapElementPointerEntered(token) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.remove_MapElementPointerEntered(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapElementPointerExitedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MapElementPointerExited(handler) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.add_MapElementPointerExited(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MapElementPointerExited(token) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.remove_MapElementPointerExited(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapActualCameraChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ActualCameraChanged(handler) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.add_ActualCameraChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ActualCameraChanged(token) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.remove_ActualCameraChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapActualCameraChangingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ActualCameraChanging(handler) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.add_ActualCameraChanging(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ActualCameraChanging(token) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.remove_ActualCameraChanging(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapTargetCameraChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TargetCameraChanged(handler) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.add_TargetCameraChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TargetCameraChanged(token) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.remove_TargetCameraChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapCustomExperienceChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CustomExperienceChanged(handler) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.add_CustomExperienceChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CustomExperienceChanged(token) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.remove_CustomExperienceChanged(token)
    }

    /**
     * Starts an asynchronous operation to rotate the map's camera continuously from its current position.
     * @remarks
     * Heading values greater than 360 degrees are normalized to their equivalent 0-360 degree value.
     * @param {Float} rateInDegreesPerSecond The degrees that the map's camera rotates per second in a horizontal clockwise direction.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.startcontinuousrotate
     */
    StartContinuousRotate(rateInDegreesPerSecond) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.StartContinuousRotate(rateInDegreesPerSecond)
    }

    /**
     * Stops an asynchronous operation to rotate the map's camera continuously from its current position.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.stopcontinuousrotate
     */
    StopContinuousRotate() {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.StopContinuousRotate()
    }

    /**
     * Starts an asynchronous operation to tilt the map's camera continuously from its current position.
     * @remarks
     * For more information about tilt, see the remarks section of the [MapCamera(Geopoint, Double, Double, Double, Double)](mapcamera_mapcamera_1532703584.md) overload.
     * @param {Float} rateInDegreesPerSecond The degrees of [Pitch](mapcamera_pitch.md) that the map's camera tilts down to the ground per second.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.startcontinuoustilt
     */
    StartContinuousTilt(rateInDegreesPerSecond) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.StartContinuousTilt(rateInDegreesPerSecond)
    }

    /**
     * Stops an asynchronous operation to tilt the map's camera continuously from its current position.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.stopcontinuoustilt
     */
    StopContinuousTilt() {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.StopContinuousTilt()
    }

    /**
     * Starts an asynchronous operation to zoom in continuously until the map's maximum [ZoomLevel](mapcontrol_zoomlevel.md) is reached.
     * @remarks
     * The maximum and minimum values of [ZoomLevel](mapcontrol_zoomlevel.md) depend on the type of map view: 2D, 3D, or Streetside.<table>
     *    <tr><th>Property</th><th>2D range</th><th>3D range</th><th>Streetside range</th></tr>
     *    <tr><td>ZoomLevel</td><td>1-20</td><td>1-20</td><td>24-26</td></tr>
     * </table>
     * 
     *  When leaving a Streetside view, the map returns to the previous view settings. The Streetside ZoomLevel is not maintained outside of the Streetside experience.
     * @param {Float} rateOfChangePerSecond The change in [ZoomLevel](mapcontrol_zoomlevel.md) per second.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.startcontinuouszoom
     */
    StartContinuousZoom(rateOfChangePerSecond) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.StartContinuousZoom(rateOfChangePerSecond)
    }

    /**
     * Stops an asynchronous operation to zoom in continuously until the map's maximum [ZoomLevel](mapcontrol_zoomlevel.md) is reached.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.stopcontinuouszoom
     */
    StopContinuousZoom() {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.StopContinuousZoom()
    }

    /**
     * Starts an asynchronous operation to rotate the map's camera from its current position.
     * @remarks
     * Consider this method when you want to replace the default UI control with your own.
     * 
     * Heading values greater than 360 degrees are normalized to their equivalent 0-360 degree value.
     * @param {Float} degrees The degrees that the map's camera rotates in a horizontal clockwise direction.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.tryrotateasync
     */
    TryRotateAsync(degrees) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.TryRotateAsync(degrees)
    }

    /**
     * Starts an asynchronous operation to rotate the map's camera to a specific orientation.
     * @remarks
     * See the remarks section of the [TryRotateAsync](mapcontrol_tryrotateasync_1049608017.md) method.
     * @param {Float} angleInDegrees The final [Heading](mapcamera_heading.md) of the map's camera, in degrees.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.tryrotatetoasync
     */
    TryRotateToAsync(angleInDegrees) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.TryRotateToAsync(angleInDegrees)
    }

    /**
     * Starts an asynchronous operation to tilt the map's camera from its current position.
     * @remarks
     * Consider this method when you want to replace the default UI control with your own.
     * 
     * The valid range of tilt differs between 2D, 3D, and Streetside map views. When switching from 3D to 2D for example, values that are acceptable in the current view may be out of range in the next view. If that’s the case, the current tilt value will be truncated to the nearest acceptable value in the next view.
     * 
     * When leaving a Streetside view, the map returns to the previous view settings. The Streetside pitch is not maintained outside of the Streetside experience.
     * 
     * The maximum and minimum values of pitch/tilt depend on the type of map view: 2D, 3D, or Streetside.<table>
     *    <tr><th>Property</th><th>2D range</th><th>3D range</th><th>Streetside range</th></tr>
     *    <tr><td>pitch/tilt</td><td>0-75</td><td>0-90</td><td>0-180</td></tr>
     * </table>
     * @param {Float} degrees The degrees of [Pitch](mapcamera_pitch.md) that the map's camera tilts down to the ground.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.trytiltasync
     */
    TryTiltAsync(degrees) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.TryTiltAsync(degrees)
    }

    /**
     * Starts an asynchronous operation to tilt the map's camera to a specific orientation.
     * @remarks
     * See the remarks section of the [TryTiltAsync](mapcontrol_trytiltasync_1650923439.md) method.
     * @param {Float} angleInDegrees The final [Pitch](mapcamera_pitch.md) of the map's camera in degrees.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.trytilttoasync
     */
    TryTiltToAsync(angleInDegrees) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.TryTiltToAsync(angleInDegrees)
    }

    /**
     * Starts an asynchronous operation to zoom in, increasing the map's [ZoomLevel](mapcontrol_zoomlevel.md) by one.
     * @remarks
     * > [!WARNING]
     * > We don't recommend changing **ZoomLevel** with 3D views. When the MapControl's view is not looking "straight-down," changes in **ZoomLevel** can lead to unpredictable behavior.
     * 
     * **ZoomLevel** is intended for 2D views. To implement a "zoom" effect with 3D views, use the MapControl's [TrySetSceneAsync](mapcontrol_trysetsceneasync_168550178.md) method to move the camera closer. Start by setting a closer [Location](mapcamera_location.md) on a [MapCamera](mapcamera.md) object. Next, create a new [MapScene](mapscene.md) by passing that [MapCamera](mapcamera.md) to [CreateFromCamera](mapscene_createfromcamera_432380015.md). Finally, initiate the zoom by passing the new [MapScene](mapscene.md) to [TrySetSceneAsync](mapcontrol_trysetsceneasync_168550178.md). You can zoom in immediately or specify [MapAnimationKind](mapanimationkind.md) to create an animated "fly in".
     * 
     * The maximum and minimum values of [ZoomLevel](mapcontrol_zoomlevel.md), which are reported by the[ MaxZoomLevel](mapcontrol_maxzoomlevel.md) and [MinZoomLevel](mapcontrol_minzoomlevel.md) properties, depend on the type of map view: 2D, 3D, or Streetside.<table>
     *    <tr><th>Property</th><th>2D range</th><th>3D range</th><th>Streetside range</th></tr>
     *    <tr><td>ZoomLevel</td><td>1-20</td><td>1-20</td><td>24-26</td></tr>
     * </table>
     * 
     *  When leaving a Streetside view, the map returns to the previous view settings. The Streetside ZoomLevel is not maintained outside of the Streetside experience.
     * 
     * Consider this method when you want to replace the default UI control with your own.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.tryzoominasync
     */
    TryZoomInAsync() {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.TryZoomInAsync()
    }

    /**
     * Starts an asynchronous operation to zoom out, decreasing the map's [ZoomLevel](mapcontrol_zoomlevel.md) by one.
     * @remarks
     * See the remarks section of the [TryZoomInAsync](mapcontrol_tryzoominasync_1251712457.md) method.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.tryzoomoutasync
     */
    TryZoomOutAsync() {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.TryZoomOutAsync()
    }

    /**
     * Starts an asynchronous operation to zoom the map to a specific [ZoomLevel](mapcontrol_zoomlevel.md).
     * @remarks
     * See the remarks section of the [TryZoomInAsync](mapcontrol_tryzoominasync_1251712457.md) method.
     * @param {Float} zoomLevel The final zoom level of the map, between 1 and 20.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.tryzoomtoasync
     */
    TryZoomToAsync(zoomLevel) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.TryZoomToAsync(zoomLevel)
    }

    /**
     * Sets the scene of the map displayed in the [MapControl](mapcontrol.md) using the specified scene and animation.
     * @param {MapScene} scene Defines the item or area to appear in the map.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.trysetsceneasync
     */
    TrySetSceneAsync(scene) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.TrySetSceneAsync(scene)
    }

    /**
     * Sets the scene of the map displayed in the [MapControl](mapcontrol.md) using the specified scene.
     * @param {MapScene} scene Defines the item or area to appear in the map.
     * @param {Integer} animationKind 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.trysetsceneasync
     */
    TrySetSceneWithAnimationAsync(scene, animationKind) {
        if (!this.HasProp("__IMapControl2")) {
            if ((queryResult := this.QueryInterface(IMapControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl2 := IMapControl2(outPtr)
        }

        return this.__IMapControl2.TrySetSceneWithAnimationAsync(scene, animationKind)
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapRightTappedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MapRightTapped(handler) {
        if (!this.HasProp("__IMapControl3")) {
            if ((queryResult := this.QueryInterface(IMapControl3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl3 := IMapControl3(outPtr)
        }

        return this.__IMapControl3.add_MapRightTapped(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MapRightTapped(token) {
        if (!this.HasProp("__IMapControl3")) {
            if ((queryResult := this.QueryInterface(IMapControl3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl3 := IMapControl3(outPtr)
        }

        return this.__IMapControl3.remove_MapRightTapped(token)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_BusinessLandmarksEnabled() {
        if (!this.HasProp("__IMapControl4")) {
            if ((queryResult := this.QueryInterface(IMapControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl4 := IMapControl4(outPtr)
        }

        return this.__IMapControl4.get_BusinessLandmarksEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_BusinessLandmarksEnabled(value) {
        if (!this.HasProp("__IMapControl4")) {
            if ((queryResult := this.QueryInterface(IMapControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl4 := IMapControl4(outPtr)
        }

        return this.__IMapControl4.put_BusinessLandmarksEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_TransitFeaturesEnabled() {
        if (!this.HasProp("__IMapControl4")) {
            if ((queryResult := this.QueryInterface(IMapControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl4 := IMapControl4(outPtr)
        }

        return this.__IMapControl4.get_TransitFeaturesEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_TransitFeaturesEnabled(value) {
        if (!this.HasProp("__IMapControl4")) {
            if ((queryResult := this.QueryInterface(IMapControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl4 := IMapControl4(outPtr)
        }

        return this.__IMapControl4.put_TransitFeaturesEnabled(value)
    }

    /**
     * Gets the visible region of the map control.
     * @param {Integer} region_ The visible region kind.
     * @returns {Geopath} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.getvisibleregion
     */
    GetVisibleRegion(region_) {
        if (!this.HasProp("__IMapControl4")) {
            if ((queryResult := this.QueryInterface(IMapControl4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl4 := IMapControl4(outPtr)
        }

        return this.__IMapControl4.GetVisibleRegion(region_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MapProjection() {
        if (!this.HasProp("__IMapControl5")) {
            if ((queryResult := this.QueryInterface(IMapControl5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl5 := IMapControl5(outPtr)
        }

        return this.__IMapControl5.get_MapProjection()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MapProjection(value) {
        if (!this.HasProp("__IMapControl5")) {
            if ((queryResult := this.QueryInterface(IMapControl5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl5 := IMapControl5(outPtr)
        }

        return this.__IMapControl5.put_MapProjection(value)
    }

    /**
     * 
     * @returns {MapStyleSheet} 
     */
    get_StyleSheet() {
        if (!this.HasProp("__IMapControl5")) {
            if ((queryResult := this.QueryInterface(IMapControl5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl5 := IMapControl5(outPtr)
        }

        return this.__IMapControl5.get_StyleSheet()
    }

    /**
     * 
     * @param {MapStyleSheet} value 
     * @returns {HRESULT} 
     */
    put_StyleSheet(value) {
        if (!this.HasProp("__IMapControl5")) {
            if ((queryResult := this.QueryInterface(IMapControl5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl5 := IMapControl5(outPtr)
        }

        return this.__IMapControl5.put_StyleSheet(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_ViewPadding() {
        if (!this.HasProp("__IMapControl5")) {
            if ((queryResult := this.QueryInterface(IMapControl5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl5 := IMapControl5(outPtr)
        }

        return this.__IMapControl5.get_ViewPadding()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_ViewPadding(value) {
        if (!this.HasProp("__IMapControl5")) {
            if ((queryResult := this.QueryInterface(IMapControl5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl5 := IMapControl5(outPtr)
        }

        return this.__IMapControl5.put_ViewPadding(value)
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapContextRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MapContextRequested(handler) {
        if (!this.HasProp("__IMapControl5")) {
            if ((queryResult := this.QueryInterface(IMapControl5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl5 := IMapControl5(outPtr)
        }

        return this.__IMapControl5.add_MapContextRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MapContextRequested(token) {
        if (!this.HasProp("__IMapControl5")) {
            if ((queryResult := this.QueryInterface(IMapControl5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl5 := IMapControl5(outPtr)
        }

        return this.__IMapControl5.remove_MapContextRequested(token)
    }

    /**
     * Retrieves the collection of [MapElement](mapcontrol_mapelements.md) objects at the specified point on the map.
     * @param {POINT} offset The point on the map from which to retrieve the collection of [MapElement](mapelement.md) objects.
     * @param {Float} radius 
     * @returns {IVectorView<MapElement>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.findmapelementsatoffset
     */
    FindMapElementsAtOffsetWithRadius(offset, radius) {
        if (!this.HasProp("__IMapControl5")) {
            if ((queryResult := this.QueryInterface(IMapControl5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl5 := IMapControl5(outPtr)
        }

        return this.__IMapControl5.FindMapElementsAtOffsetWithRadius(offset, radius)
    }

    /**
     * Converts a point on the map to a geographic location by using the specified altitude reference system.
     * > [!NOTE]
     * This method is deprecated. Use the [TryGetLocationFromOffset](mapcontrol_trygetlocationfromoffset_418557555.md) method instead.
     * @remarks
     * This method provides an instance of a [Geopoint](../windows.devices.geolocation/geopoint.md). That [Geopoint](../windows.devices.geolocation/geopoint.md) contains a [BasicGeoPosition](../windows.devices.geolocation/geoposition.md). object.  The *desiredReferenceSystem* parameter sets the [Altitude](/uwp/api/windows.devices.geolocation.basicgeoposition.Altitude) field of that object.  
     * 
     * This method will throw an exception if the point is invalid.
     * > [!NOTE]
     * > An [AltitudeReferenceSystem](../windows.devices.geolocation/altitudereferencesystem.md) of **Ellipsoid** might not be supported.
     * @param {POINT} offset A point on the map to convert to a geographic location.
     * @param {Integer} desiredReferenceSystem The altitude reference system of the geographic point. A value of **Unspecified** for the altitude reference system has the same effect as using the default [GetLocationFromOffset(Windows.Foundation.Point offset, Windows.Devices.Geolocation.Geopoint location)](mapcontrol_getlocationfromoffset_1345615754.md) overload.
     * @param {Pointer<Geopoint>} location_ When this method returns, contains the corresponding geographic location.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.getlocationfromoffset
     */
    GetLocationFromOffsetWithReferenceSystem(offset, desiredReferenceSystem, location_) {
        if (!this.HasProp("__IMapControl5")) {
            if ((queryResult := this.QueryInterface(IMapControl5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl5 := IMapControl5(outPtr)
        }

        return this.__IMapControl5.GetLocationFromOffsetWithReferenceSystem(offset, desiredReferenceSystem, location_)
    }

    /**
     * Starts an asynchronous operation to pan the map continuously from its current position.
     * @param {Float} horizontalPixelsPerSecond The pixels per second to pan horizontally.
     * @param {Float} verticalPixelsPerSecond The pixels per second to pan vertically.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.startcontinuouspan
     */
    StartContinuousPan(horizontalPixelsPerSecond, verticalPixelsPerSecond) {
        if (!this.HasProp("__IMapControl5")) {
            if ((queryResult := this.QueryInterface(IMapControl5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl5 := IMapControl5(outPtr)
        }

        return this.__IMapControl5.StartContinuousPan(horizontalPixelsPerSecond, verticalPixelsPerSecond)
    }

    /**
     * Stops an asynchronous operation to pan the map continuously from its current position.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.stopcontinuouspan
     */
    StopContinuousPan() {
        if (!this.HasProp("__IMapControl5")) {
            if ((queryResult := this.QueryInterface(IMapControl5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl5 := IMapControl5(outPtr)
        }

        return this.__IMapControl5.StopContinuousPan()
    }

    /**
     * Starts an asynchronous operation to pan the map from its current position.
     * @param {Float} horizontalPixels The pixels to pan horizontally.
     * @param {Float} verticalPixels The pixels to pan vertically.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.trypanasync
     */
    TryPanAsync(horizontalPixels, verticalPixels) {
        if (!this.HasProp("__IMapControl5")) {
            if ((queryResult := this.QueryInterface(IMapControl5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl5 := IMapControl5(outPtr)
        }

        return this.__IMapControl5.TryPanAsync(horizontalPixels, verticalPixels)
    }

    /**
     * Starts an asynchronous operation to pan the map to a specific location.
     * @param {Geopoint} location_ The coordinates of a geographic location to which you want to pan the map.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.trypantoasync
     */
    TryPanToAsync(location_) {
        if (!this.HasProp("__IMapControl5")) {
            if ((queryResult := this.QueryInterface(IMapControl5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl5 := IMapControl5(outPtr)
        }

        return this.__IMapControl5.TryPanToAsync(location_)
    }

    /**
     * 
     * @returns {IVector<MapLayer>} 
     */
    get_Layers() {
        if (!this.HasProp("__IMapControl6")) {
            if ((queryResult := this.QueryInterface(IMapControl6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl6 := IMapControl6(outPtr)
        }

        return this.__IMapControl6.get_Layers()
    }

    /**
     * 
     * @param {IVector<MapLayer>} value 
     * @returns {HRESULT} 
     */
    put_Layers(value) {
        if (!this.HasProp("__IMapControl6")) {
            if ((queryResult := this.QueryInterface(IMapControl6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl6 := IMapControl6(outPtr)
        }

        return this.__IMapControl6.put_Layers(value)
    }

    /**
     * Converts a point on the map to a geographic location by using the specified altitude reference system.
     * @remarks
     * Use this method instead of the [GetLocationFromOffset](mapcontrol_getlocationfromoffset_1281571330.md) method. The [GetLocationFromOffset](mapcontrol_getlocationfromoffset_1281571330.md) method has been deprecated.
     * @param {POINT} offset A point on the map to convert to a geographic location.
     * @param {Pointer<Geopoint>} location_ When this method returns, contains the corresponding geographic location.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.trygetlocationfromoffset
     */
    TryGetLocationFromOffset(offset, location_) {
        if (!this.HasProp("__IMapControl6")) {
            if ((queryResult := this.QueryInterface(IMapControl6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl6 := IMapControl6(outPtr)
        }

        return this.__IMapControl6.TryGetLocationFromOffset(offset, location_)
    }

    /**
     * Converts a point on the map to a geographic location.
     * @remarks
     * Use this method instead of the [GetLocationFromOffset](mapcontrol_getlocationfromoffset_1345615754.md) method. The [GetLocationFromOffset](mapcontrol_getlocationfromoffset_1345615754.md) method has been deprecated.
     * @param {POINT} offset A point on the map to convert to a geographic location.
     * @param {Integer} desiredReferenceSystem 
     * @param {Pointer<Geopoint>} location_ When this method returns, contains the corresponding geographic location.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrol.trygetlocationfromoffset
     */
    TryGetLocationFromOffsetWithReferenceSystem(offset, desiredReferenceSystem, location_) {
        if (!this.HasProp("__IMapControl6")) {
            if ((queryResult := this.QueryInterface(IMapControl6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl6 := IMapControl6(outPtr)
        }

        return this.__IMapControl6.TryGetLocationFromOffsetWithReferenceSystem(offset, desiredReferenceSystem, location_)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Region() {
        if (!this.HasProp("__IMapControl7")) {
            if ((queryResult := this.QueryInterface(IMapControl7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl7 := IMapControl7(outPtr)
        }

        return this.__IMapControl7.get_Region()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Region(value) {
        if (!this.HasProp("__IMapControl7")) {
            if ((queryResult := this.QueryInterface(IMapControl7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl7 := IMapControl7(outPtr)
        }

        return this.__IMapControl7.put_Region(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanTiltDown() {
        if (!this.HasProp("__IMapControl8")) {
            if ((queryResult := this.QueryInterface(IMapControl8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl8 := IMapControl8(outPtr)
        }

        return this.__IMapControl8.get_CanTiltDown()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanTiltUp() {
        if (!this.HasProp("__IMapControl8")) {
            if ((queryResult := this.QueryInterface(IMapControl8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl8 := IMapControl8(outPtr)
        }

        return this.__IMapControl8.get_CanTiltUp()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanZoomIn() {
        if (!this.HasProp("__IMapControl8")) {
            if ((queryResult := this.QueryInterface(IMapControl8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl8 := IMapControl8(outPtr)
        }

        return this.__IMapControl8.get_CanZoomIn()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanZoomOut() {
        if (!this.HasProp("__IMapControl8")) {
            if ((queryResult := this.QueryInterface(IMapControl8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControl8 := IMapControl8(outPtr)
        }

        return this.__IMapControl8.get_CanZoomOut()
    }

;@endregion Instance Methods
}
