#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugHostSymbol.ahk" { IDebugHostSymbol }
#Import ".\IDebugHostSymbolEnumerator.ahk" { IDebugHostSymbolEnumerator }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostSymbolSubstitutionEnumerator extends IDebugHostSymbolEnumerator {
    /**
     * The interface identifier for IDebugHostSymbolSubstitutionEnumerator
     * @type {Guid}
     */
    static IID := Guid("{d49eece8-8d12-4ce1-ab73-e5b63df4f9d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostSymbolSubstitutionEnumerator interfaces
    */
    struct Vtbl extends IDebugHostSymbolEnumerator.Vtbl {
        GetNextWithSubstitutionText : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostSymbolSubstitutionEnumerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<IDebugHostSymbol>} symbol 
     * @param {Pointer<BSTR>} symbolText 
     * @returns {HRESULT} 
     */
    GetNextWithSubstitutionText(symbol, symbolText) {
        result := ComCall(5, this, IDebugHostSymbol.Ptr, symbol, BSTR.Ptr, symbolText, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugHostSymbolSubstitutionEnumerator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNextWithSubstitutionText := CallbackCreate(GetMethod(implObj, "GetNextWithSubstitutionText"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNextWithSubstitutionText)
    }
}
