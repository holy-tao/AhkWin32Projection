#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct IAsyncManager extends IUnknown {
    /**
     * The interface identifier for IAsyncManager
     * @type {Guid}
     */
    static IID := Guid("{0000002a-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAsyncManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CompleteCall   : IntPtr
        GetCallContext : IntPtr
        GetState       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAsyncManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HRESULT} Result 
     * @returns {HRESULT} 
     */
    CompleteCall(Result) {
        result := ComCall(3, this, "int", Result, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetCallContext(riid) {
        result := ComCall(4, this, Guid.Ptr, riid, "ptr*", &pInterface := 0, "HRESULT")
        return pInterface
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetState() {
        result := ComCall(5, this, "uint*", &pulStateFlags := 0, "HRESULT")
        return pulStateFlags
    }

    Query(iid) {
        if (IAsyncManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CompleteCall := CallbackCreate(GetMethod(implObj, "CompleteCall"), flags, 2)
        this.vtbl.GetCallContext := CallbackCreate(GetMethod(implObj, "GetCallContext"), flags, 3)
        this.vtbl.GetState := CallbackCreate(GetMethod(implObj, "GetState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CompleteCall)
        CallbackFree(this.vtbl.GetCallContext)
        CallbackFree(this.vtbl.GetState)
    }
}
