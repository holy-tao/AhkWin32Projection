#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implement the IWEExtendPropertySheet interface to create property sheet pages for a cluster object and add them to a Failover Cluster Administrator property sheet.
 * @see https://docs.microsoft.com/windows/win32/api//cluadmex/nn-cluadmex-iweextendpropertysheet
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class IWEExtendPropertySheet extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWEExtendPropertySheet
     * @type {Guid}
     */
    static IID => Guid("{97dede61-fc6b-11cf-b5f5-00a0c90ab505}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePropertySheetPages"]

    /**
     * 
     * @param {IUnknown} piData 
     * @param {IWCPropertySheetCallback} piCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cluadmex/nf-cluadmex-iweextendpropertysheet-createpropertysheetpages
     */
    CreatePropertySheetPages(piData, piCallback) {
        result := ComCall(3, this, "ptr", piData, "ptr", piCallback, "HRESULT")
        return result
    }
}
