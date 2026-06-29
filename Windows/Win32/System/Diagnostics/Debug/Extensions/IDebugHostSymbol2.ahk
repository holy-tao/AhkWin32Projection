#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\LanguageKind.ahk" { LanguageKind }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugHostSymbol.ahk" { IDebugHostSymbol }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostSymbol2 extends IDebugHostSymbol {
    /**
     * The interface identifier for IDebugHostSymbol2
     * @type {Guid}
     */
    static IID := Guid("{21515b67-6720-4257-8a68-077dc944471c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostSymbol2 interfaces
    */
    struct Vtbl extends IDebugHostSymbol.Vtbl {
        GetLanguage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostSymbol2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {LanguageKind} 
     */
    GetLanguage() {
        result := ComCall(10, this, "int*", &pKind := 0, "HRESULT")
        return pKind
    }

    Query(iid) {
        if (IDebugHostSymbol2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLanguage := CallbackCreate(GetMethod(implObj, "GetLanguage"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLanguage)
    }
}
