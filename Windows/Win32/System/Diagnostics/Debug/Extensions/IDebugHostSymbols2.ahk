#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IDebugHostSymbols.ahk" { IDebugHostSymbols }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugHostSymbol.ahk" { IDebugHostSymbol }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostSymbols2 extends IDebugHostSymbols {
    /**
     * The interface identifier for IDebugHostSymbols2
     * @type {Guid}
     */
    static IID := Guid("{6baf1f48-65ee-4ff2-b3af-10c7f21d38b2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostSymbols2 interfaces
    */
    struct Vtbl extends IDebugHostSymbols.Vtbl {
        DemangleSymbolName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostSymbols2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDebugHostSymbol} pSymbol 
     * @param {Integer} flags 
     * @returns {BSTR} 
     */
    DemangleSymbolName(pSymbol, flags) {
        pDemangledSymbolName := BSTR.Owned()
        result := ComCall(10, this, "ptr", pSymbol, "uint", flags, BSTR.Ptr, pDemangledSymbolName, "HRESULT")
        return pDemangledSymbolName
    }

    Query(iid) {
        if (IDebugHostSymbols2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DemangleSymbolName := CallbackCreate(GetMethod(implObj, "DemangleSymbolName"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DemangleSymbolName)
    }
}
