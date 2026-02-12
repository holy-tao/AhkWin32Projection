#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBarcodeScannerHideVideoPreviewRequest.ahk
#Include .\IBarcodeScannerHideVideoPreviewRequest2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the request to hide a video preview window.
 * @remarks
 * The system generates an instance of this class and sets it as a property in the BarcodeScannerHideVideoPreviewRequestEventArgs argument of the HideVideoPreviewRequested event.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerhidevideopreviewrequest
 * @namespace Windows.Devices.PointOfService.Provider
 * @version WindowsRuntime 1.4
 */
class BarcodeScannerHideVideoPreviewRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBarcodeScannerHideVideoPreviewRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBarcodeScannerHideVideoPreviewRequest.IID

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
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerhidevideopreviewrequest.reportcompletedasync
     */
    ReportCompletedAsync() {
        if (!this.HasProp("__IBarcodeScannerHideVideoPreviewRequest")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerHideVideoPreviewRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerHideVideoPreviewRequest := IBarcodeScannerHideVideoPreviewRequest(outPtr)
        }

        return this.__IBarcodeScannerHideVideoPreviewRequest.ReportCompletedAsync()
    }

    /**
     * Notifies the client that the request was not processed successfully.
     * @remarks
     * This method should be called if the provider app is unable to complete the operation.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerhidevideopreviewrequest.reportfailedasync
     */
    ReportFailedAsync() {
        if (!this.HasProp("__IBarcodeScannerHideVideoPreviewRequest")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerHideVideoPreviewRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerHideVideoPreviewRequest := IBarcodeScannerHideVideoPreviewRequest(outPtr)
        }

        return this.__IBarcodeScannerHideVideoPreviewRequest.ReportFailedAsync()
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
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerhidevideopreviewrequest.reportfailedasync
     */
    ReportFailedWithFailedReasonAsync(reason) {
        if (!this.HasProp("__IBarcodeScannerHideVideoPreviewRequest2")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerHideVideoPreviewRequest2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerHideVideoPreviewRequest2 := IBarcodeScannerHideVideoPreviewRequest2(outPtr)
        }

        return this.__IBarcodeScannerHideVideoPreviewRequest2.ReportFailedWithFailedReasonAsync(reason)
    }

    /**
     * Informs the client that the request was not processed successfully.
     * @remarks
     * This method should be called if the provider app is unable to complete the operation.
     * @param {Integer} reason 
     * @param {HSTRING} failedReasonDescription 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.provider.barcodescannerhidevideopreviewrequest.reportfailedasync
     */
    ReportFailedWithFailedReasonAndDescriptionAsync(reason, failedReasonDescription) {
        if (!this.HasProp("__IBarcodeScannerHideVideoPreviewRequest2")) {
            if ((queryResult := this.QueryInterface(IBarcodeScannerHideVideoPreviewRequest2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBarcodeScannerHideVideoPreviewRequest2 := IBarcodeScannerHideVideoPreviewRequest2(outPtr)
        }

        return this.__IBarcodeScannerHideVideoPreviewRequest2.ReportFailedWithFailedReasonAndDescriptionAsync(reason, failedReasonDescription)
    }

;@endregion Instance Methods
}
