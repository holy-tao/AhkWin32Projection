#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarcodeScannerProviderTriggerDetails.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents trigger information about the barcode scanner background task, where data will be transferred between the app and its caller.
 * @remarks
 * Background task code is passed in an instance of this class via the IBackgroundTaskInstance.TriggerDetails property.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerprovidertriggerdetails
 * @namespace Windows.Devices.PointOfService.Provider
 * @version WindowsRuntime 1.4
 */
class BarcodeScannerProviderTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBarcodeScannerProviderTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBarcodeScannerProviderTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the connection object used to provide barcode scanning to a client app.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerprovidertriggerdetails.connection
     * @type {BarcodeScannerProviderConnection} 
     */
    Connection {
        get => this.get_Connection()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {BarcodeScannerProviderConnection} 
     */
    get_Connection() {
        if (!this.HasProp("__IBarcodeScannerProviderTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerProviderTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerProviderTriggerDetails := IBarcodeScannerProviderTriggerDetails(outPtr)
        }

        return this.__IBarcodeScannerProviderTriggerDetails.get_Connection()
    }

;@endregion Instance Methods
}
