#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEnumDebugExpressionContexts.ahk" { IEnumDebugExpressionContexts }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct IProvideExpressionContexts extends IUnknown {
    /**
     * The interface identifier for IProvideExpressionContexts
     * @type {Guid}
     */
    static IID := Guid("{51973c41-cb0c-11d0-b5c9-00a0244a0e7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IProvideExpressionContexts interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnumExpressionContexts : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IProvideExpressionContexts.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IEnumDebugExpressionContexts} 
     */
    EnumExpressionContexts() {
        result := ComCall(3, this, "ptr*", &ppedec := 0, "HRESULT")
        return IEnumDebugExpressionContexts(ppedec)
    }

    Query(iid) {
        if (IProvideExpressionContexts.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumExpressionContexts := CallbackCreate(GetMethod(implObj, "EnumExpressionContexts"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumExpressionContexts)
    }
}
