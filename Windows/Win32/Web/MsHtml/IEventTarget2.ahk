#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IEventTarget2 extends IUnknown{
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
     * 
     * @param {Pointer<SAFEARRAY>} ppEventTypeArray 
     * @returns {HRESULT} 
     */
    GetRegisteredEventTypes(ppEventTypeArray) {
        result := ComCall(3, this, "ptr", ppEventTypeArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszEventType 
     * @param {Pointer<SAFEARRAY>} ppEventHandlerArray 
     * @returns {HRESULT} 
     */
    GetListenersForType(pszEventType, ppEventHandlerArray) {
        pszEventType := pszEventType is String ? StrPtr(pszEventType) : pszEventType

        result := ComCall(4, this, "ptr", pszEventType, "ptr", ppEventHandlerArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDOMEventRegistrationCallback>} pCallback 
     * @returns {HRESULT} 
     */
    RegisterForDOMEventListeners(pCallback) {
        result := ComCall(5, this, "ptr", pCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDOMEventRegistrationCallback>} pCallback 
     * @returns {HRESULT} 
     */
    UnregisterForDOMEventListeners(pCallback) {
        result := ComCall(6, this, "ptr", pCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
