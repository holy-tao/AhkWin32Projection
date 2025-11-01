#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use the ISdoCollection interface to manipulate a collection of SDO objects.
 * @remarks
 * 
  * To obtain a collection, call 
  * <a href="https://docs.microsoft.com/windows/desktop/api/sdoias/nf-sdoias-isdo-getproperty">ISdo::GetProperty</a>, specifying a collection's property. For more information, see 
  * <a href="https://docs.microsoft.com/windows/desktop/Nps/sdo-retrieving-a-collection">Retrieving a Collection</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/nn-sdoias-isdocollection
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class ISdoCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISdoCollection
     * @type {Guid}
     */
    static IID => Guid("{56bc53e2-96db-11d1-bf3f-000000000000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "Add", "Remove", "RemoveAll", "Reload", "IsNameUnique", "Item", "get__NewEnum"]

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdocollection-get_count
     */
    get_Count(pCount) {
        pCountMarshal := pCount is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<IDispatch>} ppItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdocollection-add
     */
    Add(bstrName, ppItem) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(8, this, "ptr", bstrName, "ptr*", ppItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdocollection-remove
     */
    Remove(pItem) {
        result := ComCall(9, this, "ptr", pItem, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdocollection-removeall
     */
    RemoveAll() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdocollection-reload
     */
    Reload() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<VARIANT_BOOL>} pBool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdocollection-isnameunique
     */
    IsNameUnique(bstrName, pBool) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(12, this, "ptr", bstrName, "ptr", pBool, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Name 
     * @param {Pointer<IDispatch>} pItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdocollection-item
     */
    Item(Name, pItem) {
        result := ComCall(13, this, "ptr", Name, "ptr*", pItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppEnumVARIANT 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sdoias/nf-sdoias-isdocollection-get__newenum
     */
    get__NewEnum(ppEnumVARIANT) {
        result := ComCall(14, this, "ptr*", ppEnumVARIANT, "HRESULT")
        return result
    }
}
