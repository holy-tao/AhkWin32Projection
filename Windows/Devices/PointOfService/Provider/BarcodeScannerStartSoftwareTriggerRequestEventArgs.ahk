#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarcodeScannerStartSoftwareTriggerRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains information about a request to signal a barcode scanner to start scanning.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerstartsoftwaretriggerrequesteventargs
 * @namespace Windows.Devices.PointOfService.Provider
 * @version WindowsRuntime 1.4
 */
class BarcodeScannerStartSoftwareTriggerRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBarcodeScannerStartSoftwareTriggerRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBarcodeScannerStartSoftwareTriggerRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the BarcodeScannerStartSoftwareTriggerRequest object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerstartsoftwaretriggerrequesteventargs.request
     * @type {BarcodeScannerStartSoftwareTriggerRequest} 
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
     * @returns {BarcodeScannerStartSoftwareTriggerRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IBarcodeScannerStartSoftwareTriggerRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerStartSoftwareTriggerRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerStartSoftwareTriggerRequestEventArgs := IBarcodeScannerStartSoftwareTriggerRequestEventArgs(outPtr)
        }

        return this.__IBarcodeScannerStartSoftwareTriggerRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerstartsoftwaretriggerrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IBarcodeScannerStartSoftwareTriggerRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerStartSoftwareTriggerRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerStartSoftwareTriggerRequestEventArgs := IBarcodeScannerStartSoftwareTriggerRequestEventArgs(outPtr)
        }

        return this.__IBarcodeScannerStartSoftwareTriggerRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
