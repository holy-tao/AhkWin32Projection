#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes methods that allow the caller to retrieve information entered into a search box.
 * @remarks
 * The search box is shown here in a Windows Explorer window frame.
 * 
 * 
 * 
 * <img alt="Screen shot of upper-right corner of explorer frame showing search box" src="./images/searchbox.jpg"/>
 * The frame that contains the search box might also be hosted in another window or in the common file dialog box.
 * 
 * To access the search dialog, use <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/cc678966(v=vs.85)">QueryService</a> using SID_SSearchBoxInfo on a site pointer within the Windows Explorer window.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * An implementation of this interface is provided with Windows. Third parties do not need to implement their own version.
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl/nn-shobjidl-isearchboxinfo
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ISearchBox extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchBox
     * @type {Guid}
     */
    static IID => Guid("{f89ecc5a-99ba-4bd4-966c-f11fa443d13c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SearchHistoryEnabled", "put_SearchHistoryEnabled", "get_SearchHistoryContext", "put_SearchHistoryContext", "get_PlaceholderText", "put_PlaceholderText", "get_QueryText", "put_QueryText", "get_FocusOnKeyboardInput", "put_FocusOnKeyboardInput", "get_ChooseSuggestionOnEnter", "put_ChooseSuggestionOnEnter", "add_QueryChanged", "remove_QueryChanged", "add_SuggestionsRequested", "remove_SuggestionsRequested", "add_QuerySubmitted", "remove_QuerySubmitted", "add_ResultSuggestionChosen", "remove_ResultSuggestionChosen", "add_PrepareForFocusOnKeyboardInput", "remove_PrepareForFocusOnKeyboardInput", "SetLocalContentSuggestionSettings"]

    /**
     * @type {Boolean} 
     */
    SearchHistoryEnabled {
        get => this.get_SearchHistoryEnabled()
        set => this.put_SearchHistoryEnabled(value)
    }

    /**
     * @type {HSTRING} 
     */
    SearchHistoryContext {
        get => this.get_SearchHistoryContext()
        set => this.put_SearchHistoryContext(value)
    }

    /**
     * @type {HSTRING} 
     */
    PlaceholderText {
        get => this.get_PlaceholderText()
        set => this.put_PlaceholderText(value)
    }

    /**
     * @type {HSTRING} 
     */
    QueryText {
        get => this.get_QueryText()
        set => this.put_QueryText(value)
    }

    /**
     * @type {Boolean} 
     */
    FocusOnKeyboardInput {
        get => this.get_FocusOnKeyboardInput()
        set => this.put_FocusOnKeyboardInput(value)
    }

    /**
     * @type {Boolean} 
     */
    ChooseSuggestionOnEnter {
        get => this.get_ChooseSuggestionOnEnter()
        set => this.put_ChooseSuggestionOnEnter(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SearchHistoryEnabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_SearchHistoryEnabled(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SearchHistoryContext() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
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
    put_SearchHistoryContext(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PlaceholderText() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
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
    put_PlaceholderText(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_QueryText() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
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
    put_QueryText(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_FocusOnKeyboardInput() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_FocusOnKeyboardInput(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ChooseSuggestionOnEnter() {
        result := ComCall(16, this, "int*", &value := 0, "int")
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
    put_ChooseSuggestionOnEnter(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<SearchBox, SearchBoxQueryChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_QueryChanged(handler) {
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
    remove_QueryChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(19, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<SearchBox, SearchBoxSuggestionsRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SuggestionsRequested(handler) {
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
    remove_SuggestionsRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(21, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<SearchBox, SearchBoxQuerySubmittedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_QuerySubmitted(handler) {
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
    remove_QuerySubmitted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(23, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<SearchBox, SearchBoxResultSuggestionChosenEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ResultSuggestionChosen(handler) {
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
    remove_ResultSuggestionChosen(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(25, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<SearchBox, RoutedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PrepareForFocusOnKeyboardInput(handler) {
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
    remove_PrepareForFocusOnKeyboardInput(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(27, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {LocalContentSuggestionSettings} settings 
     * @returns {HRESULT} 
     */
    SetLocalContentSuggestionSettings(settings) {
        result := ComCall(28, this, "ptr", settings, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
