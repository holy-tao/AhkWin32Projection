#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * The IRpcChannelBuffer (objidlbase.h) interface marshals data between a COM client proxy and a COM server stub.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-irpcchannelbuffer
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
     * The IRpcChannelBuffer::GetBuffer (objidlbase.h) method retrieves a buffer into which data can be marshaled for transmission.
     * @param {Pointer<RPCOLEMESSAGE>} pMessage A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-rpcolemessage">RPCOLEMESSAGE</a> data structure.
     * @param {Pointer<Guid>} riid A reference to the identifier of the interface to be marshaled.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcchannelbuffer-getbuffer
     */
    GetBuffer(pMessage, riid) {
        result := ComCall(3, this, "ptr", pMessage, "ptr", riid, "HRESULT")
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
        result := ComCall(4, this, "ptr", pMessage, "uint*", &pStatus := 0, "HRESULT")
        return pStatus
    }

    /**
     * The IRpcChannelBuffer::FreeBuffer (objidlbase.h) method frees a previously allocated RPC channel buffer.
     * @param {Pointer<RPCOLEMESSAGE>} pMessage A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-rpcolemessage">RPCOLEMESSAGE</a> data structure.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcchannelbuffer-freebuffer
     */
    FreeBuffer(pMessage) {
        result := ComCall(5, this, "ptr", pMessage, "HRESULT")
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
}
