#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRpcChannelBuffer.ahk" { IRpcChannelBuffer }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * The IRpcProxyBuffer (objidlbase.h) interface controls the RPC proxy used to marshal data between COM components.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-irpcproxybuffer
 * @namespace Windows.Win32.System.Com
 */
export default struct IRpcProxyBuffer extends IUnknown {
    /**
     * The interface identifier for IRpcProxyBuffer
     * @type {Guid}
     */
    static IID := Guid("{d5f56a34-593b-101a-b569-08002b2dbf7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRpcProxyBuffer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Connect    : IntPtr
        Disconnect : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRpcProxyBuffer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IRpcProxyBuffer::Connect (objidlbase.h) method initializes a client proxy, binding it to the specified RPC channel.
     * @param {IRpcChannelBuffer} pRpcChannelBuffer A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irpcchannelbuffer">IRpcChannelBuffer</a> interface that the proxy uses to marshal data.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcproxybuffer-connect
     */
    Connect(pRpcChannelBuffer) {
        result := ComCall(3, this, "ptr", pRpcChannelBuffer, "HRESULT")
        return result
    }

    /**
     * The IRpcProxyBuffer::Disconnect (objidlbase.h) method disconnects a client proxy from any RPC channel to which it is connected.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcproxybuffer-disconnect
     */
    Disconnect() {
        ComCall(4, this)
    }

    Query(iid) {
        if (IRpcProxyBuffer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Connect := CallbackCreate(GetMethod(implObj, "Connect"), flags, 2)
        this.vtbl.Disconnect := CallbackCreate(GetMethod(implObj, "Disconnect"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Connect)
        CallbackFree(this.vtbl.Disconnect)
    }
}
