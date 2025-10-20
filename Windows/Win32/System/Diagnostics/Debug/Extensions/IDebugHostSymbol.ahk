#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostSymbol extends IUnknown{
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
     * 
     * @param {Pointer<IDebugHostContext>} context 
     * @returns {HRESULT} 
     */
    GetContext(context) {
        result := ComCall(3, this, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(4, this, "int", kind, "ptr", name, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} kind 
     * @returns {HRESULT} 
     */
    GetSymbolKind(kind) {
        result := ComCall(5, this, "int*", kind, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} symbolName 
     * @returns {HRESULT} 
     */
    GetName(symbolName) {
        result := ComCall(6, this, "ptr", symbolName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostType>} type 
     * @returns {HRESULT} 
     */
    GetType(type) {
        result := ComCall(7, this, "ptr", type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostModule>} containingModule 
     * @returns {HRESULT} 
     */
    GetContainingModule(containingModule) {
        result := ComCall(8, this, "ptr", containingModule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostSymbol>} pComparisonSymbol 
     * @param {Integer} comparisonFlags 
     * @param {Pointer<Boolean>} pMatches 
     * @returns {HRESULT} 
     */
    CompareAgainst(pComparisonSymbol, comparisonFlags, pMatches) {
        result := ComCall(9, this, "ptr", pComparisonSymbol, "uint", comparisonFlags, "int*", pMatches, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
