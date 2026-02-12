#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarcodeScannerStopSoftwareTriggerRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains information about a request to stop software trigger.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerstopsoftwaretriggerrequesteventargs
 * @namespace Windows.Devices.PointOfService.Provider
 * @version WindowsRuntime 1.4
 */
class BarcodeScannerStopSoftwareTriggerRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBarcodeScannerStopSoftwareTriggerRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBarcodeScannerStopSoftwareTriggerRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the BarcodeScannerStopSoftwareTriggerRequest object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerstopsoftwaretriggerrequesteventargs.request
     * @type {BarcodeScannerStopSoftwareTriggerRequest} 
     */
    Request {
        get => this.get_Request()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {BarcodeScannerStopSoftwareTriggerRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IBarcodeScannerStopSoftwareTriggerRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerStopSoftwareTriggerRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerStopSoftwareTriggerRequestEventArgs := IBarcodeScannerStopSoftwareTriggerRequestEventArgs(outPtr)
        }

        return this.__IBarcodeScannerStopSoftwareTriggerRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerstopsoftwaretriggerrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IBarcodeScannerStopSoftwareTriggerRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerStopSoftwareTriggerRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerStopSoftwareTriggerRequestEventArgs := IBarcodeScannerStopSoftwareTriggerRequestEventArgs(outPtr)
        }

        return this.__IBarcodeScannerStopSoftwareTriggerRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
