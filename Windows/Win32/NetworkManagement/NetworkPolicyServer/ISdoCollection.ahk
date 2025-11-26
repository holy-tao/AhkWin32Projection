#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * The get_Count method returns the number of items in the collection.
     * @returns {Integer} Pointer to a <b>LONG</b> that contains the number of items in the collection.
     * @see https://docs.microsoft.com/windows/win32/api//sdoias/nf-sdoias-isdocollection-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * The Add method adds an item to the Server Data Objects (SDO) collection.
     * @param {BSTR} bstrName Specifies the name of the SDO Object. This parameter may be <b>NULL</b>.
     * @param {Pointer<IDispatch>} ppItem Pointer to an <b>IDispatch</b> interface pointer for the Item to add. This parameter must not be <b>NULL</b>.
     * @returns {HRESULT} If the method succeeds the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//sdoias/nf-sdoias-isdocollection-add
     */
    Add(bstrName, ppItem) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(8, this, "ptr", bstrName, "ptr*", ppItem, "HRESULT")
        return result
    }

    /**
     * The Remove method removes the specified item from the collection.
     * @param {IDispatch} pItem Pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface that specifies the item to remove.
     * 
     * This parameter must not be <b>NULL</b>.
     * @returns {HRESULT} If the method succeeds the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//sdoias/nf-sdoias-isdocollection-remove
     */
    Remove(pItem) {
        result := ComCall(9, this, "ptr", pItem, "HRESULT")
        return result
    }

    /**
     * The RemoveAll method removes all the items from the collection.
     * @returns {HRESULT} If the method succeeds the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//sdoias/nf-sdoias-isdocollection-removeall
     */
    RemoveAll() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * The Reload method reloads all the objects in the collection from the underlying datastore.
     * @returns {HRESULT} If the method succeeds the return value is <b>S_OK</b>.
     * 
     * If the method fails, the return value is one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//sdoias/nf-sdoias-isdocollection-reload
     */
    Reload() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * The IsNameUnique method tests whether the specified name is unique in the collection.
     * @param {BSTR} bstrName Specifies the name to test.
     * @returns {VARIANT_BOOL} Pointer to a <b>VARIANT</b> that specifies whether the name is unique. The returned value is <b>VARIANT_TRUE</b> if the name is unique, <b>VARIANT_FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//sdoias/nf-sdoias-isdocollection-isnameunique
     */
    IsNameUnique(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(12, this, "ptr", bstrName, "short*", &pBool := 0, "HRESULT")
        return pBool
    }

    /**
     * The Item method retrieves the specified item from the collection.
     * @param {Pointer<VARIANT>} Name Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a>. Store the name of the object in a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a> in this <b>VARIANT</b>.
     * @returns {IDispatch} Pointer to an interface pointer that receives the address of an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface for the object.
     * @see https://docs.microsoft.com/windows/win32/api//sdoias/nf-sdoias-isdocollection-item
     */
    Item(Name) {
        result := ComCall(13, this, "ptr", Name, "ptr*", &pItem := 0, "HRESULT")
        return IDispatch(pItem)
    }

    /**
     * The get__NewEnum method retrieves an IEnumVARIANT interface for a Server Data Objects (SDO) collection.
     * @returns {IUnknown} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface pointer. On successful return the <b>IUnknown</b> interface pointer, points to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface.
     * 
     * This parameter must not be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//sdoias/nf-sdoias-isdocollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(14, this, "ptr*", &ppEnumVARIANT := 0, "HRESULT")
        return IUnknown(ppEnumVARIANT)
    }
}
