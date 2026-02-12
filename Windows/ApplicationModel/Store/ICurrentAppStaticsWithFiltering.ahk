#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\ListingInformation.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store
 * @version WindowsRuntime 1.4
 */
class ICurrentAppStaticsWithFiltering extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICurrentAppStaticsWithFiltering
     * @type {Guid}
     */
    static IID => Guid("{d36d6542-9085-438e-97ba-a25c976be2fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadListingInformationByProductIdsAsync", "LoadListingInformationByKeywordsAsync", "ReportProductFulfillment"]

    /**
     * 
     * @param {IIterable<HSTRING>} productIds 
     * @returns {IAsyncOperation<ListingInformation>} 
     */
    LoadListingInformationByProductIdsAsync(productIds) {
        result := ComCall(6, this, "ptr", productIds, "ptr*", &loadListingOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ListingInformation, loadListingOperation)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} keywords 
     * @returns {IAsyncOperation<ListingInformation>} 
     */
    LoadListingInformationByKeywordsAsync(keywords) {
        result := ComCall(7, this, "ptr", keywords, "ptr*", &loadListingOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ListingInformation, loadListingOperation)
    }

    /**
     * 
     * @param {HSTRING} productId 
     * @returns {HRESULT} 
     */
    ReportProductFulfillment(productId) {
        if(productId is String) {
            pin := HSTRING.Create(productId)
            productId := pin.Value
        }
        productId := productId is Win32Handle ? NumGet(productId, "ptr") : productId

        result := ComCall(8, this, "ptr", productId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
