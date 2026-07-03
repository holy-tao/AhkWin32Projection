#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Provides access to the list of IME plug-in dictionaries.
 * @remarks
 * This interface is implemented in classes of ProgID="ImePlugInDictDictionaryList1041" for Microsoft Japanese IME and ProgID="ImePlugInDictDictionaryList2052" for Microsoft Simplified Chinese IME.
 * @see https://learn.microsoft.com/windows/win32/api/msimeapi/nn-msimeapi-iimeplugindictdictionarylist
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IImePlugInDictDictionaryList extends IUnknown {
    /**
     * The interface identifier for IImePlugInDictDictionaryList
     * @type {Guid}
     */
    static IID := Guid("{98752974-b0a6-489b-8f6f-bff3769c8eeb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IImePlugInDictDictionaryList interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDictionariesInUse : IntPtr
        DeleteDictionary     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IImePlugInDictDictionaryList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Obtains the list of Dictionary IDs (GUID) of the IME plug-in dictionaries which are in use by IME, with their creation dates and encryption flags.
     * @param {Pointer<Pointer<SAFEARRAY>>} prgDateCreated Array of the dates of creation for each of the IME plug-in dictionaries returned by <i>prgDictionaryGUID</i>.
     * @param {Pointer<Pointer<SAFEARRAY>>} prgfEncrypted Array of flags indicating whether each dictionary is encrypted or not for each of the IME plug-in dictionaries returned by <i>prgDictionaryGUID</i>.
     * @returns {Pointer<SAFEARRAY>} Array of the dictionary IDs (<b>GUID</b>) of the IME plug-in dictionaries which are in use by IME.
     * @see https://learn.microsoft.com/windows/win32/api/msimeapi/nf-msimeapi-iimeplugindictdictionarylist-getdictionariesinuse
     */
    GetDictionariesInUse(prgDateCreated, prgfEncrypted) {
        prgDateCreatedMarshal := prgDateCreated is VarRef ? "ptr*" : "ptr"
        prgfEncryptedMarshal := prgfEncrypted is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr*", &prgDictionaryGUID := 0, prgDateCreatedMarshal, prgDateCreated, prgfEncryptedMarshal, prgfEncrypted, "HRESULT")
        return prgDictionaryGUID
    }

    /**
     * Deletes a dictionary from the IME's plug-in dictionary list.
     * @param {BSTR} bstrDictionaryGUID The dictionary ID (<b>GUID</b>) of the dictionary to be removed from the list.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified dictionary existed in the list and was successfully removed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified dictionary does not exist in the list.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Other errors.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msimeapi/nf-msimeapi-iimeplugindictdictionarylist-deletedictionary
     */
    DeleteDictionary(bstrDictionaryGUID) {
        bstrDictionaryGUID := bstrDictionaryGUID is String ? BSTR.Alloc(bstrDictionaryGUID).Value : bstrDictionaryGUID

        result := ComCall(4, this, BSTR, bstrDictionaryGUID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IImePlugInDictDictionaryList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDictionariesInUse := CallbackCreate(GetMethod(implObj, "GetDictionariesInUse"), flags, 4)
        this.vtbl.DeleteDictionary := CallbackCreate(GetMethod(implObj, "DeleteDictionary"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDictionariesInUse)
        CallbackFree(this.vtbl.DeleteDictionary)
    }
}
