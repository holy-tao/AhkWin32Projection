#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRpcChannelBuffer2.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IAsyncRpcChannelBuffer extends IRpcChannelBuffer2{
    /**
     * The interface identifier for IAsyncRpcChannelBuffer
     * @type {Guid}
     */
    static IID => Guid("{a5029fb6-3c34-11d1-9c99-00c04fb998aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {Pointer<ISynchronize>} pSync 
     * @param {Pointer<UInt32>} pulStatus 
     * @returns {HRESULT} 
     */
    Send(pMsg, pSync, pulStatus) {
        result := ComCall(9, this, "ptr", pMsg, "ptr", pSync, "uint*", pulStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {Pointer<UInt32>} pulStatus 
     * @returns {HRESULT} 
     */
    Receive(pMsg, pulStatus) {
        result := ComCall(10, this, "ptr", pMsg, "uint*", pulStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {Pointer<UInt32>} pdwDestContext 
     * @param {Pointer<Void>} ppvDestContext 
     * @returns {HRESULT} 
     */
    GetDestCtxEx(pMsg, pdwDestContext, ppvDestContext) {
        result := ComCall(11, this, "ptr", pMsg, "uint*", pdwDestContext, "ptr", ppvDestContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
