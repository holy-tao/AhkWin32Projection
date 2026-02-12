#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWiFiDirectAdvertisementPublisher.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\WiFiDirectAdvertisementPublisher.ahk
#Include .\WiFiDirectAdvertisementPublisherStatusChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * An object to publish Wi-Fi Direct advertisements.
 * @remarks
 * Windows 10, version 1607, supports Mobile Hotspot, an enhanced version of the mobile broadband tethering feature. 
 * If Mobile Hotspot is running, the functionality of this class is not supported. 
 * It is likely to stop working. 
 * 
 * The Mobile Hotspot and Wi-Fi Direct technology cannot run at the same time. 
 * Mobile Hotspot takes precedence over all Wi-Fi Direct scenarios.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectadvertisementpublisher
 * @namespace Windows.Devices.WiFiDirect
 * @version WindowsRuntime 1.4
 */
class WiFiDirectAdvertisementPublisher extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWiFiDirectAdvertisementPublisher

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWiFiDirectAdvertisementPublisher.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Wi-Fi Direct advertisement to publish.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectadvertisementpublisher.advertisement
     * @type {WiFiDirectAdvertisement} 
     */
    Advertisement {
        get => this.get_Advertisement()
    }

    /**
     * Gets the current status of the [WiFiDirectAdvertisementPublisher](wifidirectadvertisementpublisher.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectadvertisementpublisher.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Notification that the status of the [WiFiDirectAdvertisementPublisher](wifidirectadvertisementpublisher.md) has changed.
     * @type {TypedEventHandler<WiFiDirectAdvertisementPublisher, WiFiDirectAdvertisementPublisherStatusChangedEventArgs>}
    */
    OnStatusChanged {
        get {
            if(!this.HasProp("__OnStatusChanged")){
                this.__OnStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{de73cba7-370d-550c-b23a-53dd0b4e480d}"),
                    WiFiDirectAdvertisementPublisher,
                    WiFiDirectAdvertisementPublisherStatusChangedEventArgs
                )
                this.__OnStatusChangedToken := this.add_StatusChanged(this.__OnStatusChanged.iface)
            }
            return this.__OnStatusChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [WiFiDirectAdvertisementPublisher](wifidirectadvertisementpublisher.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.WiFiDirect.WiFiDirectAdvertisementPublisher")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

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
     * @returns {WiFiDirectAdvertisement} 
     */
    get_Advertisement() {
        if (!this.HasProp("__IWiFiDirectAdvertisementPublisher")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectAdvertisementPublisher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectAdvertisementPublisher := IWiFiDirectAdvertisementPublisher(outPtr)
        }

        return this.__IWiFiDirectAdvertisementPublisher.get_Advertisement()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IWiFiDirectAdvertisementPublisher")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectAdvertisementPublisher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectAdvertisementPublisher := IWiFiDirectAdvertisementPublisher(outPtr)
        }

        return this.__IWiFiDirectAdvertisementPublisher.get_Status()
    }

    /**
     * 
     * @param {TypedEventHandler<WiFiDirectAdvertisementPublisher, WiFiDirectAdvertisementPublisherStatusChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StatusChanged(handler) {
        if (!this.HasProp("__IWiFiDirectAdvertisementPublisher")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectAdvertisementPublisher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectAdvertisementPublisher := IWiFiDirectAdvertisementPublisher(outPtr)
        }

        return this.__IWiFiDirectAdvertisementPublisher.add_StatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StatusChanged(token) {
        if (!this.HasProp("__IWiFiDirectAdvertisementPublisher")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectAdvertisementPublisher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectAdvertisementPublisher := IWiFiDirectAdvertisementPublisher(outPtr)
        }

        return this.__IWiFiDirectAdvertisementPublisher.remove_StatusChanged(token)
    }

    /**
     * Starts the Wi-Fi Direct advertisement.
     * @remarks
     * The status of the [WiFiDirectAdvertisementPublisher](wifidirectadvertisementpublisher.md) will transition to the **Started** state or to the **Aborted** state if the request failed immediately due to an error.
     * 
     * The [WiFiDirectAdvertisementPublisher](wifidirectadvertisementpublisher.md) will be automatically stopped when an app is suspended if the [ListenStateDiscoverability](wifidirectadvertisement_listenstatediscoverability.md) property on the [WiFiDirectAdvertisement](wifidirectadvertisement.md) is set to **Normal**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectadvertisementpublisher.start
     */
    Start() {
        if (!this.HasProp("__IWiFiDirectAdvertisementPublisher")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectAdvertisementPublisher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectAdvertisementPublisher := IWiFiDirectAdvertisementPublisher(outPtr)
        }

        return this.__IWiFiDirectAdvertisementPublisher.Start()
    }

    /**
     * Stops the Wi-Fi Direct advertisement.
     * @remarks
     * Calling the Stop method in the **Stopped** or **Aborted** state has no effect.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectadvertisementpublisher.stop
     */
    Stop() {
        if (!this.HasProp("__IWiFiDirectAdvertisementPublisher")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectAdvertisementPublisher.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectAdvertisementPublisher := IWiFiDirectAdvertisementPublisher(outPtr)
        }

        return this.__IWiFiDirectAdvertisementPublisher.Stop()
    }

;@endregion Instance Methods
}
