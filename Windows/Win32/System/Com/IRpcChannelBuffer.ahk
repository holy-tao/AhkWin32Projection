#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Marshals data between a COM client proxy and a COM server stub.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-irpcchannelbuffer
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IRpcChannelBuffer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRpcChannelBuffer
     * @type {Guid}
     */
    static IID => Guid("{d5f56b60-593b-101a-b569-08002b2dbf7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBuffer", "SendReceive", "FreeBuffer", "GetDestCtx", "IsConnected"]

    /**
     * Retrieves a buffer into which data can be marshaled for transmission.
     * @param {Pointer<RPCOLEMESSAGE>} pMessage A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-rpcolemessage">RPCOLEMESSAGE</a> data structure.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface to be marshaled.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irpcchannelbuffer-getbuffer
     */
    GetBuffer(pMessage, riid) {
        result := ComCall(3, this, "ptr", pMessage, "ptr", riid, "HRESULT")
        return result
    }

    /**
     * Sends a method invocation across an RPC channel to the server stub.
     * @param {Pointer<RPCOLEMESSAGE>} pMessage A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-rpcolemessage">RPCOLEMESSAGE</a> structure that has been populated with marshaled data.
     * @returns {Integer} If not <b>NULL</b>, set to 0 on successful execution.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irpcchannelbuffer-sendreceive
     */
    SendReceive(pMessage) {
        result := ComCall(4, this, "ptr", pMessage, "uint*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * Frees a previously allocated RPC channel buffer.
     * @param {Pointer<RPCOLEMESSAGE>} pMessage A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-rpcolemessage">RPCOLEMESSAGE</a> data structure.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irpcchannelbuffer-freebuffer
     */
    FreeBuffer(pMessage) {
        result := ComCall(5, this, "ptr", pMessage, "HRESULT")
        return result
    }

    /**
     * Retrieves the destination context for the RPC channel.
     * @param {Pointer<Integer>} pdwDestContext The destination context in which the interface is unmarshaled. Possible values come from the <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/ne-wtypesbase-mshctx">MSHCTX</a> enumeration.
     * @param {Pointer<Pointer<Void>>} ppvDestContext This parameter is reserved and must be <b>NULL</b>.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irpcchannelbuffer-getdestctx
     */
    GetDestCtx(pdwDestContext, ppvDestContext) {
        pdwDestContextMarshal := pdwDestContext is VarRef ? "uint*" : "ptr"
        ppvDestContextMarshal := ppvDestContext is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, pdwDestContextMarshal, pdwDestContext, ppvDestContextMarshal, ppvDestContext, "HRESULT")
        return result
    }

    /**
     * Determines whether the RPC channel is connected.
     * @returns {HRESULT} If the RPC channel knows that the server object has been disconnected,
     * the return value is <b>S_FALSE</b>. Otherwise, it is <b>S_OK</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irpcchannelbuffer-isconnected
     */
    IsConnected() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
