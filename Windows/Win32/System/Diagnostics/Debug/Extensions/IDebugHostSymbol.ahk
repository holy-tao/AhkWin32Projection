#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostSymbol extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostSymbol
     * @type {Guid}
     */
    static IID => Guid("{0f819103-87de-4e96-8277-e05cd441fb22}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetContext", "EnumerateChildren", "GetSymbolKind", "GetName", "GetType", "GetContainingModule", "CompareAgainst"]

    /**
     * 
     * @param {Pointer<IDebugHostContext>} context 
     * @returns {HRESULT} 
     */
    GetContext(context) {
        result := ComCall(3, this, "ptr*", context, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} kind 
     * @param {PWSTR} name 
     * @param {Pointer<IDebugHostSymbolEnumerator>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumerateChildren(kind, name, ppEnum) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(4, this, "int", kind, "ptr", name, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} kind 
     * @returns {HRESULT} 
     */
    GetSymbolKind(kind) {
        kindMarshal := kind is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, kindMarshal, kind, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} symbolName 
     * @returns {HRESULT} 
     */
    GetName(symbolName) {
        result := ComCall(6, this, "ptr", symbolName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostType>} type 
     * @returns {HRESULT} 
     */
    GetType(type) {
        result := ComCall(7, this, "ptr*", type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostModule>} containingModule 
     * @returns {HRESULT} 
     */
    GetContainingModule(containingModule) {
        result := ComCall(8, this, "ptr*", containingModule, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugHostSymbol} pComparisonSymbol 
     * @param {Integer} comparisonFlags 
     * @param {Pointer<Boolean>} pMatches 
     * @returns {HRESULT} 
     */
    CompareAgainst(pComparisonSymbol, comparisonFlags, pMatches) {
        pMatchesMarshal := pMatches is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, "ptr", pComparisonSymbol, "uint", comparisonFlags, pMatchesMarshal, pMatches, "HRESULT")
        return result
    }
}
