#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarcodeScannerEnableScannerRequest.ahk
#Include .\IBarcodeScannerEnableScannerRequest2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the request to enable the barcode scanner.
 * @remarks
 * The system generates an instance of this class and sets it as a property in the BarcodeScannerEnableScannerRequestEventArgs argument of the EnableScannerRequested event.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerenablescannerrequest
 * @namespace Windows.Devices.PointOfService.Provider
 * @version WindowsRuntime 1.4
 */
class BarcodeScannerEnableScannerRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBarcodeScannerEnableScannerRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBarcodeScannerEnableScannerRequest.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Notifies the client app that the request was processed successfully.
     * @remarks
     * This method should be called if the app has successfully completed the operation.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerenablescannerrequest.reportcompletedasync
     */
    ReportCompletedAsync() {
        if (!this.HasProp("__IBarcodeScannerEnableScannerRequest")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerEnableScannerRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerEnableScannerRequest := IBarcodeScannerEnableScannerRequest(outPtr)
        }

        return this.__IBarcodeScannerEnableScannerRequest.ReportCompletedAsync()
    }

    /**
     * Notifies the client that the request was not processed successfully.
     * @remarks
     * This method should be called if the provider app is unable to complete the operation.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerenablescannerrequest.reportfailedasync
     */
    ReportFailedAsync() {
        if (!this.HasProp("__IBarcodeScannerEnableScannerRequest")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerEnableScannerRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerEnableScannerRequest := IBarcodeScannerEnableScannerRequest(outPtr)
        }

        return this.__IBarcodeScannerEnableScannerRequest.ReportFailedAsync()
    }

    /**
     * Notifies the client that the request was not processed successfully.
     * @remarks
     * This method should be called if the provider app is unable to complete the operation.
     * @param {Integer} reason An **Int32** error code that will be converted to an HRESULT and raised as an exception in the calling application. The following values are supported:
     * 
     * <table>
     *    <tr><td>Name</td><td>Value</td><td>Description</td></tr>
     *    <tr><td>E_ABORT</td><td>0x80004004</td><td>Operation aborted</td></tr>
     *    <tr><td>E_ACCESSDENIED</td><td>0x80070005</td><td>General access denied error</td></tr>
     *    <tr><td>E_APPLICATION_EXITING</td><td>0x8000001a</td><td>The application is exiting and cannot service this request</td></tr>
     *    <tr><td>E_BOUNDS</td><td>0x8000000b</td><td>The operation attempted to access data outside the valid range</td></tr>
     *    <tr><td>E_ILLEGAL_METHOD_CALL</td><td>0x8000000e</td><td>A method was called at an unexpected time</td></tr>
     *    <tr><td>E_INVALIDARG</td><td>0x80070057</td><td>One or more arguments are invalid</td></tr>
     *    <tr><td>E_FAIL</td><td>0x80004005</td><td>Unspecified error</td></tr>
     *    <tr><td>E_NOTIMPL</td><td>0x80004001</td><td>Not implemented</td></tr>
     *    <tr><td>E_OUTOFMEMORY</td><td>0x8007000e</td><td>Ran out of memory</td></tr>
     * </table>
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerenablescannerrequest.reportfailedasync
     */
    ReportFailedWithFailedReasonAsync(reason) {
        if (!this.HasProp("__IBarcodeScannerEnableScannerRequest2")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerEnableScannerRequest2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerEnableScannerRequest2 := IBarcodeScannerEnableScannerRequest2(outPtr)
        }

        return this.__IBarcodeScannerEnableScannerRequest2.ReportFailedWithFailedReasonAsync(reason)
    }

    /**
     * Notifies the client that the request was not processed successfully.
     * @remarks
     * This method should be called if the provider app is unable to complete the operation.
     * @param {Integer} reason 
     * @param {HSTRING} failedReasonDescription 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerenablescannerrequest.reportfailedasync
     */
    ReportFailedWithFailedReasonAndDescriptionAsync(reason, failedReasonDescription) {
        if (!this.HasProp("__IBarcodeScannerEnableScannerRequest2")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerEnableScannerRequest2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerEnableScannerRequest2 := IBarcodeScannerEnableScannerRequest2(outPtr)
        }

        return this.__IBarcodeScannerEnableScannerRequest2.ReportFailedWithFailedReasonAndDescriptionAsync(reason, failedReasonDescription)
    }

;@endregion Instance Methods
}
