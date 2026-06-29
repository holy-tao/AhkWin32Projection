#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IWiaItem2.ahk" { IWiaItem2 }

/**
 * The IWiaAppErrorHandler interface enables applications to display error windows (during data transfers) from which the user can choose whether to continue, cancel, or abort the transfer.
 * @remarks
 * The **IWiaAppErrorHandler** interface inherits from the [**IUnknown**](/windows/win32/api/unknwn/nn-unknwn-iunknown) interface. **IWiaAppErrorHandler** also has these types of members:
 * 
 * -   [Methods](#methods)
 * 
 * 
 * The error handling, or callback, object that implements this interface is passed into [**IWiaTransfer::Download**](-wia-iwiatransfer-download.md) and [**IWiaTransfer::Upload**](-wia-iwiatransfer-upload.md).
 * 
 * This interface is not designed to handle errors encountered outside of image data transfers, for example, errors in getting or setting device properties or unreturned callbacks into a driver.
 * 
 * A driver error handler should implement [**IWiaErrorHandler**](-wia-iwiaerrorhandler.md), instead of **IWiaAppErrorHandler**.
 * 
 * The object that implements this interface should also implement [**IWiaTransferCallback**](-wia-iwiatransfercallback.md).
 * 
 * If you want a driver error handler and default error handler to display error message windows, but you do not want to create a complete error handler for the application, implement this interface and also implement the [**IWiaAppErrorHandler::ReportStatus**](-wia-iwiaapperrorhandler-reportstatus.md) method to return WIA\_STATUS\_NOT\_HANDLED.
 * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaapperrorhandler
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct IWiaAppErrorHandler extends IUnknown {
    /**
     * The interface identifier for IWiaAppErrorHandler
     * @type {Guid}
     */
    static IID := Guid("{6c16186c-d0a6-400c-80f4-d26986a0e734}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWiaAppErrorHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetWindow    : IntPtr
        ReportStatus : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWiaAppErrorHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a handle to the dialog box that displays error messages and provides one or more buttons to continue, cancel, or abort the application.
     * @remarks
     * *phwnd* points to the window passed into [**ReportStatus**](-wia-iwiaerrorhandler-reportstatus.md) by the Windows Image Acquisition (WIA) 2.0 Proxy. This window must remain valid for the duration of the data transfer.
     * @returns {HWND} Type: **HWND\***
     * 
     * HWND used by the application error handler, the driver error handler, and the default error handler for device message dialog boxes (both error and informational). The output value may be **NULL**.
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaapperrorhandler-getwindow
     */
    GetWindow() {
        phwnd := HWND()
        result := ComCall(3, this, HWND.Ptr, phwnd, "HRESULT")
        return phwnd
    }

    /**
     * Handles device status and error messages during image data transfers and displays the messages to the user.
     * @remarks
     * The *lPercentComplete* parameter enables an error handler window to show progress. For example, a driver might provide an estimate of how long "warming up" takes. The *lPercentComplete* parameter passed into **IWiaAppErrorHandler::ReportStatus** is the same value as the **lPercentComplete** that the driver sets into the [**WiaTransferParams**](-wia-wiatransferparams.md) structure.
     * 
     * An error handler can use the SUCCEEDED and FAILED macros to find out if *hrStatus* has SEVERITY\_ERROR or SEVERITY\_SUCCESS.
     * 
     * If *hrStatus* is SEVERITY\_SUCCESS, the user should be allowed to cancel the transfer.
     * 
     * If *hrStatus* is SEVERITY\_ERROR, the error handler should display a modal dialog box owned by the application parent window.
     * @param {Integer} lFlags Type: **LONG**
     * 
     * Not used. Set to 0.
     * @param {IWiaItem2} pWiaItem2 Type: **[**IWiaItem2**](-wia-iwiaitem2.md)\***
     * 
     * Pointer to the item being transferred.
     * @param {HRESULT} hrStatus Type: **HRESULT**
     * 
     * Device status code.
     * @param {Integer} lPercentComplete Type: **LONG**
     * 
     * Percentage completed of current operation.
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * Returns *hrStatus* if recovery from the error is not possible. Otherwise, it returns one of the following values.
     * 
     * 
     * 
     * | Return code                                                                                              | Description                                                                                                                                                                                                                                        |
     * |----------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl>                     | If *hrStatus* is an error, the appropriate action was taken to correct the error, and the transfer can continue. If *hrStatus* is informational, the user was informed with a modeless dialog box and chose not to cancel the transfer.<br/> |
     * | <dl> <dt>**S\_FALSE**</dt> </dl>                  | The user cancelled the transfer from the error handler modeless dialog box. This value can be returned at any point no matter what *hrStatus* is. <br/>                                                                                      |
     * | <dl> <dt>**WIA\_STATUS\_NOT\_HANDLED**</dt> </dl> | No action was taken; that is, no dialog box was presented to the user. The next error handler will be invoked. The order of error handlers is: application, driver, and system default.<br/>                                                 |
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaapperrorhandler-reportstatus
     */
    ReportStatus(lFlags, pWiaItem2, hrStatus, lPercentComplete) {
        result := ComCall(4, this, "int", lFlags, "ptr", pWiaItem2, "int", hrStatus, "int", lPercentComplete, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWiaAppErrorHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetWindow := CallbackCreate(GetMethod(implObj, "GetWindow"), flags, 2)
        this.vtbl.ReportStatus := CallbackCreate(GetMethod(implObj, "ReportStatus"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetWindow)
        CallbackFree(this.vtbl.ReportStatus)
    }
}
