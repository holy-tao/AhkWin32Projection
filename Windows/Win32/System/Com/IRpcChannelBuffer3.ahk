#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRpcChannelBuffer2.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IRpcChannelBuffer3 extends IRpcChannelBuffer2{
    /**
     * The interface identifier for IRpcChannelBuffer3
     * @type {Guid}
     */
    static IID => Guid("{25b15600-0115-11d0-bf0d-00aa00b8dfd2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {Pointer<UInt32>} pulStatus 
     * @returns {HRESULT} 
     */
    Send(pMsg, pulStatus) {
        result := ComCall(9, this, "ptr", pMsg, "uint*", pulStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {Integer} ulSize 
     * @param {Pointer<UInt32>} pulStatus 
     * @returns {HRESULT} 
     */
    Receive(pMsg, ulSize, pulStatus) {
        result := ComCall(10, this, "ptr", pMsg, "uint", ulSize, "uint*", pulStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @returns {HRESULT} 
     */
    Cancel(pMsg) {
        result := ComCall(11, this, "ptr", pMsg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} pInterface 
     * @returns {HRESULT} 
     */
    GetCallContext(pMsg, riid, pInterface) {
        result := ComCall(12, this, "ptr", pMsg, "ptr", riid, "ptr", pInterface, "int")
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
        result := ComCall(13, this, "ptr", pMsg, "uint*", pdwDestContext, "ptr", ppvDestContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {Pointer<UInt32>} pState 
     * @returns {HRESULT} 
     */
    GetState(pMsg, pState) {
        result := ComCall(14, this, "ptr", pMsg, "uint*", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {Pointer<IAsyncManager>} pAsyncMgr 
     * @returns {HRESULT} 
     */
    RegisterAsync(pMsg, pAsyncMgr) {
        result := ComCall(15, this, "ptr", pMsg, "ptr", pAsyncMgr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
