#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Gets the tokens that result from using a word breaker.
 * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nn-structuredquery-itokencollection
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ITokenCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITokenCollection
     * @type {Guid}
     */
    static IID => Guid("{22d8b4f2-f577-4adb-a335-c2ae88416fab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NumberOfTokens", "GetToken"]

    /**
     * Retrieves the number of tokens in the collection.
     * @param {Pointer<Integer>} pCount Type: <b>ULONG*</b>
     * 
     * Receives the number of tokens within the collection.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-itokencollection-numberoftokens
     */
    NumberOfTokens(pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * Retrieves the position, length, and any overriding string of an individual token.
     * @param {Integer} i Type: <b>ULONG</b>
     * 
     * The zero-based index of the desired token within the collection.
     * @param {Pointer<Integer>} pBegin Type: <b>ULONG*</b>
     * 
     * Receives the zero-based starting position of the specified token, in characters. This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} pLength Type: <b>ULONG*</b>
     * 
     * Receives the number of characters spanned by the token. This parameter can be <b>NULL</b>.
     * @param {Pointer<PWSTR>} ppsz Type: <b>LPWSTR*</b>
     * 
     * Receives the overriding text for this token if available, or <b>NULL</b> if there is none.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-itokencollection-gettoken
     */
    GetToken(i, pBegin, pLength, ppsz) {
        pBeginMarshal := pBegin is VarRef ? "uint*" : "ptr"
        pLengthMarshal := pLength is VarRef ? "uint*" : "ptr"
        ppszMarshal := ppsz is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", i, pBeginMarshal, pBegin, pLengthMarshal, pLength, ppszMarshal, ppsz, "HRESULT")
        return result
    }
}
