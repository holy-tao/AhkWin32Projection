#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaTransferCallback extends IUnknown{
    /**
     * The interface identifier for IWiaTransferCallback
     * @type {Guid}
     */
    static IID => Guid("{27d4eaaf-28a6-4ca5-9aab-e678168b9527}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<WiaTransferParams>} pWiaTransferParams 
     * @returns {HRESULT} 
     */
    TransferCallback(lFlags, pWiaTransferParams) {
        result := ComCall(3, this, "int", lFlags, "ptr", pWiaTransferParams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {BSTR} bstrItemName 
     * @param {BSTR} bstrFullItemName 
     * @param {Pointer<IStream>} ppDestination 
     * @returns {HRESULT} 
     */
    GetNextStream(lFlags, bstrItemName, bstrFullItemName, ppDestination) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName
        bstrFullItemName := bstrFullItemName is String ? BSTR.Alloc(bstrFullItemName).Value : bstrFullItemName

        result := ComCall(4, this, "int", lFlags, "ptr", bstrItemName, "ptr", bstrFullItemName, "ptr", ppDestination, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
