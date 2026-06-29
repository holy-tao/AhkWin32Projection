#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDebugHostContext.ahk" { IDebugHostContext }
#Import ".\SymbolKind.ahk" { SymbolKind }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugHostModule.ahk" { IDebugHostModule }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDebugHostType.ahk" { IDebugHostType }
#Import ".\IDebugHostSymbolEnumerator.ahk" { IDebugHostSymbolEnumerator }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostSymbol extends IUnknown {
    /**
     * The interface identifier for IDebugHostSymbol
     * @type {Guid}
     */
    static IID := Guid("{0f819103-87de-4e96-8277-e05cd441fb22}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostSymbol interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetContext          : IntPtr
        EnumerateChildren   : IntPtr
        GetSymbolKind       : IntPtr
        GetName             : IntPtr
        GetType             : IntPtr
        GetContainingModule : IntPtr
        CompareAgainst      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostSymbol.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IDebugHostContext} 
     */
    GetContext() {
        result := ComCall(3, this, "ptr*", &_context := 0, "HRESULT")
        return IDebugHostContext(_context)
    }

    /**
     * 
     * @param {SymbolKind} kind 
     * @param {PWSTR} name 
     * @returns {IDebugHostSymbolEnumerator} 
     */
    EnumerateChildren(kind, name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(4, this, SymbolKind, kind, "ptr", name, "ptr*", &ppEnum := 0, "HRESULT")
        return IDebugHostSymbolEnumerator(ppEnum)
    }

    /**
     * 
     * @returns {SymbolKind} 
     */
    GetSymbolKind() {
        result := ComCall(5, this, "int*", &kind := 0, "HRESULT")
        return kind
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetName
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecstrings-getname
     */
    GetName() {
        symbolName := BSTR.Owned()
        result := ComCall(6, this, BSTR.Ptr, symbolName, "HRESULT")
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

    Query(iid) {
        if (IDebugHostSymbol.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetContext := CallbackCreate(GetMethod(implObj, "GetContext"), flags, 2)
        this.vtbl.EnumerateChildren := CallbackCreate(GetMethod(implObj, "EnumerateChildren"), flags, 4)
        this.vtbl.GetSymbolKind := CallbackCreate(GetMethod(implObj, "GetSymbolKind"), flags, 2)
        this.vtbl.GetName := CallbackCreate(GetMethod(implObj, "GetName"), flags, 2)
        this.vtbl.GetType := CallbackCreate(GetMethod(implObj, "GetType"), flags, 2)
        this.vtbl.GetContainingModule := CallbackCreate(GetMethod(implObj, "GetContainingModule"), flags, 2)
        this.vtbl.CompareAgainst := CallbackCreate(GetMethod(implObj, "CompareAgainst"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetContext)
        CallbackFree(this.vtbl.EnumerateChildren)
        CallbackFree(this.vtbl.GetSymbolKind)
        CallbackFree(this.vtbl.GetName)
        CallbackFree(this.vtbl.GetType)
        CallbackFree(this.vtbl.GetContainingModule)
        CallbackFree(this.vtbl.CompareAgainst)
    }
}
