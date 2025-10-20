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
     * 
     * @param {Pointer<ICondition>} ppQueryNode 
     * @param {Pointer<IEntity>} ppMainType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iquerysolution-getquery
     */
    GetQuery(ppQueryNode, ppMainType) {
        result := ComCall(7, this, "ptr*", ppQueryNode, "ptr*", ppMainType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppParseErrors 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iquerysolution-geterrors
     */
    GetErrors(riid, ppParseErrors) {
        result := ComCall(8, this, "ptr", riid, "ptr*", ppParseErrors, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszInputString 
     * @param {Pointer<ITokenCollection>} ppTokens 
     * @param {Pointer<Integer>} plcid 
     * @param {Pointer<IUnknown>} ppWordBreaker 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iquerysolution-getlexicaldata
     */
    GetLexicalData(ppszInputString, ppTokens, plcid, ppWordBreaker) {
        result := ComCall(9, this, "ptr", ppszInputString, "ptr*", ppTokens, "uint*", plcid, "ptr*", ppWordBreaker, "HRESULT")
        return result
    }
}
