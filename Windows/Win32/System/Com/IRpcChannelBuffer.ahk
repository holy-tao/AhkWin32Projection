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
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMessage 
     * @param {Pointer<Guid>} riid 
     * @returns {HRESULT} 
     */
    GetBuffer(pMessage, riid) {
        result := ComCall(3, this, "ptr", pMessage, "ptr", riid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMessage 
     * @param {Pointer<UInt32>} pStatus 
     * @returns {HRESULT} 
     */
    SendReceive(pMessage, pStatus) {
        result := ComCall(4, this, "ptr", pMessage, "uint*", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMessage 
     * @returns {HRESULT} 
     */
    FreeBuffer(pMessage) {
        result := ComCall(5, this, "ptr", pMessage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwDestContext 
     * @param {Pointer<Void>} ppvDestContext 
     * @returns {HRESULT} 
     */
    GetDestCtx(pdwDestContext, ppvDestContext) {
        result := ComCall(6, this, "uint*", pdwDestContext, "ptr", ppvDestContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsConnected() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
