#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_MESSAGE_CALLBACK_FLAGS.ahk" { D3D12_MESSAGE_CALLBACK_FLAGS }
#Import ".\ID3D12InfoQueue.ahk" { ID3D12InfoQueue }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12InfoQueue1 extends ID3D12InfoQueue {
    /**
     * The interface identifier for ID3D12InfoQueue1
     * @type {Guid}
     */
    static IID := Guid("{2852dd88-b484-4c0c-b6b1-67168500e600}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12InfoQueue1 interfaces
    */
    struct Vtbl extends ID3D12InfoQueue.Vtbl {
        RegisterMessageCallback   : IntPtr
        UnregisterMessageCallback : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12InfoQueue1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<D3D12MessageFunc>} CallbackFunc 
     * @param {D3D12_MESSAGE_CALLBACK_FLAGS} CallbackFilterFlags 
     * @param {Pointer<Void>} pContext 
     * @param {Pointer<Integer>} pCallbackCookie 
     * @returns {HRESULT} 
     */
    RegisterMessageCallback(CallbackFunc, CallbackFilterFlags, pContext, pCallbackCookie) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"
        pCallbackCookieMarshal := pCallbackCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(38, this, "ptr", CallbackFunc, D3D12_MESSAGE_CALLBACK_FLAGS, CallbackFilterFlags, pContextMarshal, pContext, pCallbackCookieMarshal, pCallbackCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} CallbackCookie 
     * @returns {HRESULT} 
     */
    UnregisterMessageCallback(CallbackCookie) {
        result := ComCall(39, this, "uint", CallbackCookie, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D12InfoQueue1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterMessageCallback := CallbackCreate(GetMethod(implObj, "RegisterMessageCallback"), flags, 5)
        this.vtbl.UnregisterMessageCallback := CallbackCreate(GetMethod(implObj, "UnregisterMessageCallback"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterMessageCallback)
        CallbackFree(this.vtbl.UnregisterMessageCallback)
    }
}
