#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IClaimedCashDrawer.ahk
#Include .\IClaimedCashDrawer2.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ClaimedCashDrawer.ahk
#Include .\ClaimedCashDrawerClosedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides access to exclusive and privileged methods, properties, and events on a point-of-service cash drawer device.
 * @remarks
 * The user gets an instance of ClaimedCashDrawer from the [CashDrawer.ClaimDrawerAsync](cashdrawer_claimdrawerasync_887994265.md) method. Claim is cooperatively managed, so multiple concurrent apps can negotiate which app owns claim.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedcashdrawer
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ClaimedCashDrawer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IClaimedCashDrawer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IClaimedCashDrawer.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The identifier string of the claimed cash drawer device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedcashdrawer.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Indicates whether the cash drawer is operational and can be used.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedcashdrawer.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
    }

    /**
     * Indicates whether the cash drawer is open.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedcashdrawer.isdraweropen
     * @type {Boolean} 
     */
    IsDrawerOpen {
        get => this.get_IsDrawerOpen()
    }

    /**
     * Gets the close alarm for this cash drawer. This is only valid if [IsDrawerOpenSensorAvailable](cashdrawercapabilities_isdraweropensensoravailable.md) is true.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedcashdrawer.closealarm
     * @type {CashDrawerCloseAlarm} 
     */
    CloseAlarm {
        get => this.get_CloseAlarm()
    }

    /**
     * Occurs when the device gets a request to release its exclusive claim.
     * 
     * There is a small window of time (2 seconds) where the app may call [RetainDeviceAsync](claimedcashdrawer_retaindeviceasync_1460106534.md) to keep exclusive claim. Or alternatively, the app may release claim via [Close](claimedcashdrawer_close_811482585.md) to end the window immediately.
     * @type {TypedEventHandler<ClaimedCashDrawer, IInspectable>}
    */
    OnReleaseDeviceRequested {
        get {
            if(!this.HasProp("__OnReleaseDeviceRequested")){
                this.__OnReleaseDeviceRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{db886581-2462-5c81-880c-06112ca70012}"),
                    ClaimedCashDrawer,
                    IInspectable
                )
                this.__OnReleaseDeviceRequestedToken := this.add_ReleaseDeviceRequested(this.__OnReleaseDeviceRequested.iface)
            }
            return this.__OnReleaseDeviceRequested
        }
    }

    /**
     * Event that is raised when the **ClaimedCashDrawer** is closed.
     * @remarks
     * When an app is suspended, all **ClaimedCashDrawer** objects are closed. This event can be useful to determine when cash drawer connections need to be re-established.
     * @type {TypedEventHandler<ClaimedCashDrawer, ClaimedCashDrawerClosedEventArgs>}
    */
    OnClosed {
        get {
            if(!this.HasProp("__OnClosed")){
                this.__OnClosed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b2e562de-ce59-52ee-96fc-dcb3773e8783}"),
                    ClaimedCashDrawer,
                    ClaimedCashDrawerClosedEventArgs
                )
                this.__OnClosedToken := this.add_Closed(this.__OnClosed.iface)
            }
            return this.__OnClosed
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnReleaseDeviceRequestedToken")) {
            this.remove_ReleaseDeviceRequested(this.__OnReleaseDeviceRequestedToken)
            this.__OnReleaseDeviceRequested.iface.Dispose()
        }

        if(this.HasProp("__OnClosedToken")) {
            this.remove_Closed(this.__OnClosedToken)
            this.__OnClosed.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IClaimedCashDrawer")) {
            if ((queryResult := this.QueryInterface(IClaimedCashDrawer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedCashDrawer := IClaimedCashDrawer(outPtr)
        }

        return this.__IClaimedCashDrawer.get_DeviceId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__IClaimedCashDrawer")) {
            if ((queryResult := this.QueryInterface(IClaimedCashDrawer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedCashDrawer := IClaimedCashDrawer(outPtr)
        }

        return this.__IClaimedCashDrawer.get_IsEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDrawerOpen() {
        if (!this.HasProp("__IClaimedCashDrawer")) {
            if ((queryResult := this.QueryInterface(IClaimedCashDrawer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedCashDrawer := IClaimedCashDrawer(outPtr)
        }

        return this.__IClaimedCashDrawer.get_IsDrawerOpen()
    }

    /**
     * 
     * @returns {CashDrawerCloseAlarm} 
     */
    get_CloseAlarm() {
        if (!this.HasProp("__IClaimedCashDrawer")) {
            if ((queryResult := this.QueryInterface(IClaimedCashDrawer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedCashDrawer := IClaimedCashDrawer(outPtr)
        }

        return this.__IClaimedCashDrawer.get_CloseAlarm()
    }

    /**
     * Opens the cash drawer.
     * @remarks
     * All devices support this asynchronous operation.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedcashdrawer.opendrawerasync
     */
    OpenDrawerAsync() {
        if (!this.HasProp("__IClaimedCashDrawer")) {
            if ((queryResult := this.QueryInterface(IClaimedCashDrawer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedCashDrawer := IClaimedCashDrawer(outPtr)
        }

        return this.__IClaimedCashDrawer.OpenDrawerAsync()
    }

    /**
     * Asynchronously notifies the underlying hardware to power on for use.
     * @remarks
     * This behaves identically to the existing POS peripheral API with the exception that this API returns an instance of IAsyncOperation&lt;boolean&gt; instead of IAsyncAction, so the caller does not need to catch exceptions to determine whether the attempt to enable succeeded or not.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedcashdrawer.enableasync
     */
    EnableAsync() {
        if (!this.HasProp("__IClaimedCashDrawer")) {
            if ((queryResult := this.QueryInterface(IClaimedCashDrawer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedCashDrawer := IClaimedCashDrawer(outPtr)
        }

        return this.__IClaimedCashDrawer.EnableAsync()
    }

    /**
     * Notifies the underlying hardware to power off.
     * @remarks
     * This behaves identically to the existing POS peripheral API with the exception that this API returns an instance of IAsyncOperation&lt;boolean&gt; instead of IAsyncAction, so the caller does not need to catch exceptions to determine whether the attempt to disable succeeded or not.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedcashdrawer.disableasync
     */
    DisableAsync() {
        if (!this.HasProp("__IClaimedCashDrawer")) {
            if ((queryResult := this.QueryInterface(IClaimedCashDrawer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedCashDrawer := IClaimedCashDrawer(outPtr)
        }

        return this.__IClaimedCashDrawer.DisableAsync()
    }

    /**
     * Retain the current claim on the cash drawer. This is usually called in response to a [ReleaseDeviceRequested](claimedcashdrawer_releasedevicerequested.md) event notification.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedcashdrawer.retaindeviceasync
     */
    RetainDeviceAsync() {
        if (!this.HasProp("__IClaimedCashDrawer")) {
            if ((queryResult := this.QueryInterface(IClaimedCashDrawer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedCashDrawer := IClaimedCashDrawer(outPtr)
        }

        return this.__IClaimedCashDrawer.RetainDeviceAsync()
    }

    /**
     * Resets the specified device statistics to their defaults.
     * @remarks
     * This method represents a change in state.
     * @param {IIterable<HSTRING>} statisticsCategories The list of names of the statistics to reset. 
     * + An empty string ("") retrieves all statistics.
     * + "U_" retrieves all UnifiedPOS defined statistics.
     * + "M_" retrieves all manufacturer defined statistics.
     * + "name1" and/or "name2" retrieves specific named statistics as defined by the UnifiedPOS or manufacturer.
     * + Any combination of individual and groups names ("name3", "U_", "M_").
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedcashdrawer.resetstatisticsasync
     */
    ResetStatisticsAsync(statisticsCategories) {
        if (!this.HasProp("__IClaimedCashDrawer")) {
            if ((queryResult := this.QueryInterface(IClaimedCashDrawer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedCashDrawer := IClaimedCashDrawer(outPtr)
        }

        return this.__IClaimedCashDrawer.ResetStatisticsAsync(statisticsCategories)
    }

    /**
     * Updates device statistics values using the provided key/value pair.
     * @remarks
     * This method generates a change of state.
     * @param {IIterable<IKeyValuePair<HSTRING, HSTRING>>} statistics The statistics to update.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedcashdrawer.updatestatisticsasync
     */
    UpdateStatisticsAsync(statistics) {
        if (!this.HasProp("__IClaimedCashDrawer")) {
            if ((queryResult := this.QueryInterface(IClaimedCashDrawer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedCashDrawer := IClaimedCashDrawer(outPtr)
        }

        return this.__IClaimedCashDrawer.UpdateStatisticsAsync(statistics)
    }

    /**
     * 
     * @param {TypedEventHandler<ClaimedCashDrawer, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReleaseDeviceRequested(handler) {
        if (!this.HasProp("__IClaimedCashDrawer")) {
            if ((queryResult := this.QueryInterface(IClaimedCashDrawer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedCashDrawer := IClaimedCashDrawer(outPtr)
        }

        return this.__IClaimedCashDrawer.add_ReleaseDeviceRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReleaseDeviceRequested(token) {
        if (!this.HasProp("__IClaimedCashDrawer")) {
            if ((queryResult := this.QueryInterface(IClaimedCashDrawer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedCashDrawer := IClaimedCashDrawer(outPtr)
        }

        return this.__IClaimedCashDrawer.remove_ReleaseDeviceRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<ClaimedCashDrawer, ClaimedCashDrawerClosedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
        if (!this.HasProp("__IClaimedCashDrawer2")) {
            if ((queryResult := this.QueryInterface(IClaimedCashDrawer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedCashDrawer2 := IClaimedCashDrawer2(outPtr)
        }

        return this.__IClaimedCashDrawer2.add_Closed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closed(token) {
        if (!this.HasProp("__IClaimedCashDrawer2")) {
            if ((queryResult := this.QueryInterface(IClaimedCashDrawer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClaimedCashDrawer2 := IClaimedCashDrawer2(outPtr)
        }

        return this.__IClaimedCashDrawer2.remove_Closed(token)
    }

    /**
     * Disposes the claimed cash drawer, releases claim on the device, and disables the device the same way as calling [DisableAsync.](claimedcashdrawer_disableasync_490053963.md)
     * @remarks
     * [Close](../windows.foundation/iclosable_close_811482585.md) methods aren't callable through Visual C++ component extensions (C++/CX) on Windows Runtime class instances where the class implemented [IClosable](../windows.foundation/iclosable.md). Instead, Visual C++ component extensions (C++/CX) code for runtime classes should call the destructor or set the last reference to **null**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.claimedcashdrawer.close
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
