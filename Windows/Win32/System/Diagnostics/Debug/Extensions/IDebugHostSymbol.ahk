#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostContext.ahk
#Include .\IDebugHostSymbolEnumerator.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include .\IDebugHostType.ahk
#Include .\IDebugHostModule.ahk
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
     * @returns {IDebugHostContext} 
     */
    GetContext() {
        result := ComCall(3, this, "ptr*", &context := 0, "HRESULT")
        return IDebugHostContext(context)
    }

    /**
     * 
     * @param {Integer} kind 
     * @param {PWSTR} name 
     * @returns {IDebugHostSymbolEnumerator} 
     */
    EnumerateChildren(kind, name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(4, this, "int", kind, "ptr", name, "ptr*", &ppEnum := 0, "HRESULT")
        return IDebugHostSymbolEnumerator(ppEnum)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSymbolKind() {
        result := ComCall(5, this, "int*", &kind := 0, "HRESULT")
        return kind
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetName() {
        symbolName := BSTR()
        result := ComCall(6, this, "ptr", symbolName, "HRESULT")
        return symbolName
    }

    /**
     * 
     * @returns {IDebugHostType} 
     */
    GetType() {
        result := ComCall(7, this, "ptr*", &type := 0, "HRESULT")
        return IDebugHostType(type)
    }

    /**
     * 
     * @returns {IDebugHostModule} 
     */
    GetContainingModule() {
        result := ComCall(8, this, "ptr*", &containingModule := 0, "HRESULT")
        return IDebugHostModule(containingModule)
    }

    /**
     * 
     * @param {IDebugHostSymbol} pComparisonSymbol 
     * @param {Integer} comparisonFlags 
     * @returns {Boolean} 
     */
    CompareAgainst(pComparisonSymbol, comparisonFlags) {
        result := ComCall(9, this, "ptr", pComparisonSymbol, "uint", comparisonFlags, "int*", &pMatches := 0, "HRESULT")
        return pMatches
    }
}
