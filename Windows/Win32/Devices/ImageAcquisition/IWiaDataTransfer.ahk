#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumWIA_FORMAT_INFO.ahk
#Include .\WIA_EXTENDED_TRANSFER_INFO.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWiaDataTransfer interface is a high performance data transfer interface.
 * @remarks
 * 
 * The <b>IWiaDataTransfer</b> interface, like all Component Object Model (COM) interfaces, inherits the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface methods. 
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
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nn-wia_xp-iwiadatatransfer
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaDataTransfer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaDataTransfer
     * @type {Guid}
     */
    static IID => Guid("{a6cef998-a5b0-11d2-a08f-00c04f72dc3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["idtGetData", "idtGetBandedData", "idtQueryGetData", "idtEnumWIA_FORMAT_INFO", "idtGetExtendedTransferInfo"]

    /**
     * The IWiaDataTransfer::idtGetData method retrieves complete files from a Windows Image Acquisition (WIA) device.
     * @param {Pointer<STGMEDIUM>} pMedium Type: <b>LPSTGMEDIUM</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/win32/api/objidl/ns-objidl-ustgmedium-r1">STGMEDIUM</a> structure.
     * @param {IWiaDataCallback} pIWiaDataCallback Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiadatacallback">IWiaDataCallback</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiadatacallback">IWiaDataCallback</a> interface.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method can return any one of the following values:
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Return Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>One or more parameters to this method contain invalid data.</td>
     * </tr>
     * <tr>
     * <td>E_OUTOFMEMORY</td>
     * <td>This method cannot allocate enough memory to complete its operation.</td>
     * </tr>
     * <tr>
     * <td>E_UNEXPECTED</td>
     * <td>An unknown error occurred.</td>
     * </tr>
     * <tr>
     * <td>S_FALSE</td>
     * <td>The application canceled the operation.</td>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>The image was successfully acquired.</td>
     * </tr>
     * <tr>
     * <td>STG_E_MEDIUMFULL</td>
     * <td>The storage medium the application is using to acquire the image is full.</td>
     * </tr>
     * <tr>
     * <td>WIA_S_NO_DEVICE_AVAILABLE</td>
     * <td>There are no WIA hardware devices attached to the user's computer.</td>
     * </tr>
     * </table>
     *  
     * 
     * This method will return a value specified in <a href="/windows/desktop/wia/-wia-error-codes">Error Codes</a>, or a standard COM error if it fails for any reason other than those specified in the preceding table.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiadatatransfer-idtgetdata
     */
    idtGetData(pMedium, pIWiaDataCallback) {
        result := ComCall(3, this, "ptr", pMedium, "ptr", pIWiaDataCallback, "HRESULT")
        return result
    }

    /**
     * The IWiaDataTransfer::idtGetBandedData method transfers a band of data from a hardware device to an application. For efficiency, applications retrieve data from Windows Image Acquisition (WIA) hardware devices in successive bands.
     * @param {Pointer<WIA_DATA_TRANSFER_INFO>} pWiaDataTransInfo Type: <b>PWIA_DATA_TRANSFER_INFO</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/ns-wia_xp-wia_data_transfer_info">WIA_DATA_TRANSFER_INFO</a> structure.
     * @param {IWiaDataCallback} pIWiaDataCallback Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiadatacallback">IWiaDataCallback</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiadatacallback">IWiaDataCallback</a> interface. Periodically, this method will call the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiadatacallback-bandeddatacallback">BandedDataCallback</a> method to provide the application with data transfer status notification.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method can return any one of the following values:
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Return Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>One or more parameters to this method contain invalid data.</td>
     * </tr>
     * <tr>
     * <td>E_OUTOFMEMORY</td>
     * <td>This method cannot allocate enough memory to complete its operation.</td>
     * </tr>
     * <tr>
     * <td>E_UNEXPECTED</td>
     * <td>An unknown error occurred.</td>
     * </tr>
     * <tr>
     * <td>S_FALSE</td>
     * <td>The application canceled the operation.</td>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>The image was successfully acquired.</td>
     * </tr>
     * <tr>
     * <td>STG_E_MEDIUMFULL</td>
     * <td>The storage medium the application is using to acquire the image is full.</td>
     * </tr>
     * <tr>
     * <td>WIA_S_NO_DEVICE_AVAILABLE</td>
     * <td>There are no WIA hardware devices attached to the user's computer.</td>
     * </tr>
     * </table>
     *  
     * 
     * This method will return a value specified in <a href="/windows/desktop/wia/-wia-error-codes">Error Codes</a>, or a standard COM error if it fails for any reason other than those specified in the preceding table.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiadatatransfer-idtgetbandeddata
     */
    idtGetBandedData(pWiaDataTransInfo, pIWiaDataCallback) {
        result := ComCall(4, this, "ptr", pWiaDataTransInfo, "ptr", pIWiaDataCallback, "HRESULT")
        return result
    }

    /**
     * The IWiaDataTransfer::idtQueryGetData method is used by applications to query a Windows Image Acquisition (WIA) device to determine what types of data formats it supports.
     * @param {Pointer<WIA_FORMAT_INFO>} pfe Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/ns-wia_xp-wia_format_info">WIA_FORMAT_INFO</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/ns-wia_xp-wia_format_info">WIA_FORMAT_INFO</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns S_OK. Otherwise it returns a value specified in <a href="/windows/desktop/wia/-wia-error-codes">Error Codes</a>, or a standard COM error.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiadatatransfer-idtquerygetdata
     */
    idtQueryGetData(pfe) {
        result := ComCall(5, this, "ptr", pfe, "HRESULT")
        return result
    }

    /**
     * The IWiaDataTransfer::idtEnumWIA_FORMAT_INFO method creates a banded transfer implementation of the IEnumWIA_FORMAT_INFO interface.
     * @returns {IEnumWIA_FORMAT_INFO} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_format_info">IEnumWIA_FORMAT_INFO</a>**</b>
     * 
     * Receives the address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_format_info">IEnumWIA_FORMAT_INFO</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiadatatransfer-idtenumwia_format_info
     */
    idtEnumWIA_FORMAT_INFO() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumWIA_FORMAT_INFO(ppEnum)
    }

    /**
     * The IWiaDataTransfer::idtGetExtendedTransferInfo retrieves extended information relating to data transfer buffers in the case of banded data transfers.
     * @returns {WIA_EXTENDED_TRANSFER_INFO} Type: <b>PWIA_EXTENDED_TRANSFER_INFO</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/ns-wia_xp-wia_extended_transfer_info">WIA_EXTENDED_TRANSFER_INFO</a> structure containing the extended information.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwiadatatransfer-idtgetextendedtransferinfo
     */
    idtGetExtendedTransferInfo() {
        pExtendedTransferInfo := WIA_EXTENDED_TRANSFER_INFO()
        result := ComCall(7, this, "ptr", pExtendedTransferInfo, "HRESULT")
        return pExtendedTransferInfo
    }
}
