#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWiFiDirectAdvertisementPublisherStatusChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for a [StatusChanged](wifidirectadvertisementpublisher_statuschanged.md) event on a [WiFiDirectAdvertisementPublisher](wifidirectadvertisementpublisher.md).
 * @remarks
 * A WiFiDirectAdvertisementPublisherStatusChangedEventArgs instance is created when the [StatusChanged](wifidirectadvertisementpublisher_statuschanged.md) event occurs on a [WiFiDirectAdvertisementPublisher](wifidirectadvertisementpublisher.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectadvertisementpublisherstatuschangedeventargs
 * @namespace Windows.Devices.WiFiDirect
 * @version WindowsRuntime 1.4
 */
class WiFiDirectAdvertisementPublisherStatusChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWiFiDirectAdvertisementPublisherStatusChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWiFiDirectAdvertisementPublisherStatusChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the new status of the [WiFiDirectAdvertisementPublisher](wifidirectadvertisementpublisher.md).
     * @remarks
     * The current status of the [WiFiDirectAdvertisementPublisher](wifidirectadvertisementpublisher.md) might have changed by the time this property is accessed. This property reflects the new status of the [WiFiDirectAdvertisementPublisher](wifidirectadvertisementpublisher.md) at the time it was changed and the [StatusChanged](wifidirectadvertisementpublisher_statuschanged.md) event occurred.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectadvertisementpublisherstatuschangedeventargs.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the error status for a [StatusChanged](wifidirectadvertisementpublisher_statuschanged.md) event on a [WiFiDirectAdvertisementPublisher](wifidirectadvertisementpublisher.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectadvertisementpublisherstatuschangedeventargs.error
     * @type {Integer} 
     */
    Error {
        get => this.get_Error()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IWiFiDirectAdvertisementPublisherStatusChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectAdvertisementPublisherStatusChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectAdvertisementPublisherStatusChangedEventArgs := IWiFiDirectAdvertisementPublisherStatusChangedEventArgs(outPtr)
        }

        return this.__IWiFiDirectAdvertisementPublisherStatusChangedEventArgs.get_Status()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Error() {
        if (!this.HasProp("__IWiFiDirectAdvertisementPublisherStatusChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectAdvertisementPublisherStatusChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectAdvertisementPublisherStatusChangedEventArgs := IWiFiDirectAdvertisementPublisherStatusChangedEventArgs(outPtr)
        }

        return this.__IWiFiDirectAdvertisementPublisherStatusChangedEventArgs.get_Error()
    }

;@endregion Instance Methods
}
