#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
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
class IKeyboardInputProcessor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyboardInputProcessor
     * @type {Guid}
     */
    static IID => Guid("{2afe79b6-5818-50e0-8fa8-81bc96428c46}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InputProfile", "get_IsActive", "get_HasFocusedTextBox", "get_FocusedTextBoxId", "get_FocusedTextBoxInfo", "get_FocusedTextBoxBounds", "get_SelectionBounds", "get_ConversionMode", "put_ConversionMode", "CreateEditSession", "add_Activated", "remove_Activated", "add_Deactivated", "remove_Deactivated", "add_KeyEventReceived", "remove_KeyEventReceived", "add_FocusEntered", "remove_FocusEntered", "add_FocusRemoved", "remove_FocusRemoved", "add_ConversionModeChanged", "remove_ConversionModeChanged", "add_TextBoxInfoChanged", "remove_TextBoxInfoChanged", "add_TextBoxContentChanged", "remove_TextBoxContentChanged", "add_CompositionTerminated", "remove_CompositionTerminated", "add_ReconversionRequested", "remove_ReconversionRequested"]

    /**
     * @type {HSTRING} 
     */
    InputProfile {
        get => this.get_InputProfile()
    }

    /**
     * @type {Boolean} 
     */
    IsActive {
        get => this.get_IsActive()
    }

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
     * @type {Integer} 
     */
    ConversionMode {
        get => this.get_ConversionMode()
        set => this.put_ConversionMode(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_InputProfile() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActive() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
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
     * @returns {Integer} 
     */
    get_ConversionMode() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ConversionMode(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TextEditSession} 
     */
    CreateEditSession() {
        result := ComCall(15, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TextEditSession(result_)
    }

    /**
     * 
     * @param {TypedEventHandler<KeyboardInputProcessor, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Activated(handler) {
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
    remove_Activated(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(17, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<KeyboardInputProcessor, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Deactivated(handler) {
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
    remove_Deactivated(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(19, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<KeyboardInputProcessor, KeyEventReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_KeyEventReceived(handler) {
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
    remove_KeyEventReceived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(21, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<KeyboardInputProcessor, FocusEnteredEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FocusEntered(handler) {
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
    remove_FocusEntered(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(23, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<KeyboardInputProcessor, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FocusRemoved(handler) {
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
    remove_FocusRemoved(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(25, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<KeyboardInputProcessor, ConversionModeChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ConversionModeChanged(handler) {
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
    remove_ConversionModeChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(27, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<KeyboardInputProcessor, TextBoxInfoChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextBoxInfoChanged(handler) {
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
    remove_TextBoxInfoChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(29, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<KeyboardInputProcessor, TextBoxContentChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextBoxContentChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(30, this, "ptr", handler, "ptr", token, "int")
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

        result := ComCall(31, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<KeyboardInputProcessor, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CompositionTerminated(handler) {
        token := EventRegistrationToken()
        result := ComCall(32, this, "ptr", handler, "ptr", token, "int")
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

        result := ComCall(33, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<KeyboardInputProcessor, ReconversionRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReconversionRequested(handler) {
        token := EventRegistrationToken()
        result := ComCall(34, this, "ptr", handler, "ptr", token, "int")
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

        result := ComCall(35, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
