#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarcodeScannerDisableScannerRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains information about a request to disable the barcode scanner.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerdisablescannerrequesteventargs
 * @namespace Windows.Devices.PointOfService.Provider
 * @version WindowsRuntime 1.4
 */
class BarcodeScannerDisableScannerRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBarcodeScannerDisableScannerRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBarcodeScannerDisableScannerRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the BarcodeScannerDisableScannerRequest object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerdisablescannerrequesteventargs.request
     * @type {BarcodeScannerDisableScannerRequest} 
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
     * @returns {BarcodeScannerDisableScannerRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IBarcodeScannerDisableScannerRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerDisableScannerRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerDisableScannerRequestEventArgs := IBarcodeScannerDisableScannerRequestEventArgs(outPtr)
        }

        return this.__IBarcodeScannerDisableScannerRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerdisablescannerrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IBarcodeScannerDisableScannerRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerDisableScannerRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerDisableScannerRequestEventArgs := IBarcodeScannerDisableScannerRequestEventArgs(outPtr)
        }

        return this.__IBarcodeScannerDisableScannerRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
