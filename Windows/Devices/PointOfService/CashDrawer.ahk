#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICashDrawer.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\ICashDrawerStatics.ahk
#Include .\ICashDrawerStatics2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\CashDrawer.ahk
#Include .\CashDrawerStatusUpdatedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * A cash drawer device in a retail scenario.
 * @remarks
 * To get a CashDrawer object, use the [FromIdAsync](cashdrawer_fromidasync_1322863552.md) or [GetDefaultAsync](posprinter_getdefaultasync_1549573963.md) static methods.
 * 
 * See the [cash drawer sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/CashDrawer) for an example implementation.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawer
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class CashDrawer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICashDrawer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICashDrawer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the default paired or locally-connected cash drawer.
     * @returns {IAsyncOperation<CashDrawer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawer.getdefaultasync
     */
    static GetDefaultAsync() {
        if (!CashDrawer.HasProp("__ICashDrawerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.CashDrawer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICashDrawerStatics.IID)
            CashDrawer.__ICashDrawerStatics := ICashDrawerStatics(factoryPtr)
        }

        return CashDrawer.__ICashDrawerStatics.GetDefaultAsync()
    }

    /**
     * Creates [CashDrawer](cashdrawer.md) object from the [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md).
     * @param {HSTRING} deviceId The [DeviceInformation.Id](../windows.devices.enumeration/deviceinformation_id.md) that identifies a specific cash drawer, which can be retrieved from the [DeviceId](barcodescanner_deviceid.md) property.
     * @returns {IAsyncOperation<CashDrawer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawer.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!CashDrawer.HasProp("__ICashDrawerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.CashDrawer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICashDrawerStatics.IID)
            CashDrawer.__ICashDrawerStatics := ICashDrawerStatics(factoryPtr)
        }

        return CashDrawer.__ICashDrawerStatics.FromIdAsync(deviceId)
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string that you can use to list the cash drawers available over the specified connection types
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawer.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!CashDrawer.HasProp("__ICashDrawerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.CashDrawer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICashDrawerStatics.IID)
            CashDrawer.__ICashDrawerStatics := ICashDrawerStatics(factoryPtr)
        }

        return CashDrawer.__ICashDrawerStatics.GetDeviceSelector()
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string that you can use to list the available cash drawers.
     * @param {Integer} connectionTypes 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawer.getdeviceselector
     */
    static GetDeviceSelectorWithConnectionTypes(connectionTypes) {
        if (!CashDrawer.HasProp("__ICashDrawerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.CashDrawer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICashDrawerStatics2.IID)
            CashDrawer.__ICashDrawerStatics2 := ICashDrawerStatics2(factoryPtr)
        }

        return CashDrawer.__ICashDrawerStatics2.GetDeviceSelectorWithConnectionTypes(connectionTypes)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The identifier string of the cash drawer device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawer.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * The functionality of the cash drawer device as exposed by API.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawer.capabilities
     * @type {CashDrawerCapabilities} 
     */
    Capabilities {
        get => this.get_Capabilities()
    }

    /**
     * Get the current power and availability status of the cash drawer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawer.status
     * @type {CashDrawerStatus} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Indicates whether the cash drawer is open.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawer.isdraweropen
     * @type {Boolean} 
     */
    IsDrawerOpen {
        get => this.get_IsDrawerOpen()
    }

    /**
     * Gets the [CashDrawerEventSource](cashdrawereventsource.md) to allow the app to detect the open/close state of the drawer. The actual current state is reported by [IsDrawerOpen.](cashdrawer_isdraweropen.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawer.drawereventsource
     * @type {CashDrawerEventSource} 
     */
    DrawerEventSource {
        get => this.get_DrawerEventSource()
    }

    /**
     * Indicates there has been a change in the power availability status of the drawer.
     * @type {TypedEventHandler<CashDrawer, CashDrawerStatusUpdatedEventArgs>}
    */
    OnStatusUpdated {
        get {
            if(!this.HasProp("__OnStatusUpdated")){
                this.__OnStatusUpdated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{64662ef4-cb0e-5c6f-a820-7d0a769554c9}"),
                    CashDrawer,
                    CashDrawerStatusUpdatedEventArgs
                )
                this.__OnStatusUpdatedToken := this.add_StatusUpdated(this.__OnStatusUpdated.iface)
            }
            return this.__OnStatusUpdated
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnStatusUpdatedToken")) {
            this.remove_StatusUpdated(this.__OnStatusUpdatedToken)
            this.__OnStatusUpdated.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__ICashDrawer")) {
            if ((queryResult := this.QueryInterface(ICashDrawer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawer := ICashDrawer(outPtr)
        }

        return this.__ICashDrawer.get_DeviceId()
    }

    /**
     * 
     * @returns {CashDrawerCapabilities} 
     */
    get_Capabilities() {
        if (!this.HasProp("__ICashDrawer")) {
            if ((queryResult := this.QueryInterface(ICashDrawer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawer := ICashDrawer(outPtr)
        }

        return this.__ICashDrawer.get_Capabilities()
    }

    /**
     * 
     * @returns {CashDrawerStatus} 
     */
    get_Status() {
        if (!this.HasProp("__ICashDrawer")) {
            if ((queryResult := this.QueryInterface(ICashDrawer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawer := ICashDrawer(outPtr)
        }

        return this.__ICashDrawer.get_Status()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDrawerOpen() {
        if (!this.HasProp("__ICashDrawer")) {
            if ((queryResult := this.QueryInterface(ICashDrawer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawer := ICashDrawer(outPtr)
        }

        return this.__ICashDrawer.get_IsDrawerOpen()
    }

    /**
     * 
     * @returns {CashDrawerEventSource} 
     */
    get_DrawerEventSource() {
        if (!this.HasProp("__ICashDrawer")) {
            if ((queryResult := this.QueryInterface(ICashDrawer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawer := ICashDrawer(outPtr)
        }

        return this.__ICashDrawer.get_DrawerEventSource()
    }

    /**
     * Attempts to get exclusive access on the cash drawer.
     * @returns {IAsyncOperation<ClaimedCashDrawer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawer.claimdrawerasync
     */
    ClaimDrawerAsync() {
        if (!this.HasProp("__ICashDrawer")) {
            if ((queryResult := this.QueryInterface(ICashDrawer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawer := ICashDrawer(outPtr)
        }

        return this.__ICashDrawer.ClaimDrawerAsync()
    }

    /**
     * Gets the device's health state asynchronously.
     * @remarks
     * This feature behaves identically to corresponding features in the other POS peripherals, and support for this operation is required by the UPOS standard.
     * @param {Integer} level The specified health check level.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawer.checkhealthasync
     */
    CheckHealthAsync(level) {
        if (!this.HasProp("__ICashDrawer")) {
            if ((queryResult := this.QueryInterface(ICashDrawer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawer := ICashDrawer(outPtr)
        }

        return this.__ICashDrawer.CheckHealthAsync(level)
    }

    /**
     * Retrieves the requested statistics from the cash drawer.
     * @param {IIterable<HSTRING>} statisticsCategories The list of statistics to retrieve.
     * + An empty string ("") retrieves all statistics.
     * + "U_" retrieves all UnifiedPOS defined statistics.
     * + "M_" retrieves all manufacturer defined statistics.
     * + "name1" and/or "name2" retrieves specific named statistics as defined by the UnifiedPOS or manufacturer.
     * + Any combination of individual and groups names ("name3", "U_", "M_").
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawer.getstatisticsasync
     */
    GetStatisticsAsync(statisticsCategories) {
        if (!this.HasProp("__ICashDrawer")) {
            if ((queryResult := this.QueryInterface(ICashDrawer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawer := ICashDrawer(outPtr)
        }

        return this.__ICashDrawer.GetStatisticsAsync(statisticsCategories)
    }

    /**
     * 
     * @param {TypedEventHandler<CashDrawer, CashDrawerStatusUpdatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StatusUpdated(handler) {
        if (!this.HasProp("__ICashDrawer")) {
            if ((queryResult := this.QueryInterface(ICashDrawer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawer := ICashDrawer(outPtr)
        }

        return this.__ICashDrawer.add_StatusUpdated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StatusUpdated(token) {
        if (!this.HasProp("__ICashDrawer")) {
            if ((queryResult := this.QueryInterface(ICashDrawer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICashDrawer := ICashDrawer(outPtr)
        }

        return this.__ICashDrawer.remove_StatusUpdated(token)
    }

    /**
     * Close the cash drawer session.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.cashdrawer.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
