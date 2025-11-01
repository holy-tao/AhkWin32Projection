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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetConditionType", "GetSubConditions", "GetComparisonInfo", "GetValueType", "GetValueNormalization", "GetInputTerms", "Clone"]

    /**
     * 
     * @param {Pointer<Integer>} pNodeType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquerycondition/nf-structuredquerycondition-icondition-getconditiontype
     */
    GetConditionType(pNodeType) {
        result := ComCall(8, this, "int*", pNodeType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquerycondition/nf-structuredquerycondition-icondition-getsubconditions
     */
    GetSubConditions(riid, ppv) {
        result := ComCall(9, this, "ptr", riid, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszPropertyName 
     * @param {Pointer<Integer>} pcop 
     * @param {Pointer<PROPVARIANT>} ppropvar 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquerycondition/nf-structuredquerycondition-icondition-getcomparisoninfo
     */
    GetComparisonInfo(ppszPropertyName, pcop, ppropvar) {
        result := ComCall(10, this, "ptr", ppszPropertyName, "int*", pcop, "ptr", ppropvar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszValueTypeName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquerycondition/nf-structuredquerycondition-icondition-getvaluetype
     */
    GetValueType(ppszValueTypeName) {
        result := ComCall(11, this, "ptr", ppszValueTypeName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszNormalization 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquerycondition/nf-structuredquerycondition-icondition-getvaluenormalization
     */
    GetValueNormalization(ppszNormalization) {
        result := ComCall(12, this, "ptr", ppszNormalization, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRichChunk>} ppPropertyTerm 
     * @param {Pointer<IRichChunk>} ppOperationTerm 
     * @param {Pointer<IRichChunk>} ppValueTerm 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquerycondition/nf-structuredquerycondition-icondition-getinputterms
     */
    GetInputTerms(ppPropertyTerm, ppOperationTerm, ppValueTerm) {
        result := ComCall(13, this, "ptr*", ppPropertyTerm, "ptr*", ppOperationTerm, "ptr*", ppValueTerm, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ICondition>} ppc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquerycondition/nf-structuredquerycondition-icondition-clone
     */
    Clone(ppc) {
        result := ComCall(14, this, "ptr*", ppc, "HRESULT")
        return result
    }
}
