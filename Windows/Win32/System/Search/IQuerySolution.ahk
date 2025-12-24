#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IConditionFactory.ahk

/**
 * Provides methods that retrieve information about the interpretation of a parsed query.
 * @remarks
 * 
 * The <a href="https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/StructuredQuerySample">StructuredQuerySample</a> demonstrates how to read lines from the console, parse them using the system schema, and display the resulting condition trees.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nn-structuredquery-iquerysolution
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IQuerySolution extends IConditionFactory{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IQuerySolution
     * @type {Guid}
     */
    static IID => Guid("{d6ebc66b-8921-4193-afdd-a1789fb7ff57}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetQuery", "GetErrors", "GetLexicalData"]

    /**
     * Retrieves the condition tree and the semantic type of the solution.
     * @param {Pointer<ICondition>} ppQueryNode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a>**</b>
     * 
     * Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-icondition">ICondition</a> condition tree that is the interpretation of the query string. This parameter can be <b>NULL</b>.
     * @param {Pointer<IEntity>} ppMainType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ientity">IEntity</a>**</b>
     * 
     * Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ientity">IEntity</a> object that identifies the semantic type of the interpretation. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iquerysolution-getquery
     */
    GetQuery(ppQueryNode, ppMainType) {
        result := ComCall(7, this, "ptr*", ppQueryNode, "ptr*", ppMainType, "HRESULT")
        return result
    }

    /**
     * Identifies parts of the input string that the parser did not recognize or did not use when constructing the IQuerySolution condition tree.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the result, either IID_IEnumUnknown or IID_IEnumVARIANT.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives a pointer to an enumeration of zero or more <a href="https://docs.microsoft.com/windows/desktop/api/structuredquerycondition/nn-structuredquerycondition-irichchunk">IRichChunk</a> objects, each describing one parsing error.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iquerysolution-geterrors
     */
    GetErrors(riid) {
        result := ComCall(8, this, "ptr", riid, "ptr*", &ppParseErrors := 0, "HRESULT")
        return ppParseErrors
    }

    /**
     * Reports the query string, how it was tokenized, and what language code identifier (LCID) and word breaker were used to parse it.
     * @param {Pointer<PWSTR>} ppszInputString Type: <b>LPWSTR*</b>
     * 
     * Receives the query string. This parameter can be <b>NULL</b>.
     * @param {Pointer<ITokenCollection>} ppTokens Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-itokencollection">ITokenCollection</a>**</b>
     * 
     * Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-itokencollection">ITokenCollection</a> object that describes how the query was tokenized. This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} plcid Type: <b>LCID*</b>
     * 
     * Receives a LCID for the word breaker used for this query. This parameter can be <b>NULL</b>.
     * @param {Pointer<IUnknown>} ppWordBreaker Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * Receives a pointer to the word breaker used for this query. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-iquerysolution-getlexicaldata
     */
    GetLexicalData(ppszInputString, ppTokens, plcid, ppWordBreaker) {
        ppszInputStringMarshal := ppszInputString is VarRef ? "ptr*" : "ptr"
        plcidMarshal := plcid is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, ppszInputStringMarshal, ppszInputString, "ptr*", ppTokens, plcidMarshal, plcid, "ptr*", ppWordBreaker, "HRESULT")
        return result
    }
}
