#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IMapControlDataHelper.ahk
#Include .\IMapControlDataHelper2.ahk
#Include .\IMapControlDataHelperStatics.ahk
#Include .\IMapControlDataHelperFactory.ahk
#Include ..\..\..\..\Foundation\TypedEventHandler.ahk
#Include .\MapControl.ahk
#Include .\MapControlBusinessLandmarkClickEventArgs.ahk
#Include .\MapControlTransitFeatureClickEventArgs.ahk
#Include .\MapControlBusinessLandmarkRightTappedEventArgs.ahk
#Include .\MapControlTransitFeatureRightTappedEventArgs.ahk
#Include .\MapControlBusinessLandmarkPointerEnteredEventArgs.ahk
#Include .\MapControlTransitFeaturePointerEnteredEventArgs.ahk
#Include .\MapControlBusinessLandmarkPointerExitedEventArgs.ahk
#Include .\MapControlTransitFeaturePointerExitedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides events that indicate the user has clicked on a business location or transit feature.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about this API and the [Windows.Services.Maps.LocalSearch](../windows.services.maps.localsearch/windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontroldatahelper
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapControlDataHelper extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapControlDataHelper

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapControlDataHelper.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [MapControl](mapcontrol.md) in raster-mode.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about this API and the [Windows.Services.Maps.LocalSearch](../windows.services.maps.localsearch/windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @remarks
     * If you create a [MapControl](mapcontrol.md) in raster-mode, you can't change the map control into vector mode.
     * @param {Boolean} rasterRenderMode Specifies whether to create the [MapControl](mapcontrol.md) in raster-mode.
     * @returns {MapControl} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontroldatahelper.createmapcontrol
     */
    static CreateMapControl(rasterRenderMode) {
        if (!MapControlDataHelper.HasProp("__IMapControlDataHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControlDataHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlDataHelperStatics.IID)
            MapControlDataHelper.__IMapControlDataHelperStatics := IMapControlDataHelperStatics(factoryPtr)
        }

        return MapControlDataHelper.__IMapControlDataHelperStatics.CreateMapControl(rasterRenderMode)
    }

    /**
     * Creates an instance of the [MapControlDataHelper](mapcontroldatahelper.md) class for the specified [MapControl](mapcontrol.md).
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about this API and the [Windows.Services.Maps.LocalSearch](../windows.services.maps.localsearch/windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @param {MapControl} map The map control that provides the business and transit locations to the [MapControlDataHelper](mapcontroldatahelper.md).
     * @returns {MapControlDataHelper} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontroldatahelper.#ctor
     */
    static CreateInstance(map) {
        if (!MapControlDataHelper.HasProp("__IMapControlDataHelperFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControlDataHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapControlDataHelperFactory.IID)
            MapControlDataHelper.__IMapControlDataHelperFactory := IMapControlDataHelperFactory(factoryPtr)
        }

        return MapControlDataHelper.__IMapControlDataHelperFactory.CreateInstance(map)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnBusinessLandmarkClickToken")) {
            this.remove_BusinessLandmarkClick(this.__OnBusinessLandmarkClickToken)
            this.__OnBusinessLandmarkClick.iface.Dispose()
        }

        if(this.HasProp("__OnTransitFeatureClickToken")) {
            this.remove_TransitFeatureClick(this.__OnTransitFeatureClickToken)
            this.__OnTransitFeatureClick.iface.Dispose()
        }

        if(this.HasProp("__OnBusinessLandmarkRightTappedToken")) {
            this.remove_BusinessLandmarkRightTapped(this.__OnBusinessLandmarkRightTappedToken)
            this.__OnBusinessLandmarkRightTapped.iface.Dispose()
        }

        if(this.HasProp("__OnTransitFeatureRightTappedToken")) {
            this.remove_TransitFeatureRightTapped(this.__OnTransitFeatureRightTappedToken)
            this.__OnTransitFeatureRightTapped.iface.Dispose()
        }

        if(this.HasProp("__OnBusinessLandmarkPointerEnteredToken")) {
            this.remove_BusinessLandmarkPointerEntered(this.__OnBusinessLandmarkPointerEnteredToken)
            this.__OnBusinessLandmarkPointerEntered.iface.Dispose()
        }

        if(this.HasProp("__OnTransitFeaturePointerEnteredToken")) {
            this.remove_TransitFeaturePointerEntered(this.__OnTransitFeaturePointerEnteredToken)
            this.__OnTransitFeaturePointerEntered.iface.Dispose()
        }

        if(this.HasProp("__OnBusinessLandmarkPointerExitedToken")) {
            this.remove_BusinessLandmarkPointerExited(this.__OnBusinessLandmarkPointerExitedToken)
            this.__OnBusinessLandmarkPointerExited.iface.Dispose()
        }

        if(this.HasProp("__OnTransitFeaturePointerExitedToken")) {
            this.remove_TransitFeaturePointerExited(this.__OnTransitFeaturePointerExitedToken)
            this.__OnTransitFeaturePointerExited.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapControlBusinessLandmarkClickEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_BusinessLandmarkClick(value) {
        if (!this.HasProp("__IMapControlDataHelper")) {
            if ((queryResult := this.QueryInterface(IMapControlDataHelper.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControlDataHelper := IMapControlDataHelper(outPtr)
        }

        return this.__IMapControlDataHelper.add_BusinessLandmarkClick(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BusinessLandmarkClick(token) {
        if (!this.HasProp("__IMapControlDataHelper")) {
            if ((queryResult := this.QueryInterface(IMapControlDataHelper.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControlDataHelper := IMapControlDataHelper(outPtr)
        }

        return this.__IMapControlDataHelper.remove_BusinessLandmarkClick(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapControlTransitFeatureClickEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_TransitFeatureClick(value) {
        if (!this.HasProp("__IMapControlDataHelper")) {
            if ((queryResult := this.QueryInterface(IMapControlDataHelper.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControlDataHelper := IMapControlDataHelper(outPtr)
        }

        return this.__IMapControlDataHelper.add_TransitFeatureClick(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TransitFeatureClick(token) {
        if (!this.HasProp("__IMapControlDataHelper")) {
            if ((queryResult := this.QueryInterface(IMapControlDataHelper.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControlDataHelper := IMapControlDataHelper(outPtr)
        }

        return this.__IMapControlDataHelper.remove_TransitFeatureClick(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapControlBusinessLandmarkRightTappedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_BusinessLandmarkRightTapped(value) {
        if (!this.HasProp("__IMapControlDataHelper")) {
            if ((queryResult := this.QueryInterface(IMapControlDataHelper.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControlDataHelper := IMapControlDataHelper(outPtr)
        }

        return this.__IMapControlDataHelper.add_BusinessLandmarkRightTapped(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BusinessLandmarkRightTapped(token) {
        if (!this.HasProp("__IMapControlDataHelper")) {
            if ((queryResult := this.QueryInterface(IMapControlDataHelper.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControlDataHelper := IMapControlDataHelper(outPtr)
        }

        return this.__IMapControlDataHelper.remove_BusinessLandmarkRightTapped(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapControlTransitFeatureRightTappedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_TransitFeatureRightTapped(value) {
        if (!this.HasProp("__IMapControlDataHelper")) {
            if ((queryResult := this.QueryInterface(IMapControlDataHelper.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControlDataHelper := IMapControlDataHelper(outPtr)
        }

        return this.__IMapControlDataHelper.add_TransitFeatureRightTapped(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TransitFeatureRightTapped(token) {
        if (!this.HasProp("__IMapControlDataHelper")) {
            if ((queryResult := this.QueryInterface(IMapControlDataHelper.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControlDataHelper := IMapControlDataHelper(outPtr)
        }

        return this.__IMapControlDataHelper.remove_TransitFeatureRightTapped(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapControlBusinessLandmarkPointerEnteredEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_BusinessLandmarkPointerEntered(value) {
        if (!this.HasProp("__IMapControlDataHelper2")) {
            if ((queryResult := this.QueryInterface(IMapControlDataHelper2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControlDataHelper2 := IMapControlDataHelper2(outPtr)
        }

        return this.__IMapControlDataHelper2.add_BusinessLandmarkPointerEntered(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BusinessLandmarkPointerEntered(token) {
        if (!this.HasProp("__IMapControlDataHelper2")) {
            if ((queryResult := this.QueryInterface(IMapControlDataHelper2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControlDataHelper2 := IMapControlDataHelper2(outPtr)
        }

        return this.__IMapControlDataHelper2.remove_BusinessLandmarkPointerEntered(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapControlTransitFeaturePointerEnteredEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_TransitFeaturePointerEntered(value) {
        if (!this.HasProp("__IMapControlDataHelper2")) {
            if ((queryResult := this.QueryInterface(IMapControlDataHelper2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControlDataHelper2 := IMapControlDataHelper2(outPtr)
        }

        return this.__IMapControlDataHelper2.add_TransitFeaturePointerEntered(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TransitFeaturePointerEntered(token) {
        if (!this.HasProp("__IMapControlDataHelper2")) {
            if ((queryResult := this.QueryInterface(IMapControlDataHelper2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControlDataHelper2 := IMapControlDataHelper2(outPtr)
        }

        return this.__IMapControlDataHelper2.remove_TransitFeaturePointerEntered(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapControlBusinessLandmarkPointerExitedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_BusinessLandmarkPointerExited(value) {
        if (!this.HasProp("__IMapControlDataHelper2")) {
            if ((queryResult := this.QueryInterface(IMapControlDataHelper2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControlDataHelper2 := IMapControlDataHelper2(outPtr)
        }

        return this.__IMapControlDataHelper2.add_BusinessLandmarkPointerExited(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BusinessLandmarkPointerExited(token) {
        if (!this.HasProp("__IMapControlDataHelper2")) {
            if ((queryResult := this.QueryInterface(IMapControlDataHelper2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControlDataHelper2 := IMapControlDataHelper2(outPtr)
        }

        return this.__IMapControlDataHelper2.remove_BusinessLandmarkPointerExited(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapControlTransitFeaturePointerExitedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_TransitFeaturePointerExited(value) {
        if (!this.HasProp("__IMapControlDataHelper2")) {
            if ((queryResult := this.QueryInterface(IMapControlDataHelper2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControlDataHelper2 := IMapControlDataHelper2(outPtr)
        }

        return this.__IMapControlDataHelper2.add_TransitFeaturePointerExited(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TransitFeaturePointerExited(token) {
        if (!this.HasProp("__IMapControlDataHelper2")) {
            if ((queryResult := this.QueryInterface(IMapControlDataHelper2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControlDataHelper2 := IMapControlDataHelper2(outPtr)
        }

        return this.__IMapControlDataHelper2.remove_TransitFeaturePointerExited(token)
    }

;@endregion Instance Methods
}
