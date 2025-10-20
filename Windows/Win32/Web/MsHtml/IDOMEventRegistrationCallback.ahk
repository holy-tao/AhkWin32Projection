#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDOMEventRegistrationCallback extends IUnknown{
    /**
     * The interface identifier for IDOMEventRegistrationCallback
     * @type {Guid}
     */
    static IID => Guid("{3051083b-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszEventType 
     * @param {Pointer<IScriptEventHandler>} pHandler 
     * @returns {HRESULT} 
     */
    OnDOMEventListenerAdded(pszEventType, pHandler) {
        pszEventType := pszEventType is String ? StrPtr(pszEventType) : pszEventType

        result := ComCall(3, this, "ptr", pszEventType, "ptr", pHandler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ullCookie 
     * @returns {HRESULT} 
     */
    OnDOMEventListenerRemoved(ullCookie) {
        result := ComCall(4, this, "uint", ullCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
