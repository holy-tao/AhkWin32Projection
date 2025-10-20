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
     * 
     * @param {Pointer<IUnknown>} piData 
     * @param {Pointer<IWCPropertySheetCallback>} piCallback 
     * @returns {HRESULT} 
     */
    CreatePropertySheetPages(piData, piCallback) {
        result := ComCall(3, this, "ptr", piData, "ptr", piCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
