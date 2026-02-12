#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FocusSession.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class IFocusSessionManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFocusSessionManager
     * @type {Guid}
     */
    static IID => Guid("{e7ffbaa9-d8be-5dbf-bac6-49364842e37e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsFocusActive", "GetSession", "TryStartFocusSession", "TryStartFocusSession2", "DeactivateFocus", "add_IsFocusActiveChanged", "remove_IsFocusActiveChanged"]

    /**
     * @type {Boolean} 
     */
    IsFocusActive {
        get => this.get_IsFocusActive()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFocusActive() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Reserved for future use. Do not use this function. (GetSessionCompartmentId)
     * @param {HSTRING} id 
     * @returns {FocusSession} 
     * @see https://learn.microsoft.com/windows/win32/api//content/netioapi/nf-netioapi-getsessioncompartmentid
     */
    GetSession(id) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(7, this, "ptr", id, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FocusSession(result_)
    }

    /**
     * 
     * @returns {FocusSession} 
     */
    TryStartFocusSession() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FocusSession(result_)
    }

    /**
     * 
     * @param {DateTime} endTime 
     * @returns {FocusSession} 
     */
    TryStartFocusSession2(endTime) {
        result := ComCall(9, this, "ptr", endTime, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FocusSession(result_)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DeactivateFocus() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<FocusSessionManager, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsFocusActiveChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", token, "int")
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
    remove_IsFocusActiveChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
