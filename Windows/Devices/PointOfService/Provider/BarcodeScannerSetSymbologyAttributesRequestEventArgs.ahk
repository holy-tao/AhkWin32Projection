#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarcodeScannerSetSymbologyAttributesRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains information about a request to set the attributes of a barcode symbology.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannersetsymbologyattributesrequesteventargs
 * @namespace Windows.Devices.PointOfService.Provider
 * @version WindowsRuntime 1.4
 */
class BarcodeScannerSetSymbologyAttributesRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBarcodeScannerSetSymbologyAttributesRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBarcodeScannerSetSymbologyAttributesRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the BarcodeScannerSetSymbologyAttributesRequest object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannersetsymbologyattributesrequesteventargs.request
     * @type {BarcodeScannerSetSymbologyAttributesRequest} 
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
     * @returns {BarcodeScannerSetSymbologyAttributesRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IBarcodeScannerSetSymbologyAttributesRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerSetSymbologyAttributesRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerSetSymbologyAttributesRequestEventArgs := IBarcodeScannerSetSymbologyAttributesRequestEventArgs(outPtr)
        }

        return this.__IBarcodeScannerSetSymbologyAttributesRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannersetsymbologyattributesrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IBarcodeScannerSetSymbologyAttributesRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerSetSymbologyAttributesRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerSetSymbologyAttributesRequestEventArgs := IBarcodeScannerSetSymbologyAttributesRequestEventArgs(outPtr)
        }

        return this.__IBarcodeScannerSetSymbologyAttributesRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
