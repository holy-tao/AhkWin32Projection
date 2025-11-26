#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides a method for retrieving a key/value pair of strings from an IEntity, IRelationship or ISchemaProvider object.
 * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nn-structuredquery-imetadata
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IMetaData extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMetaData
     * @type {Guid}
     */
    static IID => Guid("{780102b0-c43b-4876-bc7b-5e9ba5c88794}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetData"]

    /**
     * Retrieves one key/value pair from the metadata of an IEntity, IRelationship, or ISchemaProvider object.
     * @param {Pointer<PWSTR>} ppszKey Type: <b>LPCWSTR*</b>
     * 
     * Receives the key of the metadata pair as a Unicode string. The calling application must free the returned string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @param {Pointer<PWSTR>} ppszValue Type: <b>LPWSTR*</b>
     * 
     * Receives the value of the metadata pair as a Unicode string. The calling application must free the returned string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-imetadata-getdata
     */
    GetData(ppszKey, ppszValue) {
        ppszKeyMarshal := ppszKey is VarRef ? "ptr*" : "ptr"
        ppszValueMarshal := ppszValue is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, ppszKeyMarshal, ppszKey, ppszValueMarshal, ppszValue, "HRESULT")
        return result
    }
}
