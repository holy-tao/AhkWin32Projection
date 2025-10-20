#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IPersistStream.ahk

/**
 * Provides methods for retrieving information about a search condition.
 * @remarks
 * 
  * Prior to Windows 7, this interface was only declared in structuredquery.h and structuredquery.idl. In Windows 7, this interface is also defined in structuredquerycondition.idl and structuredquerycondition.h.
  * 
  * The <a href="https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/StructuredQuerySample">StructuredQuerySample</a> demonstrates how to read lines from the console, parse them using the system schema, and display the resulting condition trees.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//structuredquerycondition/nn-structuredquerycondition-icondition
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ICondition extends IPersistStream{
    /**
     * The interface identifier for ICondition
     * @type {Guid}
     */
    static IID => Guid("{0fc988d4-c935-4b97-a973-46282ea175c8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {Pointer<Int32>} pNodeType 
     * @returns {HRESULT} 
     */
    GetConditionType(pNodeType) {
        result := ComCall(8, this, "int*", pNodeType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetSubConditions(riid, ppv) {
        result := ComCall(9, this, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszPropertyName 
     * @param {Pointer<Int32>} pcop 
     * @param {Pointer<PROPVARIANT>} ppropvar 
     * @returns {HRESULT} 
     */
    GetComparisonInfo(ppszPropertyName, pcop, ppropvar) {
        result := ComCall(10, this, "ptr", ppszPropertyName, "int*", pcop, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszValueTypeName 
     * @returns {HRESULT} 
     */
    GetValueType(ppszValueTypeName) {
        result := ComCall(11, this, "ptr", ppszValueTypeName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszNormalization 
     * @returns {HRESULT} 
     */
    GetValueNormalization(ppszNormalization) {
        result := ComCall(12, this, "ptr", ppszNormalization, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRichChunk>} ppPropertyTerm 
     * @param {Pointer<IRichChunk>} ppOperationTerm 
     * @param {Pointer<IRichChunk>} ppValueTerm 
     * @returns {HRESULT} 
     */
    GetInputTerms(ppPropertyTerm, ppOperationTerm, ppValueTerm) {
        result := ComCall(13, this, "ptr", ppPropertyTerm, "ptr", ppOperationTerm, "ptr", ppValueTerm, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICondition>} ppc 
     * @returns {HRESULT} 
     */
    Clone(ppc) {
        result := ComCall(14, this, "ptr", ppc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
