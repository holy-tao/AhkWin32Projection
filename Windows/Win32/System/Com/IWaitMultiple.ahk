#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }
#Import ".\ISynchronize.ahk" { ISynchronize }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct IWaitMultiple extends IUnknown {
    /**
     * The interface identifier for IWaitMultiple
     * @type {Guid}
     */
    static IID := Guid("{0000002b-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWaitMultiple interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        WaitMultiple   : IntPtr
        AddSynchronize : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWaitMultiple.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} timeout 
     * @returns {ISynchronize} 
     */
    WaitMultiple(timeout) {
        result := ComCall(3, this, "uint", timeout, "ptr*", &pSync := 0, "HRESULT")
        return ISynchronize(pSync)
    }

    /**
     * 
     * @param {ISynchronize} pSync 
     * @returns {HRESULT} 
     */
    AddSynchronize(pSync) {
        result := ComCall(4, this, "ptr", pSync, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWaitMultiple.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.WaitMultiple := CallbackCreate(GetMethod(implObj, "WaitMultiple"), flags, 3)
        this.vtbl.AddSynchronize := CallbackCreate(GetMethod(implObj, "AddSynchronize"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.WaitMultiple)
        CallbackFree(this.vtbl.AddSynchronize)
    }
}
