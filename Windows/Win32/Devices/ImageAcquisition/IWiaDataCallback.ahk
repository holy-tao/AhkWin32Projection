#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides an application callback mechanism during data transfers from Windows Image Acquisition (WIA) hardware devices to applications.Note  For Windows Vista applications, use IWiaTransferCallback instead of IWiaDataCallback.
 * @remarks
 * The <b>IWiaDataCallback</b> interface, like all Component Object Model (COM) interfaces, inherits the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface methods. 
 * 
 * <table class="clsStd">
 * <tr>
 * <th>IUnknown Methods</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>
 * </td>
 * <td>Returns pointers to supported interfaces.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a>
 * </td>
 * <td>Increments reference count.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a>
 * </td>
 * <td>Decrements reference count.</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api//content/wia_xp/nn-wia_xp-iwiadatacallback
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaDataCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaDataCallback
     * @type {Guid}
     */
    static IID => Guid("{a558a866-a5b0-11d2-a08f-00c04f72dc3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BandedDataCallback"]

    /**
     * Provides data transfer status notifications. Windows Image Acquisition (WIA) data transfer methods of the IWiaDataTransfer interface periodically call this method.
     * @remarks
     * Your application must provide the <b>IWiaDataCallback::BandedDataCallback</b> method. This method is periodically invoked by the data transfer methods of the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiadatatransfer">IWiaDataTransfer</a> interface. It provides status messages to the application during the data transfer. By returning S_FALSE, your program can also use this method to prematurely terminate the data transfer.
     * 
     * When this method is invoked, the <i>lMessage</i> parameter will contain the reason for the call. Not all parameters will contain data on all calls. For example, when <b>IWiaDataCallback::BandedDataCallback</b> is invoked with a message of IT_MSG_TERMINATION, it should not attempt to use the values in the <i>pbBuffer</i>, <i>lOffset</i>, and <i>lLength</i> parameters.
     * 
     * If the value of <i>lMessage</i> is IT_MSG_DATA, the buffer pointed to by <i>pbBuffer</i> contains a band of image data. The <i>lOffset</i> parameter contains an offset in bytes from the beginning of the buffer where the current band of data begins. The <i>lLength</i> parameter specified the length in bytes of the current band of data.
     * 
     * During calls where <i>lMessage</i> is set to IT_MSG_DATA or IT_MSG_STATUS, the <i>lStatus</i> parameter contains a valid value. Its contents should not be used when <i>lMessage</i> contains other values.
     * 
     * If <i>lMessage</i> is IT_MSG_DATA_HEADER, the <i>pbBuffer</i> parameter points to a <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/ns-wia_xp-wia_data_callback_header">WIA_DATA_CALLBACK_HEADER</a> structure.
     * 
     * When an error has occurred during an image data transfer, the driver sets <i>lMessage</i> to IT_MSG_DEVICE_STATUS. The proxy callback object calls <a href="https://docs.microsoft.com/windows/desktop/wia/-wia-iwiaerrorhandler-reportstatus">ReportStatus</a>, which handles the error and displays messages to the user.
     * @param {Integer} lMessage Type: <b>LONG</b>
     * @param {Integer} lStatus Type: <b>LONG</b>
     * 
     * Specifies a constant that indicates the status of the WIA device. Can be set to a combination of the following:
     * @param {Integer} lPercentComplete Type: <b>LONG</b>
     * 
     * Specifies the percentage of the total data that has been transferred so far.
     * @param {Integer} lOffset Type: <b>LONG</b>
     * 
     * Specifies an offset, in bytes, from the beginning of the buffer where the current band of data begins.
     * @param {Integer} lLength Type: <b>LONG</b>
     * 
     * Specifies the length, in bytes, of the current band of data.
     * @param {Integer} lReserved Type: <b>LONG</b>
     * 
     * Reserved for internal use by the WIA run-time system.
     * @param {Integer} lResLength Type: <b>LONG</b>
     * 
     * Reserved for internal use by the WIA run-time system.
     * @param {Pointer<Integer>} pbBuffer Type: <b>BYTE*</b>
     * 
     * Pointer to the data buffer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, the method returns S_OK. To cancel the data transfer, it returns S_FALSE. If the method fails, it returns a standard COM error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wia_xp/nf-wia_xp-iwiadatacallback-bandeddatacallback
     */
    BandedDataCallback(lMessage, lStatus, lPercentComplete, lOffset, lLength, lReserved, lResLength, pbBuffer) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "int", lMessage, "int", lStatus, "int", lPercentComplete, "int", lOffset, "int", lLength, "int", lReserved, "int", lResLength, pbBufferMarshal, pbBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
