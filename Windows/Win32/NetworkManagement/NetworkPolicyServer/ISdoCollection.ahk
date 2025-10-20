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
     * 
     * @param {Pointer<Int32>} pCount 
     * @returns {HRESULT} 
     */
    get_Count(pCount) {
        result := ComCall(7, this, "int*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<IDispatch>} ppItem 
     * @returns {HRESULT} 
     */
    Add(bstrName, ppItem) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(8, this, "ptr", bstrName, "ptr", ppItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} pItem 
     * @returns {HRESULT} 
     */
    Remove(pItem) {
        result := ComCall(9, this, "ptr", pItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAll() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reload() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<VARIANT_BOOL>} pBool 
     * @returns {HRESULT} 
     */
    IsNameUnique(bstrName, pBool) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(12, this, "ptr", bstrName, "ptr", pBool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Name 
     * @param {Pointer<IDispatch>} pItem 
     * @returns {HRESULT} 
     */
    Item(Name, pItem) {
        result := ComCall(13, this, "ptr", Name, "ptr", pItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppEnumVARIANT 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppEnumVARIANT) {
        result := ComCall(14, this, "ptr", ppEnumVARIANT, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
