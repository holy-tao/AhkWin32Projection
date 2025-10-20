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
     * 
     * @param {Pointer<SAFEARRAY>} prgDictionaryGUID 
     * @param {Pointer<SAFEARRAY>} prgDateCreated 
     * @param {Pointer<SAFEARRAY>} prgfEncrypted 
     * @returns {HRESULT} 
     */
    GetDictionariesInUse(prgDictionaryGUID, prgDateCreated, prgfEncrypted) {
        result := ComCall(3, this, "ptr", prgDictionaryGUID, "ptr", prgDateCreated, "ptr", prgfEncrypted, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDictionaryGUID 
     * @returns {HRESULT} 
     */
    DeleteDictionary(bstrDictionaryGUID) {
        bstrDictionaryGUID := bstrDictionaryGUID is String ? BSTR.Alloc(bstrDictionaryGUID).Value : bstrDictionaryGUID

        result := ComCall(4, this, "ptr", bstrDictionaryGUID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
