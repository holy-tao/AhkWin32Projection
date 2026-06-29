#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }
#Import ".\RPCOLEMESSAGE.ahk" { RPCOLEMESSAGE }

/**
 * The IRpcChannelBuffer (objidlbase.h) interface marshals data between a COM client proxy and a COM server stub.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-irpcchannelbuffer
 * @namespace Windows.Win32.System.Com
 */
export default struct IRpcChannelBuffer extends IUnknown {
    /**
     * The interface identifier for IRpcChannelBuffer
     * @type {Guid}
     */
    static IID := Guid("{d5f56b60-593b-101a-b569-08002b2dbf7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRpcChannelBuffer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetBuffer   : IntPtr
        SendReceive : IntPtr
        FreeBuffer  : IntPtr
        GetDestCtx  : IntPtr
        IsConnected : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRpcChannelBuffer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IRpcChannelBuffer::GetBuffer (objidlbase.h) method retrieves a buffer into which data can be marshaled for transmission.
     * @param {Pointer<RPCOLEMESSAGE>} pMessage A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-rpcolemessage">RPCOLEMESSAGE</a> data structure.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface to be marshaled.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcchannelbuffer-getbuffer
     */
    GetBuffer(pMessage, riid) {
        result := ComCall(3, this, RPCOLEMESSAGE.Ptr, pMessage, Guid.Ptr, riid, "HRESULT")
        return result
    }

    /**
     * The IRpcChannelBuffer::SendReceive (objidlbase.h) method sends a method invocation across an RPC channel to the server stub.
     * @remarks
     * Before invoking this method, the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irpcchannelbuffer-getbuffer">GetBuffer</a> method must have been invoked to allocate a channel buffer. Upon return, the <b>dataRepresentation</b> buffer of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-rpcolemessage">RPCOLEMESSAGE</a> structure will have been modified to include the data returned by the method invoked on the server. If the invocation was successful, the RPC channel buffer has been freed; otherwise the caller must free it explicitly by calling <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-irpcchannelbuffer-freebuffer">FreeBuffer</a>.
     * @param {Pointer<RPCOLEMESSAGE>} pMessage A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-rpcolemessage">RPCOLEMESSAGE</a> structure that has been populated with marshaled data.
     * @returns {Integer} If not <b>NULL</b>, set to 0 on successful execution.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcchannelbuffer-sendreceive
     */
    SendReceive(pMessage) {
        result := ComCall(4, this, RPCOLEMESSAGE.Ptr, pMessage, "uint*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * The IRpcChannelBuffer::FreeBuffer (objidlbase.h) method frees a previously allocated RPC channel buffer.
     * @param {Pointer<RPCOLEMESSAGE>} pMessage A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-rpcolemessage">RPCOLEMESSAGE</a> data structure.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcchannelbuffer-freebuffer
     */
    FreeBuffer(pMessage) {
        result := ComCall(5, this, RPCOLEMESSAGE.Ptr, pMessage, "HRESULT")
        return result
    }

    /**
     * The IRpcChannelBuffer::GetDestCtx (objidlbase.h) method retrieves the destination context for the RPC channel.
     * @param {Pointer<Integer>} pdwDestContext The destination context in which the interface is unmarshaled. Possible values come from the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-mshctx">MSHCTX</a> enumeration.
     * @param {Pointer<Pointer<Void>>} ppvDestContext This parameter is reserved and must be <b>NULL</b>.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcchannelbuffer-getdestctx
     */
    GetDestCtx(pdwDestContext, ppvDestContext) {
        pdwDestContextMarshal := pdwDestContext is VarRef ? "uint*" : "ptr"
        ppvDestContextMarshal := ppvDestContext is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, pdwDestContextMarshal, pdwDestContext, ppvDestContextMarshal, ppvDestContext, "HRESULT")
        return result
    }

    /**
     * The IRpcChannelBuffer::IsConnected (objidlbase.h) method determines whether the RPC channel is connected.
     * @returns {HRESULT} If the RPC  channel exists, the return value is <b>TRUE</b>. Otherwise, it is <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcchannelbuffer-isconnected
     */
    IsConnected() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRpcChannelBuffer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetBuffer := CallbackCreate(GetMethod(implObj, "GetBuffer"), flags, 3)
        this.vtbl.SendReceive := CallbackCreate(GetMethod(implObj, "SendReceive"), flags, 3)
        this.vtbl.FreeBuffer := CallbackCreate(GetMethod(implObj, "FreeBuffer"), flags, 2)
        this.vtbl.GetDestCtx := CallbackCreate(GetMethod(implObj, "GetDestCtx"), flags, 3)
        this.vtbl.IsConnected := CallbackCreate(GetMethod(implObj, "IsConnected"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetBuffer)
        CallbackFree(this.vtbl.SendReceive)
        CallbackFree(this.vtbl.FreeBuffer)
        CallbackFree(this.vtbl.GetDestCtx)
        CallbackFree(this.vtbl.IsConnected)
    }
}
