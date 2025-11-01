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
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMessage 
     * @param {Pointer<Guid>} riid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcchannelbuffer-getbuffer
     */
    GetBuffer(pMessage, riid) {
        result := ComCall(3, this, "ptr", pMessage, "ptr", riid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMessage 
     * @param {Pointer<Integer>} pStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcchannelbuffer-sendreceive
     */
    SendReceive(pMessage, pStatus) {
        result := ComCall(4, this, "ptr", pMessage, "uint*", pStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMessage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcchannelbuffer-freebuffer
     */
    FreeBuffer(pMessage) {
        result := ComCall(5, this, "ptr", pMessage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwDestContext 
     * @param {Pointer<Pointer<Void>>} ppvDestContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcchannelbuffer-getdestctx
     */
    GetDestCtx(pdwDestContext, ppvDestContext) {
        result := ComCall(6, this, "uint*", pdwDestContext, "ptr*", ppvDestContext, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-irpcchannelbuffer-isconnected
     */
    IsConnected() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
