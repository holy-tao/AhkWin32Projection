#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRpcChannelBuffer2.ahk" { IRpcChannelBuffer2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISynchronize.ahk" { ISynchronize }
#Import ".\RPCOLEMESSAGE.ahk" { RPCOLEMESSAGE }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct IAsyncRpcChannelBuffer extends IRpcChannelBuffer2 {
    /**
     * The interface identifier for IAsyncRpcChannelBuffer
     * @type {Guid}
     */
    static IID := Guid("{a5029fb6-3c34-11d1-9c99-00c04fb998aa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAsyncRpcChannelBuffer interfaces
    */
    struct Vtbl extends IRpcChannelBuffer2.Vtbl {
        Send         : IntPtr
        Receive      : IntPtr
        GetDestCtxEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAsyncRpcChannelBuffer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {ISynchronize} pSync 
     * @returns {Integer} 
     */
    Send(pMsg, pSync) {
        result := ComCall(9, this, RPCOLEMESSAGE.Ptr, pMsg, "ptr", pSync, "uint*", &pulStatus := 0, "HRESULT")
        return pulStatus
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @returns {Integer} 
     */
    Receive(pMsg) {
        result := ComCall(10, this, RPCOLEMESSAGE.Ptr, pMsg, "uint*", &pulStatus := 0, "HRESULT")
        return pulStatus
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

        result := ComCall(11, this, RPCOLEMESSAGE.Ptr, pMsg, pdwDestContextMarshal, pdwDestContext, ppvDestContextMarshal, ppvDestContext, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAsyncRpcChannelBuffer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Send := CallbackCreate(GetMethod(implObj, "Send"), flags, 4)
        this.vtbl.Receive := CallbackCreate(GetMethod(implObj, "Receive"), flags, 3)
        this.vtbl.GetDestCtxEx := CallbackCreate(GetMethod(implObj, "GetDestCtxEx"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Send)
        CallbackFree(this.vtbl.Receive)
        CallbackFree(this.vtbl.GetDestCtxEx)
    }
}
