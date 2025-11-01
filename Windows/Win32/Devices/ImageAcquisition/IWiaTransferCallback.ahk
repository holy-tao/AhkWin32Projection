#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiatransfercallback
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaTransferCallback extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TransferCallback", "GetNextStream"]

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Pointer<WiaTransferParams>} pWiaTransferParams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiatransfercallback-transfercallback
     */
    TransferCallback(lFlags, pWiaTransferParams) {
        result := ComCall(3, this, "int", lFlags, "ptr", pWiaTransferParams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {BSTR} bstrItemName 
     * @param {BSTR} bstrFullItemName 
     * @param {Pointer<IStream>} ppDestination 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiatransfercallback-getnextstream
     */
    GetNextStream(lFlags, bstrItemName, bstrFullItemName, ppDestination) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName
        bstrFullItemName := bstrFullItemName is String ? BSTR.Alloc(bstrFullItemName).Value : bstrFullItemName

        result := ComCall(4, this, "int", lFlags, "ptr", bstrItemName, "ptr", bstrFullItemName, "ptr*", ppDestination, "HRESULT")
        return result
    }
}
