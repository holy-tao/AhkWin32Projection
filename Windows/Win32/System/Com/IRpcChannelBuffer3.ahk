#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRpcChannelBuffer2.ahk" { IRpcChannelBuffer2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IAsyncManager.ahk" { IAsyncManager }
#Import ".\RPCOLEMESSAGE.ahk" { RPCOLEMESSAGE }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct IRpcChannelBuffer3 extends IRpcChannelBuffer2 {
    /**
     * The interface identifier for IRpcChannelBuffer3
     * @type {Guid}
     */
    static IID := Guid("{25b15600-0115-11d0-bf0d-00aa00b8dfd2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRpcChannelBuffer3 interfaces
    */
    struct Vtbl extends IRpcChannelBuffer2.Vtbl {
        Send           : IntPtr
        Receive        : IntPtr
        Cancel         : IntPtr
        GetCallContext : IntPtr
        GetDestCtxEx   : IntPtr
        GetState       : IntPtr
        RegisterAsync  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRpcChannelBuffer3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @returns {Integer} 
     */
    Send(pMsg) {
        result := ComCall(9, this, RPCOLEMESSAGE.Ptr, pMsg, "uint*", &pulStatus := 0, "HRESULT")
        return pulStatus
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {Integer} ulSize 
     * @returns {Integer} 
     */
    Receive(pMsg, ulSize) {
        result := ComCall(10, this, RPCOLEMESSAGE.Ptr, pMsg, "uint", ulSize, "uint*", &pulStatus := 0, "HRESULT")
        return pulStatus
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @returns {HRESULT} 
     */
    Cancel(pMsg) {
        result := ComCall(11, this, RPCOLEMESSAGE.Ptr, pMsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetCallContext(pMsg, riid) {
        result := ComCall(12, this, RPCOLEMESSAGE.Ptr, pMsg, Guid.Ptr, riid, "ptr*", &pInterface := 0, "HRESULT")
        return pInterface
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {Pointer<Integer>} pdwDestContext 
     * @param {Pointer<Pointer<Void>>} ppvDestContext 
     * @returns {HRESULT} 
     */
    GetDestCtxEx(pMsg, pdwDestContext, ppvDestContext) {
        pdwDestContextMarshal := pdwDestContext is VarRef ? "uint*" : "ptr"
        ppvDestContextMarshal := ppvDestContext is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, RPCOLEMESSAGE.Ptr, pMsg, pdwDestContextMarshal, pdwDestContext, ppvDestContextMarshal, ppvDestContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @returns {Integer} 
     */
    GetState(pMsg) {
        result := ComCall(14, this, RPCOLEMESSAGE.Ptr, pMsg, "uint*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {IAsyncManager} pAsyncMgr 
     * @returns {HRESULT} 
     */
    RegisterAsync(pMsg, pAsyncMgr) {
        result := ComCall(15, this, RPCOLEMESSAGE.Ptr, pMsg, "ptr", pAsyncMgr, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRpcChannelBuffer3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Send := CallbackCreate(GetMethod(implObj, "Send"), flags, 3)
        this.vtbl.Receive := CallbackCreate(GetMethod(implObj, "Receive"), flags, 4)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 2)
        this.vtbl.GetCallContext := CallbackCreate(GetMethod(implObj, "GetCallContext"), flags, 4)
        this.vtbl.GetDestCtxEx := CallbackCreate(GetMethod(implObj, "GetDestCtxEx"), flags, 4)
        this.vtbl.GetState := CallbackCreate(GetMethod(implObj, "GetState"), flags, 3)
        this.vtbl.RegisterAsync := CallbackCreate(GetMethod(implObj, "RegisterAsync"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Send)
        CallbackFree(this.vtbl.Receive)
        CallbackFree(this.vtbl.Cancel)
        CallbackFree(this.vtbl.GetCallContext)
        CallbackFree(this.vtbl.GetDestCtxEx)
        CallbackFree(this.vtbl.GetState)
        CallbackFree(this.vtbl.RegisterAsync)
    }
}
