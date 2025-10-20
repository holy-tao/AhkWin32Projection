#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IEventTarget2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEventTarget2
     * @type {Guid}
     */
    static IID => Guid("{30510839-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRegisteredEventTypes", "GetListenersForType", "RegisterForDOMEventListeners", "UnregisterForDOMEventListeners"]

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} ppEventTypeArray 
     * @returns {HRESULT} 
     */
    GetRegisteredEventTypes(ppEventTypeArray) {
        result := ComCall(3, this, "ptr*", ppEventTypeArray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszEventType 
     * @param {Pointer<Pointer<SAFEARRAY>>} ppEventHandlerArray 
     * @returns {HRESULT} 
     */
    GetListenersForType(pszEventType, ppEventHandlerArray) {
        pszEventType := pszEventType is String ? StrPtr(pszEventType) : pszEventType

        result := ComCall(4, this, "ptr", pszEventType, "ptr*", ppEventHandlerArray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDOMEventRegistrationCallback} pCallback 
     * @returns {HRESULT} 
     */
    RegisterForDOMEventListeners(pCallback) {
        result := ComCall(5, this, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDOMEventRegistrationCallback} pCallback 
     * @returns {HRESULT} 
     */
    UnregisterForDOMEventListeners(pCallback) {
        result := ComCall(6, this, "ptr", pCallback, "HRESULT")
        return result
    }
}
