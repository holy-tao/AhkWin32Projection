#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWiaErrorHandler interface provides methods to handle errors that may occur when an application requests image data, whether for preview or final bits.
 * @remarks
 * The **IWiaErrorHandler** interface inherits from the [**IUnknown**](/windows/win32/api/unknwn/nn-unknwn-iunknown) interface. **IWiaErrorHandler** also has these types of members:
 * 
 * -   [Methods](#methods)
 * 
 * 
 * The application callback object can implement **IWiaErrorHandler**.
 * 
 * This interface is not designed to handle errors encountered outside of image data transfers, for example, errors in getting or setting device properties or unreturned callbacks into a driver.
 * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaerrorhandler
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaErrorHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaErrorHandler
     * @type {Guid}
     */
    static IID => Guid("{0e4a51b1-bc1f-443d-a835-72e890759ef3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReportStatus", "GetStatusDescription"]

    /**
     * Handles status and error messages during image data transfers and displays them to the user.
     * @remarks
     * Windows Image Acquisition (WIA) 2.0 calls **IWiaErrorHandler::ReportStatus** when the driver sends an **IT\_MSG\_DEVICE\_STATUS** message to [**BandedDataCallback**](/windows/desktop/api/wia_xp/nf-wia_xp-iwiadatacallback-bandeddatacallback). This method handles the message and displays information to the user about the status or error. If the message is about an error, the method lets the user choose, if possible, whether to try to recover from the error and continue the transfer or to abort.
     * 
     * *hrStatus* is set to WIA\_STATUS\_TRANSFER\_BEGIN to inform the handler a transfer has started. It is set to WIA\_STATUS\_TRANSFER\_END when the transfer is complete.
     * 
     * If *hrStatus* is SEVERITY\_SUCCESS, the user should be allowed to cancel the transfer.
     * @param {Integer} lFlags 
     * @param {HWND} hwndParent Type: **HWND**
     * @param {IWiaItem2} pWiaItem2 
     * @param {HRESULT} hrStatus Type: **HRESULT**
     * @param {Integer} lPercentComplete 
     * @returns {HRESULT} Type: **HRESULT**
     * 
     * Returns *hrStatus* if the error cannot be recovered from. Otherwise, it returns one of the following values.
     * 
     * 
     * 
     * | Return code                                                                             | Description                                                                                      |
     * |-----------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl>    | The appropriate action was taken to correct the error and the transfer can continue. <br/> |
     * | <dl> <dt>**S\_FALSE**</dt> </dl> | No action was taken to handle the error or report status to the user. <br/>                |
     * | <dl> <dt>**E\_ABORT**</dt> </dl> | The user chose to abort the transfer in response to the displayed dialog box. <br/>        |
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaerrorhandler-reportstatus
     */
    ReportStatus(lFlags, hwndParent, pWiaItem2, hrStatus, lPercentComplete) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(3, this, "int", lFlags, "ptr", hwndParent, "ptr", pWiaItem2, "int", hrStatus, "int", lPercentComplete, "HRESULT")
        return result
    }

    /**
     * Returns a string that describes the status code.
     * @param {Integer} lFlags 
     * @param {IWiaItem2} pWiaItem2 
     * @param {HRESULT} hrStatus Type: **HRESULT**
     * @returns {BSTR} Type: **BSTR\***
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaerrorhandler-getstatusdescription
     */
    GetStatusDescription(lFlags, pWiaItem2, hrStatus) {
        pbstrDescription := BSTR()
        result := ComCall(4, this, "int", lFlags, "ptr", pWiaItem2, "int", hrStatus, "ptr", pbstrDescription, "HRESULT")
        return pbstrDescription
    }
}
