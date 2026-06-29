#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRpcStubBuffer.ahk" { IRpcStubBuffer }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRpcProxyBuffer.ahk" { IRpcProxyBuffer }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * The IPSFactoryBuffer (objidlbase.h) interface provides custom methods for the creation of COM object proxies and stubs. This interface is not marshalable.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-ipsfactorybuffer
 * @namespace Windows.Win32.System.Com
 */
export default struct IPSFactoryBuffer extends IUnknown {
    /**
     * The interface identifier for IPSFactoryBuffer
     * @type {Guid}
     */
    static IID := Guid("{d5f569d0-593b-101a-b569-08002b2dbf7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPSFactoryBuffer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateProxy : IntPtr
        CreateStub  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPSFactoryBuffer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IPSFactoryBuffer::CreateProxy (objidlbase.h) method creates a proxy for the specified remote interface.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irpcproxybuffer">IRpcProxyBuffer</a> interface must not delegate to the outer controlling <b>IUnknown</b>.
     * @param {IUnknown} pUnkOuter A controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface; used for aggregation.
     * @param {Pointer<Guid>} riid The identifier of the interface to proxy.
     * @param {Pointer<IRpcProxyBuffer>} ppProxy A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irpcproxybuffer">IRpcProxyBuffer</a> interface to control marshaling.
     * @param {Pointer<Pointer<Void>>} ppv A pointer to the interface specified by <i>riid</i>.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-ipsfactorybuffer-createproxy
     */
    CreateProxy(pUnkOuter, riid, ppProxy, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pUnkOuter, Guid.Ptr, riid, IRpcProxyBuffer.Ptr, ppProxy, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * The IPSFactoryBuffer::CreateStub (objidlbase.h) method creates a stub for the remote use of the specified interface.
     * @param {Pointer<Guid>} riid The identifier of the interface for which a stub is to be created.
     * @param {IUnknown} pUnkServer A controlling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface; used for aggregation.
     * @returns {IRpcStubBuffer} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irpcstubbuffer">IRpcStubBuffer</a> interface pointer to control marshaling.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-ipsfactorybuffer-createstub
     */
    CreateStub(riid, pUnkServer) {
        result := ComCall(4, this, Guid.Ptr, riid, "ptr", pUnkServer, "ptr*", &ppStub := 0, "HRESULT")
        return IRpcStubBuffer(ppStub)
    }

    Query(iid) {
        if (IPSFactoryBuffer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateProxy := CallbackCreate(GetMethod(implObj, "CreateProxy"), flags, 5)
        this.vtbl.CreateStub := CallbackCreate(GetMethod(implObj, "CreateStub"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateProxy)
        CallbackFree(this.vtbl.CreateStub)
    }
}
