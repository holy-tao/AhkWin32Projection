#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarcodeScannerEnableScannerRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains information about a request to enable a barcode scanner.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerenablescannerrequesteventargs
 * @namespace Windows.Devices.PointOfService.Provider
 * @version WindowsRuntime 1.4
 */
class BarcodeScannerEnableScannerRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBarcodeScannerEnableScannerRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBarcodeScannerEnableScannerRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the BarcodeScannerEnableScannerRequest object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerenablescannerrequesteventargs.request
     * @type {BarcodeScannerEnableScannerRequest} 
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
     * @returns {BarcodeScannerEnableScannerRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IBarcodeScannerEnableScannerRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerEnableScannerRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerEnableScannerRequestEventArgs := IBarcodeScannerEnableScannerRequestEventArgs(outPtr)
        }

        return this.__IBarcodeScannerEnableScannerRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerenablescannerrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IBarcodeScannerEnableScannerRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerEnableScannerRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerEnableScannerRequestEventArgs := IBarcodeScannerEnableScannerRequestEventArgs(outPtr)
        }

        return this.__IBarcodeScannerEnableScannerRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
