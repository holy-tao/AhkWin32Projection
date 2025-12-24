#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Controls the RPC stub used to marshal data between COM components.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-irpcstubbuffer
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
     * Initializes a server stub, binding it to the specified interface.
     * @param {IUnknown} pUnkServer A pointer to the interface.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irpcstubbuffer-connect
     */
    Connect(pUnkServer) {
        result := ComCall(3, this, "ptr", pUnkServer, "HRESULT")
        return result
    }

    /**
     * Disconnects a server stub from any interface to which it is connected.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irpcstubbuffer-disconnect
     */
    Disconnect() {
        ComCall(4, this)
    }

    /**
     * Invokes the interface that a stub represents.
     * @param {Pointer<RPCOLEMESSAGE>} _prpcmsg A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-rpcolemessage">RPCOLEMESSAGE</a> data structure containing the marshaled invocation arguments.
     * @param {IRpcChannelBuffer} _pRpcChannelBuffer A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-irpcchannelbuffer">IRpcChannelBuffer</a> interface that controls an RPC marshaling channel.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irpcstubbuffer-invoke
     */
    Invoke(_prpcmsg, _pRpcChannelBuffer) {
        result := ComCall(5, this, "ptr", _prpcmsg, "ptr", _pRpcChannelBuffer, "HRESULT")
        return result
    }

    /**
     * Determines whether a stub is designed to handle the unmarshaling of a particular interface.
     * @param {Pointer<Guid>} riid The IID of the interface. This parameter cannot be IID_IUnknown.
     * @returns {IRpcStubBuffer} If the stub can handle the indicated interface, then this method returns an <a href="/windows/desktop/api/objidl/nn-objidl-irpcstubbuffer">IRpcStubBuffer</a> pointer  for that interface; otherwise, it returns <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irpcstubbuffer-isiidsupported
     */
    IsIIDSupported(riid) {
        result := ComCall(6, this, "ptr", riid, "ptr")
        return result
    }

    /**
     * Retrieves the total number of references that a stub has on the server object to which it is connected.
     * @returns {Integer} This method returns the total number of references that a stub has on the server object to which it is connected.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irpcstubbuffer-countrefs
     */
    CountRefs() {
        result := ComCall(7, this, "uint")
        return result
    }

    /**
     * Retrieves a pointer to the interface that a stub represents.
     * @returns {Pointer<Void>} A pointer to the interface that the stub represents.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irpcstubbuffer-debugserverqueryinterface
     */
    DebugServerQueryInterface() {
        result := ComCall(8, this, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Releases an interface pointer that was previously returned by DebugServerQueryInterface.
     * @param {Pointer<Void>} pv A pointer to the interface that the caller no longer needs.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irpcstubbuffer-debugserverrelease
     */
    DebugServerRelease(pv) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        ComCall(9, this, pvMarshal, pv)
    }
}
