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
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-itokencollection-numberoftokens
     */
    NumberOfTokens(pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} i 
     * @param {Pointer<Integer>} pBegin 
     * @param {Pointer<Integer>} pLength 
     * @param {Pointer<PWSTR>} ppsz 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-itokencollection-gettoken
     */
    GetToken(i, pBegin, pLength, ppsz) {
        pBeginMarshal := pBegin is VarRef ? "uint*" : "ptr"
        pLengthMarshal := pLength is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", i, pBeginMarshal, pBegin, pLengthMarshal, pLength, "ptr", ppsz, "HRESULT")
        return result
    }
}
