#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class ICoreTextEditContext extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreTextEditContext
     * @type {Guid}
     */
    static IID => Guid("{bf6608af-4041-47c3-b263-a918eb5eaef2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "put_Name", "get_InputScope", "put_InputScope", "get_IsReadOnly", "put_IsReadOnly", "get_InputPaneDisplayPolicy", "put_InputPaneDisplayPolicy", "add_TextRequested", "remove_TextRequested", "add_SelectionRequested", "remove_SelectionRequested", "add_LayoutRequested", "remove_LayoutRequested", "add_TextUpdating", "remove_TextUpdating", "add_SelectionUpdating", "remove_SelectionUpdating", "add_FormatUpdating", "remove_FormatUpdating", "add_CompositionStarted", "remove_CompositionStarted", "add_CompositionCompleted", "remove_CompositionCompleted", "add_FocusRemoved", "remove_FocusRemoved", "NotifyFocusEnter", "NotifyFocusLeave", "NotifyTextChanged", "NotifySelectionChanged", "NotifyLayoutChanged"]

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {Integer} 
     */
    InputScope {
        get => this.get_InputScope()
        set => this.put_InputScope(value)
    }

    /**
     * @type {Boolean} 
     */
    IsReadOnly {
        get => this.get_IsReadOnly()
        set => this.put_IsReadOnly(value)
    }

    /**
     * @type {Integer} 
     */
    InputPaneDisplayPolicy {
        get => this.get_InputPaneDisplayPolicy()
        set => this.put_InputPaneDisplayPolicy(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InputScope() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_InputScope(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReadOnly() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsReadOnly(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InputPaneDisplayPolicy() {
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
    put_InputPaneDisplayPolicy(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreTextEditContext, CoreTextTextRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextRequested(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(14, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_TextRequested(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(15, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreTextEditContext, CoreTextSelectionRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SelectionRequested(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(16, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_SelectionRequested(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(17, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreTextEditContext, CoreTextLayoutRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LayoutRequested(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(18, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_LayoutRequested(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(19, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreTextEditContext, CoreTextTextUpdatingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextUpdating(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(20, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_TextUpdating(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(21, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreTextEditContext, CoreTextSelectionUpdatingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SelectionUpdating(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(22, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_SelectionUpdating(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(23, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreTextEditContext, CoreTextFormatUpdatingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FormatUpdating(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(24, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_FormatUpdating(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(25, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreTextEditContext, CoreTextCompositionStartedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CompositionStarted(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(26, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_CompositionStarted(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(27, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreTextEditContext, CoreTextCompositionCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CompositionCompleted(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(28, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_CompositionCompleted(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(29, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreTextEditContext, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FocusRemoved(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(30, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_FocusRemoved(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(31, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NotifyFocusEnter() {
        result := ComCall(32, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NotifyFocusLeave() {
        result := ComCall(33, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {CoreTextRange} modifiedRange 
     * @param {Integer} newLength 
     * @param {CoreTextRange} newSelection 
     * @returns {HRESULT} 
     */
    NotifyTextChanged(modifiedRange, newLength, newSelection) {
        result := ComCall(34, this, "ptr", modifiedRange, "int", newLength, "ptr", newSelection, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {CoreTextRange} selection 
     * @returns {HRESULT} 
     */
    NotifySelectionChanged(selection) {
        result := ComCall(35, this, "ptr", selection, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NotifyLayoutChanged() {
        result := ComCall(36, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
