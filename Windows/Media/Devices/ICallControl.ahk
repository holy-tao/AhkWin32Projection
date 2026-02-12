#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class ICallControl extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICallControl
     * @type {Guid}
     */
    static IID => Guid("{a520d0d6-ae8d-45db-8011-ca49d3b3e578}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IndicateNewIncomingCall", "IndicateNewOutgoingCall", "IndicateActiveCall", "EndCall", "get_HasRinger", "add_AnswerRequested", "remove_AnswerRequested", "add_HangUpRequested", "remove_HangUpRequested", "add_DialRequested", "remove_DialRequested", "add_RedialRequested", "remove_RedialRequested", "add_KeypadPressed", "remove_KeypadPressed", "add_AudioTransferRequested", "remove_AudioTransferRequested"]

    /**
     * @type {Boolean} 
     */
    HasRinger {
        get => this.get_HasRinger()
    }

    /**
     * 
     * @param {Boolean} enableRinger 
     * @param {HSTRING} callerId 
     * @returns {Integer} 
     */
    IndicateNewIncomingCall(enableRinger, callerId) {
        if(callerId is String) {
            pin := HSTRING.Create(callerId)
            callerId := pin.Value
        }
        callerId := callerId is Win32Handle ? NumGet(callerId, "ptr") : callerId

        result := ComCall(6, this, "int", enableRinger, "ptr", callerId, "uint*", &callToken := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return callToken
    }

    /**
     * 
     * @returns {Integer} 
     */
    IndicateNewOutgoingCall() {
        result := ComCall(7, this, "uint*", &callToken := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return callToken
    }

    /**
     * 
     * @param {Integer} callToken 
     * @returns {HRESULT} 
     */
    IndicateActiveCall(callToken) {
        result := ComCall(8, this, "uint", callToken, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} callToken 
     * @returns {HRESULT} 
     */
    EndCall(callToken) {
        result := ComCall(9, this, "uint", callToken, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasRinger() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {CallControlEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AnswerRequested(handler) {
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
    remove_AnswerRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {CallControlEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_HangUpRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(13, this, "ptr", handler, "ptr", token, "int")
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
    remove_HangUpRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(14, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {DialRequestedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DialRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(15, this, "ptr", handler, "ptr", token, "int")
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
    remove_DialRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(16, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RedialRequestedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RedialRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(17, this, "ptr", handler, "ptr", token, "int")
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
    remove_RedialRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(18, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {KeypadPressedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_KeypadPressed(handler) {
        token := EventRegistrationToken()
        result := ComCall(19, this, "ptr", handler, "ptr", token, "int")
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
    remove_KeypadPressed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(20, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {CallControlEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AudioTransferRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(21, this, "ptr", handler, "ptr", token, "int")
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
    remove_AudioTransferRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(22, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
