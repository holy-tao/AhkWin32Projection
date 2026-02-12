#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarcodeScannerGetSymbologyAttributesRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains information about a request to get the attributes of a barcode symbology.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannergetsymbologyattributesrequesteventargs
 * @namespace Windows.Devices.PointOfService.Provider
 * @version WindowsRuntime 1.4
 */
class BarcodeScannerGetSymbologyAttributesRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBarcodeScannerGetSymbologyAttributesRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBarcodeScannerGetSymbologyAttributesRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the BarcodeScannerGetSymbologyAttributesRequest object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannergetsymbologyattributesrequesteventargs.request
     * @type {BarcodeScannerGetSymbologyAttributesRequest} 
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
     * @returns {BarcodeScannerGetSymbologyAttributesRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IBarcodeScannerGetSymbologyAttributesRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerGetSymbologyAttributesRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerGetSymbologyAttributesRequestEventArgs := IBarcodeScannerGetSymbologyAttributesRequestEventArgs(outPtr)
        }

        return this.__IBarcodeScannerGetSymbologyAttributesRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannergetsymbologyattributesrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IBarcodeScannerGetSymbologyAttributesRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerGetSymbologyAttributesRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerGetSymbologyAttributesRequestEventArgs := IBarcodeScannerGetSymbologyAttributesRequestEventArgs(outPtr)
        }

        return this.__IBarcodeScannerGetSymbologyAttributesRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
