#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * The IRpcStubBuffer interface (objidl.h) controls the RPC stub used to marshal data between COM components.
 * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nn-objidl-irpcstubbuffer
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IRpcStubBuffer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRpcStubBuffer
     * @type {Guid}
     */
    static IID => Guid("{d5f56afc-593b-101a-b569-08002b2dbf7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Connect", "Disconnect", "Invoke", "IsIIDSupported", "CountRefs", "DebugServerQueryInterface", "DebugServerRelease"]

    /**
     * The IRpcStubBuffer::Connect method (objidl.h) initializes a server stub, binding it to the specified interface.
     * @param {IUnknown} pUnkServer A pointer to the interface.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-irpcstubbuffer-connect
     */
    Connect(pUnkServer) {
        result := ComCall(3, this, "ptr", pUnkServer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IRpcStubBuffer::Disconnect method (objidl.h) disconnects a server stub from any interface to which it is connected.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-irpcstubbuffer-disconnect
     */
    Disconnect() {
        ComCall(4, this)
    }

    /**
     * The IRpcStubBuffer::Invoke method (objidl.h) invokes the interface that a stub represents.
     * @param {Pointer<RPCOLEMESSAGE>} _prpcmsg A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-rpcolemessage">RPCOLEMESSAGE</a> data structure containing the marshaled invocation arguments.
     * @param {IRpcChannelBuffer} _pRpcChannelBuffer A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irpcchannelbuffer">IRpcChannelBuffer</a> interface that controls an RPC marshaling channel.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-irpcstubbuffer-invoke
     */
    Invoke(_prpcmsg, _pRpcChannelBuffer) {
        result := ComCall(5, this, "ptr", _prpcmsg, "ptr", _pRpcChannelBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IRpcStubBuffer::IsIIDSupported method (objidl.h) determines whether a stub is designed to handle the unmarshaling of a particular interface.
     * @remarks
     * When presented with the need to remote a new IID on a given object, the RPC run time typically calls this method on all the presently-connected interface stubs in an attempt to locate one that can handle the marshaling for the request before it goes to the trouble of creating a new stub.
     * 
     * As in <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipsfactorybuffer-createstub">IPSFactoryBuffer::CreateStub</a>, if a stub is presently connected to a server object, then not only must this method verify that the stub can handle the indicated interface, but it must also verify (using <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a>) that the connected server object in fact supports the indicated interface. Depending on the IID and previous interface servicing requests, it may have already done so.
     * @param {Pointer<Guid>} riid The IID of the interface. This parameter cannot be IID_IUnknown.
     * @returns {IRpcStubBuffer} If the stub can handle the indicated interface, then this method returns an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irpcstubbuffer">IRpcStubBuffer</a> pointer  for that interface; otherwise, it returns <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-irpcstubbuffer-isiidsupported
     */
    IsIIDSupported(riid) {
        result := ComCall(6, this, "ptr", riid, "ptr")
        return result
    }

    /**
     * The IRpcStubBuffer::CountRefs method (objidl.h) retrieves the total number of references that a stub has on the server object to which it is connected.
     * @returns {Integer} This method returns the total number of references that a stub has on the server object to which it is connected.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-irpcstubbuffer-countrefs
     */
    CountRefs() {
        result := ComCall(7, this, "uint")
        return result
    }

    /**
     * The IRpcStubBuffer::DebugServerQueryInterface method (objidl.h) retrieves a pointer to the interface that a stub represents.
     * @returns {Pointer<Void>} A pointer to the interface that the stub represents.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-irpcstubbuffer-debugserverqueryinterface
     */
    DebugServerQueryInterface() {
        result := ComCall(8, this, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * The IRpcStubBuffer::DebugServerRelease method (objidl.h) releases an interface pointer that was previously returned by DebugServerQueryInterface.
     * @param {Pointer<Void>} pv A pointer to the interface that the caller no longer needs.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-irpcstubbuffer-debugserverrelease
     */
    DebugServerRelease(pv) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        ComCall(9, this, pvMarshal, pv)
    }
}
