#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\GlobalSystemMediaTransportControlsSession.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Control
 * @version WindowsRuntime 1.4
 */
class IGlobalSystemMediaTransportControlsSessionManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGlobalSystemMediaTransportControlsSessionManager
     * @type {Guid}
     */
    static IID => Guid("{cace8eac-e86e-504a-ab31-5ff8ff1bce49}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentSession", "GetSessions", "add_CurrentSessionChanged", "remove_CurrentSessionChanged", "add_SessionsChanged", "remove_SessionsChanged"]

    /**
     * 
     * @returns {GlobalSystemMediaTransportControlsSession} 
     */
    GetCurrentSession() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GlobalSystemMediaTransportControlsSession(result_)
    }

    /**
     * 
     * @returns {IVectorView<GlobalSystemMediaTransportControlsSession>} 
     */
    GetSessions() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(GlobalSystemMediaTransportControlsSession, result_)
    }

    /**
     * 
     * @param {TypedEventHandler<GlobalSystemMediaTransportControlsSessionManager, CurrentSessionChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CurrentSessionChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CurrentSessionChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<GlobalSystemMediaTransportControlsSessionManager, SessionsChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SessionsChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SessionsChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
