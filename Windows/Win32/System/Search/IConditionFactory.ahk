#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICondition.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods for creating or resolving a condition tree that was obtained by parsing a query string.
 * @remarks
 * 
  * The <a href="https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/StructuredQuerySample">StructuredQuerySample</a> demonstrates how to read lines from the console, parse them using the system schema, and display the resulting condition trees.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nn-structuredquery-iconditionfactory
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IConditionFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConditionFactory
     * @type {Guid}
     */
    static IID => Guid("{a5efe073-b16f-474f-9f3e-9f8b497a3e08}")

    /**
     * The class identifier for ConditionFactory
     * @type {Guid}
     */
    static CLSID => Guid("{e03e85b0-7be3-4000-ba98-6c13de9fa486}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MakeNot", "MakeAndOr", "MakeLeaf", "Resolve"]

    /**
     * 
     * @param {ICondition} pcSub 
     * @param {BOOL} fSimplify 
     * @returns {ICondition} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iconditionfactory-makenot
     */
    MakeNot(pcSub, fSimplify) {
        result := ComCall(3, this, "ptr", pcSub, "int", fSimplify, "ptr*", &ppcResult := 0, "HRESULT")
        return ICondition(ppcResult)
    }

    /**
     * 
     * @param {Integer} ct 
     * @param {IEnumUnknown} peuSubs 
     * @param {BOOL} fSimplify 
     * @returns {ICondition} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iconditionfactory-makeandor
     */
    MakeAndOr(ct, peuSubs, fSimplify) {
        result := ComCall(4, this, "int", ct, "ptr", peuSubs, "int", fSimplify, "ptr*", &ppcResult := 0, "HRESULT")
        return ICondition(ppcResult)
    }

    /**
     * 
     * @param {PWSTR} pszPropertyName 
     * @param {Integer} cop 
     * @param {PWSTR} pszValueType 
     * @param {Pointer<PROPVARIANT>} ppropvar 
     * @param {IRichChunk} pPropertyNameTerm 
     * @param {IRichChunk} pOperationTerm 
     * @param {IRichChunk} pValueTerm 
     * @param {BOOL} fExpand 
     * @returns {ICondition} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iconditionfactory-makeleaf
     */
    MakeLeaf(pszPropertyName, cop, pszValueType, ppropvar, pPropertyNameTerm, pOperationTerm, pValueTerm, fExpand) {
        pszPropertyName := pszPropertyName is String ? StrPtr(pszPropertyName) : pszPropertyName
        pszValueType := pszValueType is String ? StrPtr(pszValueType) : pszValueType

        result := ComCall(5, this, "ptr", pszPropertyName, "int", cop, "ptr", pszValueType, "ptr", ppropvar, "ptr", pPropertyNameTerm, "ptr", pOperationTerm, "ptr", pValueTerm, "int", fExpand, "ptr*", &ppcResult := 0, "HRESULT")
        return ICondition(ppcResult)
    }

    /**
     * 
     * @param {ICondition} pc 
     * @param {Integer} sqro 
     * @param {Pointer<SYSTEMTIME>} pstReferenceTime 
     * @returns {ICondition} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iconditionfactory-resolve
     */
    Resolve(pc, sqro, pstReferenceTime) {
        result := ComCall(6, this, "ptr", pc, "int", sqro, "ptr", pstReferenceTime, "ptr*", &ppcResolved := 0, "HRESULT")
        return ICondition(ppcResolved)
    }
}
