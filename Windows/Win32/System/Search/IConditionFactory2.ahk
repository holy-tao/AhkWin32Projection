#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IConditionFactory.ahk

/**
 * Extends the functionality of IConditionFactory. IConditionFactory2 provides methods for creating or resolving a condition tree that was obtained by parsing a query string.
 * @remarks
 * 
 * The <a href="https://github.com/microsoft/Windows-classic-samples/tree/master/Samples/Win7Samples/winui/WindowsSearch/StructuredQuerySample">StructuredQuerySample</a> demonstrates how to read lines from the console, parse them using the system schema, and display the resulting condition trees.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nn-structuredquery-iconditionfactory2
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IConditionFactory2 extends IConditionFactory{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConditionFactory2
     * @type {Guid}
     */
    static IID => Guid("{71d222e1-432f-429e-8c13-b6dafde5077a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTrueFalse", "CreateNegation", "CreateCompoundFromObjectArray", "CreateCompoundFromArray", "CreateStringLeaf", "CreateIntegerLeaf", "CreateBooleanLeaf", "CreateLeaf", "ResolveCondition"]

    /**
     * 
     * @param {BOOL} fVal 
     * @param {Integer} cco 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iconditionfactory2-createtruefalse
     */
    CreateTrueFalse(fVal, cco, riid) {
        result := ComCall(7, this, "int", fVal, "int", cco, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {ICondition} pcSub 
     * @param {Integer} cco 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iconditionfactory2-createnegation
     */
    CreateNegation(pcSub, cco, riid) {
        result := ComCall(8, this, "ptr", pcSub, "int", cco, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Integer} ct 
     * @param {IObjectArray} poaSubs 
     * @param {Integer} cco 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iconditionfactory2-createcompoundfromobjectarray
     */
    CreateCompoundFromObjectArray(ct, poaSubs, cco, riid) {
        result := ComCall(9, this, "int", ct, "ptr", poaSubs, "int", cco, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Integer} ct 
     * @param {Pointer<ICondition>} ppcondSubs 
     * @param {Integer} cSubs 
     * @param {Integer} cco 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iconditionfactory2-createcompoundfromarray
     */
    CreateCompoundFromArray(ct, ppcondSubs, cSubs, cco, riid) {
        result := ComCall(10, this, "int", ct, "ptr*", ppcondSubs, "uint", cSubs, "int", cco, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} propkey 
     * @param {Integer} cop 
     * @param {PWSTR} pszValue 
     * @param {PWSTR} pszLocaleName 
     * @param {Integer} cco 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iconditionfactory2-createstringleaf
     */
    CreateStringLeaf(propkey, cop, pszValue, pszLocaleName, cco, riid) {
        pszValue := pszValue is String ? StrPtr(pszValue) : pszValue
        pszLocaleName := pszLocaleName is String ? StrPtr(pszLocaleName) : pszLocaleName

        result := ComCall(11, this, "ptr", propkey, "int", cop, "ptr", pszValue, "ptr", pszLocaleName, "int", cco, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} propkey 
     * @param {Integer} cop 
     * @param {Integer} lValue 
     * @param {Integer} cco 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iconditionfactory2-createintegerleaf
     */
    CreateIntegerLeaf(propkey, cop, lValue, cco, riid) {
        result := ComCall(12, this, "ptr", propkey, "int", cop, "int", lValue, "int", cco, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} propkey 
     * @param {Integer} cop 
     * @param {BOOL} fValue 
     * @param {Integer} cco 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iconditionfactory2-createbooleanleaf
     */
    CreateBooleanLeaf(propkey, cop, fValue, cco, riid) {
        result := ComCall(13, this, "ptr", propkey, "int", cop, "int", fValue, "int", cco, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} propkey 
     * @param {Integer} cop 
     * @param {Pointer<PROPVARIANT>} propvar 
     * @param {PWSTR} pszSemanticType 
     * @param {PWSTR} pszLocaleName 
     * @param {IRichChunk} pPropertyNameTerm 
     * @param {IRichChunk} pOperationTerm 
     * @param {IRichChunk} pValueTerm 
     * @param {Integer} cco 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iconditionfactory2-createleaf
     */
    CreateLeaf(propkey, cop, propvar, pszSemanticType, pszLocaleName, pPropertyNameTerm, pOperationTerm, pValueTerm, cco, riid) {
        pszSemanticType := pszSemanticType is String ? StrPtr(pszSemanticType) : pszSemanticType
        pszLocaleName := pszLocaleName is String ? StrPtr(pszLocaleName) : pszLocaleName

        result := ComCall(14, this, "ptr", propkey, "int", cop, "ptr", propvar, "ptr", pszSemanticType, "ptr", pszLocaleName, "ptr", pPropertyNameTerm, "ptr", pOperationTerm, "ptr", pValueTerm, "int", cco, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {ICondition} pc 
     * @param {Integer} sqro 
     * @param {Pointer<SYSTEMTIME>} pstReferenceTime 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-iconditionfactory2-resolvecondition
     */
    ResolveCondition(pc, sqro, pstReferenceTime, riid) {
        result := ComCall(15, this, "ptr", pc, "int", sqro, "ptr", pstReferenceTime, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
