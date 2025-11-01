#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDebugCallbackNotificationHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugCallbackNotificationHandler
     * @type {Guid}
     */
    static IID => Guid("{30510842-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestedCallbackTypes", "BeforeDispatchEvent", "DispatchEventComplete", "BeforeInvokeDomCallback", "InvokeDomCallbackComplete", "BeforeInvokeCallback", "InvokeCallbackComplete"]

    /**
     * 
     * @param {Pointer<Integer>} pCallbackMask 
     * @returns {HRESULT} 
     */
    RequestedCallbackTypes(pCallbackMask) {
        pCallbackMaskMarshal := pCallbackMask is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pCallbackMaskMarshal, pCallbackMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pEvent 
     * @returns {HRESULT} 
     */
    BeforeDispatchEvent(pEvent) {
        result := ComCall(4, this, "ptr", pEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pEvent 
     * @param {Integer} propagationStatus 
     * @returns {HRESULT} 
     */
    DispatchEventComplete(pEvent, propagationStatus) {
        result := ComCall(5, this, "ptr", pEvent, "uint", propagationStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pEvent 
     * @param {IScriptEventHandler} pCallback 
     * @param {Integer} eStage 
     * @param {Integer} propagationStatus 
     * @returns {HRESULT} 
     */
    BeforeInvokeDomCallback(pEvent, pCallback, eStage, propagationStatus) {
        result := ComCall(6, this, "ptr", pEvent, "ptr", pCallback, "int", eStage, "uint", propagationStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pEvent 
     * @param {IScriptEventHandler} pCallback 
     * @param {Integer} eStage 
     * @param {Integer} propagationStatus 
     * @returns {HRESULT} 
     */
    InvokeDomCallbackComplete(pEvent, pCallback, eStage, propagationStatus) {
        result := ComCall(7, this, "ptr", pEvent, "ptr", pCallback, "int", eStage, "uint", propagationStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eCallbackType 
     * @param {Integer} callbackCookie 
     * @param {IDispatch} pDispHandler 
     * @param {Integer} ullHandlerCookie 
     * @param {BSTR} functionName 
     * @param {Integer} line 
     * @param {Integer} column 
     * @param {Integer} cchLength 
     * @param {IUnknown} pDebugDocumentContext 
     * @returns {HRESULT} 
     */
    BeforeInvokeCallback(eCallbackType, callbackCookie, pDispHandler, ullHandlerCookie, functionName, line, column, cchLength, pDebugDocumentContext) {
        functionName := functionName is String ? BSTR.Alloc(functionName).Value : functionName

        result := ComCall(8, this, "int", eCallbackType, "uint", callbackCookie, "ptr", pDispHandler, "uint", ullHandlerCookie, "ptr", functionName, "uint", line, "uint", column, "uint", cchLength, "ptr", pDebugDocumentContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eCallbackType 
     * @param {Integer} callbackCookie 
     * @param {IDispatch} pDispHandler 
     * @param {Integer} ullHandlerCookie 
     * @param {BSTR} functionName 
     * @param {Integer} line 
     * @param {Integer} column 
     * @param {Integer} cchLength 
     * @param {IUnknown} pDebugDocumentContext 
     * @returns {HRESULT} 
     */
    InvokeCallbackComplete(eCallbackType, callbackCookie, pDispHandler, ullHandlerCookie, functionName, line, column, cchLength, pDebugDocumentContext) {
        functionName := functionName is String ? BSTR.Alloc(functionName).Value : functionName

        result := ComCall(9, this, "int", eCallbackType, "uint", callbackCookie, "ptr", pDispHandler, "uint", ullHandlerCookie, "ptr", functionName, "uint", line, "uint", column, "uint", cchLength, "ptr", pDebugDocumentContext, "HRESULT")
        return result
    }
}
