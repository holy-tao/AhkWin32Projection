#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IRichEditBox3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRichEditBox3
     * @type {Guid}
     */
    static IID => Guid("{6b17a462-fbb6-4fff-9991-9399cb9c0b90}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_TextCompositionStarted", "remove_TextCompositionStarted", "add_TextCompositionChanged", "remove_TextCompositionChanged", "add_TextCompositionEnded", "remove_TextCompositionEnded", "get_TextReadingOrder", "put_TextReadingOrder", "get_DesiredCandidateWindowAlignment", "put_DesiredCandidateWindowAlignment", "add_CandidateWindowBoundsChanged", "remove_CandidateWindowBoundsChanged", "add_TextChanging", "remove_TextChanging"]

    /**
     * @type {Integer} 
     */
    TextReadingOrder {
        get => this.get_TextReadingOrder()
        set => this.put_TextReadingOrder(value)
    }

    /**
     * @type {Integer} 
     */
    DesiredCandidateWindowAlignment {
        get => this.get_DesiredCandidateWindowAlignment()
        set => this.put_DesiredCandidateWindowAlignment(value)
    }

    /**
     * 
     * @param {TypedEventHandler<RichEditBox, TextCompositionStartedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextCompositionStarted(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
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
    remove_TextCompositionStarted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<RichEditBox, TextCompositionChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextCompositionChanged(handler) {
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
    remove_TextCompositionChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<RichEditBox, TextCompositionEndedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextCompositionEnded(handler) {
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
    remove_TextCompositionEnded(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextReadingOrder() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_TextReadingOrder(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredCandidateWindowAlignment() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_DesiredCandidateWindowAlignment(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<RichEditBox, CandidateWindowBoundsChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CandidateWindowBoundsChanged(handler) {
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
    remove_CandidateWindowBoundsChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(17, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<RichEditBox, RichEditBoxTextChangingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextChanging(handler) {
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
    remove_TextChanging(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(19, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
