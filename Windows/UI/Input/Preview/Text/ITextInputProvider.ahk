#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\TextInputServiceSubscription.ahk
#Include .\TextBoxId.ahk
#Include .\TextBoxInfo.ahk
#Include ..\..\..\..\Foundation\IReference.ahk
#Include ..\..\..\..\Foundation\IPropertyValue.ahk
#Include .\TextEditSession.ahk
#Include ..\..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class ITextInputProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextInputProvider
     * @type {Guid}
     */
    static IID => Guid("{b0885fb7-e9f8-5849-b0ef-f8155ecf60d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSubscription", "SetSubscription", "get_HasFocusedTextBox", "get_FocusedTextBoxId", "get_FocusedTextBoxInfo", "get_FocusedTextBoxBounds", "get_SelectionBounds", "CreateEditSession", "TryStartDelegation", "StopDelegation", "add_FocusEntered", "remove_FocusEntered", "add_FocusRemoved", "remove_FocusRemoved", "add_TextBoxInfoChanged", "remove_TextBoxInfoChanged", "add_TextBoxContentChanged", "remove_TextBoxContentChanged", "add_CompositionTerminated", "remove_CompositionTerminated", "add_ReconversionRequested", "remove_ReconversionRequested", "add_InputDelegationModeChanged", "remove_InputDelegationModeChanged"]

    /**
     * @type {Boolean} 
     */
    HasFocusedTextBox {
        get => this.get_HasFocusedTextBox()
    }

    /**
     * @type {TextBoxId} 
     */
    FocusedTextBoxId {
        get => this.get_FocusedTextBoxId()
    }

    /**
     * @type {TextBoxInfo} 
     */
    FocusedTextBoxInfo {
        get => this.get_FocusedTextBoxInfo()
    }

    /**
     * @type {IReference<RECT>} 
     */
    FocusedTextBoxBounds {
        get => this.get_FocusedTextBoxBounds()
    }

    /**
     * @type {IReference<RECT>} 
     */
    SelectionBounds {
        get => this.get_SelectionBounds()
    }

    /**
     * 
     * @returns {TextInputServiceSubscription} 
     */
    GetSubscription() {
        result_ := TextInputServiceSubscription()
        result := ComCall(6, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {TextInputServiceSubscription} subscription 
     * @returns {HRESULT} 
     */
    SetSubscription(subscription) {
        result := ComCall(7, this, "ptr", subscription, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasFocusedTextBox() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TextBoxId} 
     */
    get_FocusedTextBoxId() {
        value := TextBoxId()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TextBoxInfo} 
     */
    get_FocusedTextBoxInfo() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TextBoxInfo(value)
    }

    /**
     * 
     * @returns {IReference<RECT>} 
     */
    get_FocusedTextBoxBounds() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetRECT(), value)
    }

    /**
     * 
     * @returns {IReference<RECT>} 
     */
    get_SelectionBounds() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetRECT(), value)
    }

    /**
     * 
     * @returns {TextEditSession} 
     */
    CreateEditSession() {
        result := ComCall(13, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TextEditSession(result_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    TryStartDelegation() {
        result := ComCall(14, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopDelegation() {
        result := ComCall(15, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<TextInputProvider, FocusEnteredEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FocusEntered(handler) {
        token := EventRegistrationToken()
        result := ComCall(16, this, "ptr", handler, "ptr", token, "int")
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
    remove_FocusEntered(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(17, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<TextInputProvider, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FocusRemoved(handler) {
        token := EventRegistrationToken()
        result := ComCall(18, this, "ptr", handler, "ptr", token, "int")
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
    remove_FocusRemoved(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(19, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<TextInputProvider, TextBoxInfoChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextBoxInfoChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(20, this, "ptr", handler, "ptr", token, "int")
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
    remove_TextBoxInfoChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(21, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<TextInputProvider, TextBoxContentChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextBoxContentChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(22, this, "ptr", handler, "ptr", token, "int")
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
    remove_TextBoxContentChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(23, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<TextInputProvider, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CompositionTerminated(handler) {
        token := EventRegistrationToken()
        result := ComCall(24, this, "ptr", handler, "ptr", token, "int")
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
    remove_CompositionTerminated(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(25, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<TextInputProvider, ReconversionRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReconversionRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(26, this, "ptr", handler, "ptr", token, "int")
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
    remove_ReconversionRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(27, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<TextInputProvider, InputDelegationModeChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_InputDelegationModeChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(28, this, "ptr", handler, "ptr", token, "int")
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
    remove_InputDelegationModeChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(29, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
