#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IStreamWebSocket2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamWebSocket2
     * @type {Guid}
     */
    static IID => Guid("{aa4d08cb-93f5-4678-8236-57cce5417ed5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_ServerCustomValidationRequested", "remove_ServerCustomValidationRequested"]

    /**
     * 
     * @param {TypedEventHandler<StreamWebSocket, WebSocketServerCustomValidationRequestedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_ServerCustomValidationRequested(eventHandler) {
        eventCookie := EventRegistrationToken()
        result := ComCall(6, this, "ptr", eventHandler, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return eventCookie
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_ServerCustomValidationRequested(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(7, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
