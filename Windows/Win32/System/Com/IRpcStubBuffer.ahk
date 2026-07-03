#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRpcChannelBuffer.ahk" { IRpcChannelBuffer }
#Import ".\IUnknown.ahk" { IUnknown }
#Import ".\RPCOLEMESSAGE.ahk" { RPCOLEMESSAGE }

/**
 * The IRpcStubBuffer (objidlbase.h) interface controls the RPC stub used to marshal data between COM components.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-irpcstubbuffer
 * @namespace Windows.Win32.System.Com
 */
export default struct IRpcStubBuffer extends IUnknown {
    /**
     * The interface identifier for IRpcStubBuffer
     * @type {Guid}
     */
    static IID := Guid("{d5f56afc-593b-101a-b569-08002b2dbf7a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRpcStubBuffer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Connect                   : IntPtr
        Disconnect                : IntPtr
        Invoke                    : IntPtr
        IsIIDSupported            : IntPtr
        CountRefs                 : IntPtr
        DebugServerQueryInterface : IntPtr
        DebugServerRelease        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRpcStubBuffer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IRpcStubBuffer::Connect (objidlbase.h) method initializes a server stub, binding it to the specified interface.
     * @param {IUnknown} pUnkServer A pointer to the interface.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcstubbuffer-connect
     */
    Connect(pUnkServer) {
        result := ComCall(3, this, "ptr", pUnkServer, "HRESULT")
        return result
    }

    /**
     * The IRpcStubBuffer::Disconnect (objidlbase.h) method disconnects a server stub from any interface to which it is connected.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcstubbuffer-disconnect
     */
    Disconnect() {
        ComCall(4, this)
    }

    /**
     * The IRpcStubBuffer::Invoke (objidlbase.h) method invokes the interface that a stub represents.
     * @param {Pointer<RPCOLEMESSAGE>} _prpcmsg A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-rpcolemessage">RPCOLEMESSAGE</a> data structure containing the marshaled invocation arguments.
     * @param {IRpcChannelBuffer} _pRpcChannelBuffer A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irpcchannelbuffer">IRpcChannelBuffer</a> interface that controls an RPC marshaling channel.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcstubbuffer-invoke
     */
    Invoke(_prpcmsg, _pRpcChannelBuffer) {
        result := ComCall(5, this, RPCOLEMESSAGE.Ptr, _prpcmsg, "ptr", _pRpcChannelBuffer, "HRESULT")
        return result
    }

    /**
     * The IRpcStubBuffer::IsIIDSupported (objidlbase.h) method determines whether a stub is designed to handle the unmarshaling of a particular interface.
     * @remarks
     * When presented with the need to remote a new IID on a given object, the RPC run time typically calls this method on all the presently-connected interface stubs in an attempt to locate one that can handle the marshaling for the request before it goes to the trouble of creating a new stub.
     * 
     * As in <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipsfactorybuffer-createstub">IPSFactoryBuffer::CreateStub</a>, if a stub is presently connected to a server object, then not only must this method verify that the stub can handle the indicated interface, but it must also verify (using <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a>) that the connected server object in fact supports the indicated interface. Depending on the IID and previous interface servicing requests, it may have already done so.
     * @param {Pointer<Guid>} riid The IID of the interface. This parameter cannot be IID_IUnknown.
     * @returns {IRpcStubBuffer} If the stub can handle the indicated interface, then this method returns an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irpcstubbuffer">IRpcStubBuffer</a> pointer  for that interface; otherwise, it returns <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcstubbuffer-isiidsupported
     */
    IsIIDSupported(riid) {
        result := ComCall(6, this, Guid.Ptr, riid, IRpcStubBuffer)
        return result
    }

    /**
     * The IRpcStubBuffer::CountRefs (objidlbase.h) method retrieves the total number of references that a stub has on the server object to which it is connected.
     * @returns {Integer} This method returns the total number of references that a stub has on the server object to which it is connected.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcstubbuffer-countrefs
     */
    CountRefs() {
        result := ComCall(7, this, UInt32)
        return result
    }

    /**
     * The IRpcStubBuffer::DebugServerQueryInterface (objidlbase.h) method retrieves a pointer to the interface that a stub represents.
     * @returns {Pointer<Void>} A pointer to the interface that the stub represents.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcstubbuffer-debugserverqueryinterface
     */
    DebugServerQueryInterface() {
        result := ComCall(8, this, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * The IRpcStubBuffer::DebugServerRelease (objidlbase.h) method releases an interface pointer that was previously returned by DebugServerQueryInterface.
     * @param {Pointer<Void>} pv A pointer to the interface that the caller no longer needs.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcstubbuffer-debugserverrelease
     */
    DebugServerRelease(pv) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        ComCall(9, this, pvMarshal, pv)
    }

    Query(iid) {
        if (IRpcStubBuffer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Connect := CallbackCreate(GetMethod(implObj, "Connect"), flags, 2)
        this.vtbl.Disconnect := CallbackCreate(GetMethod(implObj, "Disconnect"), flags, 1)
        this.vtbl.Invoke := CallbackCreate(GetMethod(implObj, "Invoke"), flags, 3)
        this.vtbl.IsIIDSupported := CallbackCreate(GetMethod(implObj, "IsIIDSupported"), flags, 2)
        this.vtbl.CountRefs := CallbackCreate(GetMethod(implObj, "CountRefs"), flags, 1)
        this.vtbl.DebugServerQueryInterface := CallbackCreate(GetMethod(implObj, "DebugServerQueryInterface"), flags, 2)
        this.vtbl.DebugServerRelease := CallbackCreate(GetMethod(implObj, "DebugServerRelease"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Connect)
        CallbackFree(this.vtbl.Disconnect)
        CallbackFree(this.vtbl.Invoke)
        CallbackFree(this.vtbl.IsIIDSupported)
        CallbackFree(this.vtbl.CountRefs)
        CallbackFree(this.vtbl.DebugServerQueryInterface)
        CallbackFree(this.vtbl.DebugServerRelease)
    }
}
