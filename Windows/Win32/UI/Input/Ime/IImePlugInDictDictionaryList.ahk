#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides access to the list of IME plug-in dictionaries.
 * @remarks
 * 
 * This interface is implemented in classes of ProgID="ImePlugInDictDictionaryList1041" for Microsoft Japanese IME and ProgID="ImePlugInDictDictionaryList2052" for Microsoft Simplified Chinese IME.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msimeapi/nn-msimeapi-iimeplugindictdictionarylist
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IImePlugInDictDictionaryList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IImePlugInDictDictionaryList
     * @type {Guid}
     */
    static IID => Guid("{98752974-b0a6-489b-8f6f-bff3769c8eeb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDictionariesInUse", "DeleteDictionary"]

    /**
     * Obtains the list of Dictionay IDs (GUID) of the IME plug-in dictionaries which are in use by IME, with their creation dates and encryption flags.
     * @param {Pointer<Pointer<SAFEARRAY>>} prgDateCreated Array of the dates of creation for each of the IME plug-in dictionaries returned by <i>prgDictionaryGUID</i>.
     * @param {Pointer<Pointer<SAFEARRAY>>} prgfEncrypted Array of flags indicating whether each dictionary is encrypted or not for each of the IME plug-in dictionaries returned by <i>prgDictionaryGUID</i>.
     * @returns {Pointer<SAFEARRAY>} Array of the dictionary IDs (<b>GUID</b>) of the IME plug-in dictionaries which are in use by IME.
     * @see https://docs.microsoft.com/windows/win32/api//msimeapi/nf-msimeapi-iimeplugindictdictionarylist-getdictionariesinuse
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
     * @see https://docs.microsoft.com/windows/win32/api//msimeapi/nf-msimeapi-iimeplugindictdictionarylist-deletedictionary
     */
    DeleteDictionary(bstrDictionaryGUID) {
        bstrDictionaryGUID := bstrDictionaryGUID is String ? BSTR.Alloc(bstrDictionaryGUID).Value : bstrDictionaryGUID

        result := ComCall(4, this, "ptr", bstrDictionaryGUID, "HRESULT")
        return result
    }
}
