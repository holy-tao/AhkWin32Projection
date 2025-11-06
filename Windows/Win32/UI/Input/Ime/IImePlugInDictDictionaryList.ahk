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
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} prgDateCreated 
     * @param {Pointer<Pointer<SAFEARRAY>>} prgfEncrypted 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/msimeapi/nf-msimeapi-iimeplugindictdictionarylist-getdictionariesinuse
     */
    GetDictionariesInUse(prgDateCreated, prgfEncrypted) {
        prgDateCreatedMarshal := prgDateCreated is VarRef ? "ptr*" : "ptr"
        prgfEncryptedMarshal := prgfEncrypted is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr*", &prgDictionaryGUID := 0, prgDateCreatedMarshal, prgDateCreated, prgfEncryptedMarshal, prgfEncrypted, "HRESULT")
        return prgDictionaryGUID
    }

    /**
     * 
     * @param {BSTR} bstrDictionaryGUID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msimeapi/nf-msimeapi-iimeplugindictdictionarylist-deletedictionary
     */
    DeleteDictionary(bstrDictionaryGUID) {
        bstrDictionaryGUID := bstrDictionaryGUID is String ? BSTR.Alloc(bstrDictionaryGUID).Value : bstrDictionaryGUID

        result := ComCall(4, this, "ptr", bstrDictionaryGUID, "HRESULT")
        return result
    }
}
