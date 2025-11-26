#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsCollection interface is a dual interface that enables its hosting ADSI object to define and manage an arbitrary set of named data elements for a directory service.
 * @remarks
 * 
 * Of the ADSI system providers, only the WinNT provider supports this interface to handle active file service sessions, resources and print jobs.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadscollection
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsCollection
     * @type {Guid}
     */
    static IID => Guid("{72b945e0-253b-11cf-a988-00aa006bc149}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "Add", "Remove", "GetObject"]

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * The IADsCollection::get__NewEnum method gets a dependent enumerator object that implements IEnumVARIANT for this ADSI collection object. Be aware that there are two underscore characters in the function name (get__NewEnum).
     * @returns {IUnknown} Pointer to a pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface on the enumerator object for this collection.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadscollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppEnumerator := 0, "HRESULT")
        return IUnknown(ppEnumerator)
    }

    /**
     * Adds a named item to the collection.
     * @param {BSTR} bstrName The <b>BSTR</b> value that specifies the item name.  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadscollection-getobject">IADsCollection::GetObject</a> and  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadscollection-remove">IADsCollection::Remove</a> reference the item by this name.
     * @param {VARIANT} vItem Item value. When the item is an object, this parameter holds the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface pointer on the object.
     * @returns {HRESULT} This method supports the standard return values, as well as the following.
     *       
     * 
     * For more information and other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadscollection-add
     */
    Add(bstrName, vItem) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(8, this, "ptr", bstrName, "ptr", vItem, "HRESULT")
        return result
    }

    /**
     * The IADsCollection::Remove method removes the named item from this ADSI collection object.
     * @param {BSTR} bstrItemToBeRemoved The null-terminated Unicode string that specifies the name of the item as it was specified by  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadscollection-add">IADsCollection::Add</a>.
     * @returns {HRESULT} This method supports the standard return values, including <b>S_OK</b>. For more information and other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadscollection-remove
     */
    Remove(bstrItemToBeRemoved) {
        bstrItemToBeRemoved := bstrItemToBeRemoved is String ? BSTR.Alloc(bstrItemToBeRemoved).Value : bstrItemToBeRemoved

        result := ComCall(9, this, "ptr", bstrItemToBeRemoved, "HRESULT")
        return result
    }

    /**
     * Retrieves an item of the collection.
     * @param {BSTR} bstrName The null-terminated Unicode string that specifies the name of the item. This is the same name passed to  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadscollection-add">IADsCollection::Add</a> when the item is added to the collection.
     * @returns {VARIANT} Current value of the item. For an object, this corresponds to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface pointer on the object.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadscollection-getobject
     */
    GetObject(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        pvItem := VARIANT()
        result := ComCall(10, this, "ptr", bstrName, "ptr", pvItem, "HRESULT")
        return pvItem
    }
}
