#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\LUID.ahk" { LUID }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12SwapChainAssistant extends IUnknown {
    /**
     * The interface identifier for ID3D12SwapChainAssistant
     * @type {Guid}
     */
    static IID := Guid("{f1df64b6-57fd-49cd-8807-c0eb88b45c8f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12SwapChainAssistant interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetLUID                           : IntPtr
        GetSwapChainObject                : IntPtr
        GetCurrentResourceAndCommandQueue : IntPtr
        InsertImplicitSync                : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12SwapChainAssistant.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {LUID} 
     */
    GetLUID() {
        result := ComCall(3, this, LUID)
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetSwapChainObject(riid) {
        result := ComCall(4, this, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Pointer<Guid>} riidResource 
     * @param {Pointer<Pointer<Void>>} ppvResource 
     * @param {Pointer<Guid>} riidQueue 
     * @param {Pointer<Pointer<Void>>} ppvQueue 
     * @returns {HRESULT} 
     */
    GetCurrentResourceAndCommandQueue(riidResource, ppvResource, riidQueue, ppvQueue) {
        ppvResourceMarshal := ppvResource is VarRef ? "ptr*" : "ptr"
        ppvQueueMarshal := ppvQueue is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, Guid.Ptr, riidResource, ppvResourceMarshal, ppvResource, Guid.Ptr, riidQueue, ppvQueueMarshal, ppvQueue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InsertImplicitSync() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D12SwapChainAssistant.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLUID := CallbackCreate(GetMethod(implObj, "GetLUID"), flags, 1)
        this.vtbl.GetSwapChainObject := CallbackCreate(GetMethod(implObj, "GetSwapChainObject"), flags, 3)
        this.vtbl.GetCurrentResourceAndCommandQueue := CallbackCreate(GetMethod(implObj, "GetCurrentResourceAndCommandQueue"), flags, 5)
        this.vtbl.InsertImplicitSync := CallbackCreate(GetMethod(implObj, "InsertImplicitSync"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLUID)
        CallbackFree(this.vtbl.GetSwapChainObject)
        CallbackFree(this.vtbl.GetCurrentResourceAndCommandQueue)
        CallbackFree(this.vtbl.InsertImplicitSync)
    }
}
