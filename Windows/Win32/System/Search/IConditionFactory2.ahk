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
     * 
     * @param {BOOL} fVal 
     * @param {Integer} cco 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    CreateTrueFalse(fVal, cco, riid, ppv) {
        result := ComCall(7, this, "int", fVal, "int", cco, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICondition>} pcSub 
     * @param {Integer} cco 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    CreateNegation(pcSub, cco, riid, ppv) {
        result := ComCall(8, this, "ptr", pcSub, "int", cco, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ct 
     * @param {Pointer<IObjectArray>} poaSubs 
     * @param {Integer} cco 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    CreateCompoundFromObjectArray(ct, poaSubs, cco, riid, ppv) {
        result := ComCall(9, this, "int", ct, "ptr", poaSubs, "int", cco, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ct 
     * @param {Pointer<ICondition>} ppcondSubs 
     * @param {Integer} cSubs 
     * @param {Integer} cco 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    CreateCompoundFromArray(ct, ppcondSubs, cSubs, cco, riid, ppv) {
        result := ComCall(10, this, "int", ct, "ptr", ppcondSubs, "uint", cSubs, "int", cco, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} propkey 
     * @param {Integer} cop 
     * @param {PWSTR} pszValue 
     * @param {PWSTR} pszLocaleName 
     * @param {Integer} cco 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    CreateStringLeaf(propkey, cop, pszValue, pszLocaleName, cco, riid, ppv) {
        pszValue := pszValue is String ? StrPtr(pszValue) : pszValue
        pszLocaleName := pszLocaleName is String ? StrPtr(pszLocaleName) : pszLocaleName

        result := ComCall(11, this, "ptr", propkey, "int", cop, "ptr", pszValue, "ptr", pszLocaleName, "int", cco, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} propkey 
     * @param {Integer} cop 
     * @param {Integer} lValue 
     * @param {Integer} cco 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    CreateIntegerLeaf(propkey, cop, lValue, cco, riid, ppv) {
        result := ComCall(12, this, "ptr", propkey, "int", cop, "int", lValue, "int", cco, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} propkey 
     * @param {Integer} cop 
     * @param {BOOL} fValue 
     * @param {Integer} cco 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    CreateBooleanLeaf(propkey, cop, fValue, cco, riid, ppv) {
        result := ComCall(13, this, "ptr", propkey, "int", cop, "int", fValue, "int", cco, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} propkey 
     * @param {Integer} cop 
     * @param {Pointer<PROPVARIANT>} propvar 
     * @param {PWSTR} pszSemanticType 
     * @param {PWSTR} pszLocaleName 
     * @param {Pointer<IRichChunk>} pPropertyNameTerm 
     * @param {Pointer<IRichChunk>} pOperationTerm 
     * @param {Pointer<IRichChunk>} pValueTerm 
     * @param {Integer} cco 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    CreateLeaf(propkey, cop, propvar, pszSemanticType, pszLocaleName, pPropertyNameTerm, pOperationTerm, pValueTerm, cco, riid, ppv) {
        pszSemanticType := pszSemanticType is String ? StrPtr(pszSemanticType) : pszSemanticType
        pszLocaleName := pszLocaleName is String ? StrPtr(pszLocaleName) : pszLocaleName

        result := ComCall(14, this, "ptr", propkey, "int", cop, "ptr", propvar, "ptr", pszSemanticType, "ptr", pszLocaleName, "ptr", pPropertyNameTerm, "ptr", pOperationTerm, "ptr", pValueTerm, "int", cco, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICondition>} pc 
     * @param {Integer} sqro 
     * @param {Pointer<SYSTEMTIME>} pstReferenceTime 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    ResolveCondition(pc, sqro, pstReferenceTime, riid, ppv) {
        result := ComCall(15, this, "ptr", pc, "int", sqro, "ptr", pstReferenceTime, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
