#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRpcChannelBuffer2.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IAsyncRpcChannelBuffer extends IRpcChannelBuffer2{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Send", "Receive", "GetDestCtxEx"]

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {ISynchronize} pSync 
     * @param {Pointer<Integer>} pulStatus 
     * @returns {HRESULT} 
     */
    Send(pMsg, pSync, pulStatus) {
        pulStatusMarshal := pulStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "ptr", pMsg, "ptr", pSync, pulStatusMarshal, pulStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {Pointer<Integer>} pulStatus 
     * @returns {HRESULT} 
     */
    Receive(pMsg, pulStatus) {
        pulStatusMarshal := pulStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "ptr", pMsg, pulStatusMarshal, pulStatus, "HRESULT")
        return result
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

        result := ComCall(11, this, "ptr", pMsg, pdwDestContextMarshal, pdwDestContext, "ptr*", ppvDestContext, "HRESULT")
        return result
    }
}
