#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<STGMEDIUM>} pMedium 
     * @param {Pointer<IWiaDataCallback>} pIWiaDataCallback 
     * @returns {HRESULT} 
     */
    idtGetData(pMedium, pIWiaDataCallback) {
        result := ComCall(3, this, "ptr", pMedium, "ptr", pIWiaDataCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WIA_DATA_TRANSFER_INFO>} pWiaDataTransInfo 
     * @param {Pointer<IWiaDataCallback>} pIWiaDataCallback 
     * @returns {HRESULT} 
     */
    idtGetBandedData(pWiaDataTransInfo, pIWiaDataCallback) {
        result := ComCall(4, this, "ptr", pWiaDataTransInfo, "ptr", pIWiaDataCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WIA_FORMAT_INFO>} pfe 
     * @returns {HRESULT} 
     */
    idtQueryGetData(pfe) {
        result := ComCall(5, this, "ptr", pfe, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumWIA_FORMAT_INFO>} ppEnum 
     * @returns {HRESULT} 
     */
    idtEnumWIA_FORMAT_INFO(ppEnum) {
        result := ComCall(6, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WIA_EXTENDED_TRANSFER_INFO>} pExtendedTransferInfo 
     * @returns {HRESULT} 
     */
    idtGetExtendedTransferInfo(pExtendedTransferInfo) {
        result := ComCall(7, this, "ptr", pExtendedTransferInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
