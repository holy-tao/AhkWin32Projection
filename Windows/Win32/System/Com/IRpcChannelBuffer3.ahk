#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRpcChannelBuffer2.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IRpcChannelBuffer3 extends IRpcChannelBuffer2{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Send", "Receive", "Cancel", "GetCallContext", "GetDestCtxEx", "GetState", "RegisterAsync"]

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @returns {Integer} 
     */
    Send(pMsg) {
        result := ComCall(9, this, "ptr", pMsg, "uint*", &pulStatus := 0, "HRESULT")
        return pulStatus
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {Integer} ulSize 
     * @returns {Integer} 
     */
    Receive(pMsg, ulSize) {
        result := ComCall(10, this, "ptr", pMsg, "uint", ulSize, "uint*", &pulStatus := 0, "HRESULT")
        return pulStatus
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @returns {HRESULT} 
     */
    Cancel(pMsg) {
        result := ComCall(11, this, "ptr", pMsg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetCallContext(pMsg, riid) {
        result := ComCall(12, this, "ptr", pMsg, "ptr", riid, "ptr*", &pInterface := 0, "HRESULT")
        return pInterface
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {Pointer<Integer>} pdwDestContext 
     * @param {Pointer<Pointer<Void>>} ppvDestContext 
     * @returns {HRESULT} 
     */
    GetDestCtxEx(pMsg, pdwDestContext, ppvDestContext) {
        pdwDestContextMarshal := pdwDestContext is VarRef ? "uint*" : "ptr"
        ppvDestContextMarshal := ppvDestContext is VarRef ? "ptr*" : "ptr"

        result := ComCall(13, this, "ptr", pMsg, pdwDestContextMarshal, pdwDestContext, ppvDestContextMarshal, ppvDestContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @returns {Integer} 
     */
    GetState(pMsg) {
        result := ComCall(14, this, "ptr", pMsg, "uint*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {IAsyncManager} pAsyncMgr 
     * @returns {HRESULT} 
     */
    RegisterAsync(pMsg, pAsyncMgr) {
        result := ComCall(15, this, "ptr", pMsg, "ptr", pAsyncMgr, "HRESULT")
        return result
    }
}
