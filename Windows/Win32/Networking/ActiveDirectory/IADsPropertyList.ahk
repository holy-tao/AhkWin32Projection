#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsPropertyList interface is used to modify, read, and update a list of property entries in the property cache of an object.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadspropertylist
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsPropertyList extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsPropertyList
     * @type {Guid}
     */
    static IID => Guid("{c6f602b6-8f69-11d0-8528-00c04fd8d503}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PropertyCount", "Next", "Skip", "Reset", "Item", "GetPropertyItem", "PutPropertyItem", "ResetPropertyItem", "PurgePropertyList"]

    /**
     * @type {Integer} 
     */
    PropertyCount {
        get => this.get_PropertyCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PropertyCount() {
        result := ComCall(7, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * The IADsPropertyList::Next method gets the next item in the property list. The returned item is a Property Entry object.
     * @returns {VARIANT} Address of a caller-allocated variable that contains the value of the next item in the property list. The return value of <b>VT_DISPATCH</b> refers to an  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface pointer to an object implementing the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadspropertyentry">IADsPropertyEntry</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadspropertylist-next
     */
    Next() {
        pVariant := VARIANT()
        result := ComCall(8, this, "ptr", pVariant, "int")
        return pVariant
    }

    /**
     * Skips a specified number of items, counting from the current cursor position, in the property list.
     * @param {Integer} cElements Number of elements to be skipped.
     * @returns {HRESULT} This method supports the standard HRESULT return values, including S_OK. For more information and other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadspropertylist-skip
     */
    Skip(cElements) {
        result := ComCall(9, this, "int", cElements, "int")
        return result
    }

    /**
     * Resets the list to the first item.
     * @returns {HRESULT} This method supports the standard <b>HRESULT</b> values, including <b>S_OK</b>. For more information and other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadspropertylist-reset
     */
    Reset() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * The IADsPropertyList::Item method retrieves the specified property item from the list.
     * @param {VARIANT} varIndex The <b>VARIANT</b> that contains the index or name of the property to be retrieved.
     * @returns {VARIANT} Address of a caller-allocated <b>VARIANT</b> variable. On return, the <b>VARIANT</b> contains the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> pointer to the object which implements the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadspropertyentry">IADsPropertyEntry</a> interface for the attribute retrieved.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadspropertylist-item
     */
    Item(varIndex) {
        pVariant := VARIANT()
        result := ComCall(11, this, "ptr", varIndex, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * Retrieves the item that matches the name from the list.
     * @param {BSTR} bstrName Contains the name of the requested property.
     * @param {Integer} lnADsType Contains one of the <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-adstypeenum">ADSTYPEENUM</a> enumeration values that determines the data type to be used in interpreting the requested property. If the type is unknown, this parameter can be set to <b>ADSTYPE_UNKNOWN</b>. For schemaless servers, the user must specify the type.
     * @returns {VARIANT} Address of a caller-allocated <b>VARIANT</b> variable. On return, the <b>VARIANT</b> contains the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface pointer of the object which implements the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadspropertyentry">IADsPropertyEntry</a> interface for the retrieved attribute.
     * 
     * Any memory allocated for this parameter must be released with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantclear">VariantClear</a> function when the data is no longer required.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadspropertylist-getpropertyitem
     */
    GetPropertyItem(bstrName, lnADsType) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        pVariant := VARIANT()
        result := ComCall(12, this, "ptr", bstrName, "int", lnADsType, "ptr", pVariant, "HRESULT")
        return pVariant
    }

    /**
     * Updates the values for an item in the property list.
     * @param {VARIANT} varData New property values to be put in the property cache. This should contain the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> pointer to the object which implements the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadspropertyentry">IADsPropertyEntry</a> that contain the modified property values.
     * @returns {HRESULT} This method supports the standard HRESULT return values, including S_OK. For more information and other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadspropertylist-putpropertyitem
     */
    PutPropertyItem(varData) {
        result := ComCall(13, this, "ptr", varData, "HRESULT")
        return result
    }

    /**
     * Removes the specified item from the list; that is, from the cache.
     * @param {VARIANT} varEntry Entry to be reset.
     * @returns {HRESULT} This method supports the standard <b>HRESULT</b> return values, including <b>S_OK</b>. For more information and other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadspropertylist-resetpropertyitem
     */
    ResetPropertyItem(varEntry) {
        result := ComCall(14, this, "ptr", varEntry, "HRESULT")
        return result
    }

    /**
     * Deletes all items from the property list.
     * @returns {HRESULT} This method supports the standard HRESULT return values, including S_OK. For more information and other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadspropertylist-purgepropertylist
     */
    PurgePropertyList() {
        result := ComCall(15, this, "HRESULT")
        return result
    }
}
