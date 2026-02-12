#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IOfflineMapPackage.ahk
#Include .\IOfflineMapPackageStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\OfflineMapPackage.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * [Deprecated - see Remarks.] Represents the map data for a particular geographical region. The data can be downloaded and used offline.
 * @remarks
 * > [!IMPORTANT]
 * > The UWP [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) and Windows Maps platform APIs ([Windows.Services.Maps.*](../windows.services.maps/windows_services_maps.md)) are deprecated and may not be available in future versions of Windows. For more information, see [Resources for deprecated features](/windows/whats-new/deprecated-features-resources#windows-uwp-map-control-and-windows-maps-platform-apis).
 * 
 * > [!IMPORTANT]
 * > **Bing Maps for Enterprise service retirement**
 * >
 * > The UWP [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) and map services from the [Windows.Services.Maps](../windows.services.maps/windows_services_maps.md) namespaces rely on Bing Maps. Bing Maps for Enterprise is deprecated and will be retired, at which point the MapControl and services will no longer receive data.
 * >
 * > For more information, see the [Bing Maps Developer Center](https://www.bingmapsportal.com/) and [Bing Maps documentation](/bingmaps/getting-started/).
 * 
 * Use this class to asynchronously find map packages that you are interested in using offline. You can check the status of packages to determine whether those packages exist on your local system. If they do not, you can asynchronously download them to your system.
 * 
 * You can then access that data in system controls such as the [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md), and from other objects in the [Windows.Services.Maps](../windows.services.maps/windows_services_maps.md) namespace.
 * 
 * > [!IMPORTANT]
 * > Using this class requires the `Offline Maps Management` capability (see [App capability declarations](/windows/uwp/packaging/app-capability-declarations)).
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.offlinemaps.offlinemappackage
 * @namespace Windows.Services.Maps.OfflineMaps
 * @version WindowsRuntime 1.4
 */
class OfflineMapPackage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IOfflineMapPackage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IOfflineMapPackage.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Starts an asynchronous operation to find a map package that contains map data for specified geographical location.
     * @remarks
     * This query can find multiple matches. It can also find no matches at all (For example: if you specify a border region or an area in the middle of the ocean).
     * @param {Geopoint} queryPoint The geographical location that you want to locate a map package for.
     * @returns {IAsyncOperation<OfflineMapPackageQueryResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.offlinemaps.offlinemappackage.findpackagesasync
     */
    static FindPackagesAsync(queryPoint) {
        if (!OfflineMapPackage.HasProp("__IOfflineMapPackageStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.OfflineMaps.OfflineMapPackage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IOfflineMapPackageStatics.IID)
            OfflineMapPackage.__IOfflineMapPackageStatics := IOfflineMapPackageStatics(factoryPtr)
        }

        return OfflineMapPackage.__IOfflineMapPackageStatics.FindPackagesAsync(queryPoint)
    }

    /**
     * Starts an asynchronous operation to find a map package that contains map data for specified four-sided geographic area.
     * @remarks
     * This query can find multiple matches. It can also find no matches at all (For example: if you specify a border region or an area in the middle of the ocean).
     * @param {GeoboundingBox} queryBoundingBox A specified four-sided geographic area that defines the area that you want to locate a map package for.
     * @returns {IAsyncOperation<OfflineMapPackageQueryResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.offlinemaps.offlinemappackage.findpackagesinboundingboxasync
     */
    static FindPackagesInBoundingBoxAsync(queryBoundingBox) {
        if (!OfflineMapPackage.HasProp("__IOfflineMapPackageStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.OfflineMaps.OfflineMapPackage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IOfflineMapPackageStatics.IID)
            OfflineMapPackage.__IOfflineMapPackageStatics := IOfflineMapPackageStatics(factoryPtr)
        }

        return OfflineMapPackage.__IOfflineMapPackageStatics.FindPackagesInBoundingBoxAsync(queryBoundingBox)
    }

    /**
     * Starts an asynchronous operation to find a map package that contains map data for specified geographic area.
     * @remarks
     * This query can find multiple matches. It can also find no matches at all (For example: if you specify a border region or an area in the middle of the ocean).
     * @param {Geocircle} queryCircle The geographic area that defines the area that you want to locate a map package for.
     * @returns {IAsyncOperation<OfflineMapPackageQueryResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.offlinemaps.offlinemappackage.findpackagesingeocircleasync
     */
    static FindPackagesInGeocircleAsync(queryCircle) {
        if (!OfflineMapPackage.HasProp("__IOfflineMapPackageStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.OfflineMaps.OfflineMapPackage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IOfflineMapPackageStatics.IID)
            OfflineMapPackage.__IOfflineMapPackageStatics := IOfflineMapPackageStatics(factoryPtr)
        }

        return OfflineMapPackage.__IOfflineMapPackageStatics.FindPackagesInGeocircleAsync(queryCircle)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the status of a map package (For example, whether the package is downloaded to your local system or not).
     * @remarks
     * You can listen for changes in that status by handling the [StatusChanged](offlinemappackage_statuschanged.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.offlinemaps.offlinemappackage.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the display name of a geographic location for the offline map package.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.offlinemaps.offlinemappackage.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the surrounding or containing region of the offline map package (for example: USA).
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.offlinemaps.offlinemappackage.enclosingregionname
     * @type {HSTRING} 
     */
    EnclosingRegionName {
        get => this.get_EnclosingRegionName()
    }

    /**
     * Gets the estimated size in bytes of the offline map package.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.offlinemaps.offlinemappackage.estimatedsizeinbytes
     * @type {Integer} 
     */
    EstimatedSizeInBytes {
        get => this.get_EstimatedSizeInBytes()
    }

    /**
     * Occurs when the status of an [OfflineMapPackageQueryResult](offlinemappackagequeryresult.md) changes.
     * @remarks
     * Handle this event if you want to know whether a status of map package that you previously searched for has changed. For example, if the [Status](offlinemappackage_status.md) property of a map package previously returned a value of **Downloading**, this event notifies you when the status changes to **Downloaded**.
     * @type {TypedEventHandler<OfflineMapPackage, IInspectable>}
    */
    OnStatusChanged {
        get {
            if(!this.HasProp("__OnStatusChanged")){
                this.__OnStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{2d2e0d20-826f-560c-b1c1-b4bd6fbf329a}"),
                    OfflineMapPackage,
                    IInspectable
                )
                this.__OnStatusChangedToken := this.add_StatusChanged(this.__OnStatusChanged.iface)
            }
            return this.__OnStatusChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnStatusChangedToken")) {
            this.remove_StatusChanged(this.__OnStatusChangedToken)
            this.__OnStatusChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IOfflineMapPackage")) {
            if ((queryResult := this.QueryInterface(IOfflineMapPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOfflineMapPackage := IOfflineMapPackage(outPtr)
        }

        return this.__IOfflineMapPackage.get_Status()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IOfflineMapPackage")) {
            if ((queryResult := this.QueryInterface(IOfflineMapPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOfflineMapPackage := IOfflineMapPackage(outPtr)
        }

        return this.__IOfflineMapPackage.get_DisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EnclosingRegionName() {
        if (!this.HasProp("__IOfflineMapPackage")) {
            if ((queryResult := this.QueryInterface(IOfflineMapPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOfflineMapPackage := IOfflineMapPackage(outPtr)
        }

        return this.__IOfflineMapPackage.get_EnclosingRegionName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EstimatedSizeInBytes() {
        if (!this.HasProp("__IOfflineMapPackage")) {
            if ((queryResult := this.QueryInterface(IOfflineMapPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOfflineMapPackage := IOfflineMapPackage(outPtr)
        }

        return this.__IOfflineMapPackage.get_EstimatedSizeInBytes()
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StatusChanged(token) {
        if (!this.HasProp("__IOfflineMapPackage")) {
            if ((queryResult := this.QueryInterface(IOfflineMapPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOfflineMapPackage := IOfflineMapPackage(outPtr)
        }

        return this.__IOfflineMapPackage.remove_StatusChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<OfflineMapPackage, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_StatusChanged(value) {
        if (!this.HasProp("__IOfflineMapPackage")) {
            if ((queryResult := this.QueryInterface(IOfflineMapPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOfflineMapPackage := IOfflineMapPackage(outPtr)
        }

        return this.__IOfflineMapPackage.add_StatusChanged(value)
    }

    /**
     * Starts an asynchronous operation to request the download of a map package to your local system.
     * @returns {IAsyncOperation<OfflineMapPackageStartDownloadResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.offlinemaps.offlinemappackage.requeststartdownloadasync
     */
    RequestStartDownloadAsync() {
        if (!this.HasProp("__IOfflineMapPackage")) {
            if ((queryResult := this.QueryInterface(IOfflineMapPackage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOfflineMapPackage := IOfflineMapPackage(outPtr)
        }

        return this.__IOfflineMapPackage.RequestStartDownloadAsync()
    }

;@endregion Instance Methods
}
