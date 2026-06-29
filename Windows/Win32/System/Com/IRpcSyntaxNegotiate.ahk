#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }
#Import ".\RPCOLEMESSAGE.ahk" { RPCOLEMESSAGE }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct IRpcSyntaxNegotiate extends IUnknown {
    /**
     * The interface identifier for IRpcSyntaxNegotiate
     * @type {Guid}
     */
    static IID := Guid("{58a08519-24c8-4935-b482-3fd823333a4f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRpcSyntaxNegotiate interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        NegotiateSyntax : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRpcSyntaxNegotiate.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @returns {HRESULT} 
     */
    NegotiateSyntax(pMsg) {
        result := ComCall(3, this, RPCOLEMESSAGE.Ptr, pMsg, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRpcSyntaxNegotiate.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.NegotiateSyntax := CallbackCreate(GetMethod(implObj, "NegotiateSyntax"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.NegotiateSyntax)
    }
}
