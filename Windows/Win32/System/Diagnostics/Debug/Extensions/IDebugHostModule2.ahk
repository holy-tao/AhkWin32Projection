#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugHostModule.ahk" { IDebugHostModule }
#Import ".\IDebugHostSymbol.ahk" { IDebugHostSymbol }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostModule2 extends IDebugHostModule {
    /**
     * The interface identifier for IDebugHostModule2
     * @type {Guid}
     */
    static IID := Guid("{b51887e8-bcd0-4e8f-a8c7-434398b78c37}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostModule2 interfaces
    */
    struct Vtbl extends IDebugHostModule.Vtbl {
        FindContainingSymbolByRVA : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostModule2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} rva 
     * @param {Pointer<IDebugHostSymbol>} symbol 
     * @param {Pointer<Integer>} offset 
     * @returns {HRESULT} 
     */
    FindContainingSymbolByRVA(rva, symbol, offset) {
        offsetMarshal := offset is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "uint", rva, IDebugHostSymbol.Ptr, symbol, offsetMarshal, offset, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugHostModule2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FindContainingSymbolByRVA := CallbackCreate(GetMethod(implObj, "FindContainingSymbolByRVA"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FindContainingSymbolByRVA)
    }
}
