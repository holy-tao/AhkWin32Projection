#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     */
    get_PropertyCount(plCount) {
        result := ComCall(7, this, "int*", plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspropertylist-next
     */
    Next(pVariant) {
        result := ComCall(8, this, "ptr", pVariant, "int")
        return result
    }

    /**
     * 
     * @param {Integer} cElements 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspropertylist-skip
     */
    Skip(cElements) {
        result := ComCall(9, this, "int", cElements, "int")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspropertylist-reset
     */
    Reset() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varIndex 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspropertylist-item
     */
    Item(varIndex, pVariant) {
        result := ComCall(11, this, "ptr", varIndex, "ptr", pVariant, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Integer} lnADsType 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspropertylist-getpropertyitem
     */
    GetPropertyItem(bstrName, lnADsType, pVariant) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(12, this, "ptr", bstrName, "int", lnADsType, "ptr", pVariant, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspropertylist-putpropertyitem
     */
    PutPropertyItem(varData) {
        result := ComCall(13, this, "ptr", varData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varEntry 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspropertylist-resetpropertyitem
     */
    ResetPropertyItem(varEntry) {
        result := ComCall(14, this, "ptr", varEntry, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadspropertylist-purgepropertylist
     */
    PurgePropertyList() {
        result := ComCall(15, this, "HRESULT")
        return result
    }
}
