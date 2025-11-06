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
     * 
     * @param {Pointer<STGMEDIUM>} pMedium 
     * @param {IWiaDataCallback} pIWiaDataCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiadatatransfer-idtgetdata
     */
    idtGetData(pMedium, pIWiaDataCallback) {
        result := ComCall(3, this, "ptr", pMedium, "ptr", pIWiaDataCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WIA_DATA_TRANSFER_INFO>} pWiaDataTransInfo 
     * @param {IWiaDataCallback} pIWiaDataCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiadatatransfer-idtgetbandeddata
     */
    idtGetBandedData(pWiaDataTransInfo, pIWiaDataCallback) {
        result := ComCall(4, this, "ptr", pWiaDataTransInfo, "ptr", pIWiaDataCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WIA_FORMAT_INFO>} pfe 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiadatatransfer-idtquerygetdata
     */
    idtQueryGetData(pfe) {
        result := ComCall(5, this, "ptr", pfe, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumWIA_FORMAT_INFO} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiadatatransfer-idtenumwia_format_info
     */
    idtEnumWIA_FORMAT_INFO() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumWIA_FORMAT_INFO(ppEnum)
    }

    /**
     * 
     * @returns {WIA_EXTENDED_TRANSFER_INFO} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwiadatatransfer-idtgetextendedtransferinfo
     */
    idtGetExtendedTransferInfo() {
        pExtendedTransferInfo := WIA_EXTENDED_TRANSFER_INFO()
        result := ComCall(7, this, "ptr", pExtendedTransferInfo, "HRESULT")
        return pExtendedTransferInfo
    }
}
