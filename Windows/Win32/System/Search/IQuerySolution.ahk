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
     * 
     * @param {Pointer<ICondition>} ppQueryNode 
     * @param {Pointer<IEntity>} ppMainType 
     * @returns {HRESULT} 
     */
    GetQuery(ppQueryNode, ppMainType) {
        result := ComCall(7, this, "ptr", ppQueryNode, "ptr", ppMainType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppParseErrors 
     * @returns {HRESULT} 
     */
    GetErrors(riid, ppParseErrors) {
        result := ComCall(8, this, "ptr", riid, "ptr", ppParseErrors, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszInputString 
     * @param {Pointer<ITokenCollection>} ppTokens 
     * @param {Pointer<UInt32>} plcid 
     * @param {Pointer<IUnknown>} ppWordBreaker 
     * @returns {HRESULT} 
     */
    GetLexicalData(ppszInputString, ppTokens, plcid, ppWordBreaker) {
        result := ComCall(9, this, "ptr", ppszInputString, "ptr", ppTokens, "uint*", plcid, "ptr", ppWordBreaker, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
