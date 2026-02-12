#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarcodeScannerSetActiveSymbologiesRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains information about a request to set the barcode symbologies for the device to use.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannersetactivesymbologiesrequesteventargs
 * @namespace Windows.Devices.PointOfService.Provider
 * @version WindowsRuntime 1.4
 */
class BarcodeScannerSetActiveSymbologiesRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBarcodeScannerSetActiveSymbologiesRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBarcodeScannerSetActiveSymbologiesRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the BarcodeScannerSetActiveSymbologiesRequest object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannersetactivesymbologiesrequesteventargs.request
     * @type {BarcodeScannerSetActiveSymbologiesRequest} 
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
     * @returns {BarcodeScannerSetActiveSymbologiesRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IBarcodeScannerSetActiveSymbologiesRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerSetActiveSymbologiesRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerSetActiveSymbologiesRequestEventArgs := IBarcodeScannerSetActiveSymbologiesRequestEventArgs(outPtr)
        }

        return this.__IBarcodeScannerSetActiveSymbologiesRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannersetactivesymbologiesrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IBarcodeScannerSetActiveSymbologiesRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerSetActiveSymbologiesRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerSetActiveSymbologiesRequestEventArgs := IBarcodeScannerSetActiveSymbologiesRequestEventArgs(outPtr)
        }

        return this.__IBarcodeScannerSetActiveSymbologiesRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
