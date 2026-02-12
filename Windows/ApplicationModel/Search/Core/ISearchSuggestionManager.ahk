#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\Collections\IObservableVector.ahk
#Include .\SearchSuggestion.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Search.Core
 * @version WindowsRuntime 1.4
 */
class ISearchSuggestionManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISearchSuggestionManager
     * @type {Guid}
     */
    static IID => Guid("{3f0c50a1-cb9d-497b-b500-3c04ac959ad2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SearchHistoryEnabled", "put_SearchHistoryEnabled", "get_SearchHistoryContext", "put_SearchHistoryContext", "SetLocalContentSuggestionSettings", "SetQuery", "SetQueryWithLanguage", "SetQueryWithSearchQueryLinguisticDetails", "get_Suggestions", "AddToHistory", "AddToHistoryWithLanguage", "ClearHistory", "add_SuggestionsRequested", "remove_SuggestionsRequested", "add_RequestingFocusOnKeyboardInput", "remove_RequestingFocusOnKeyboardInput"]

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
     * @type {IObservableVector<SearchSuggestion>} 
     */
    Suggestions {
        get => this.get_Suggestions()
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
     * @param {LocalContentSuggestionSettings} settings 
     * @returns {HRESULT} 
     */
    SetLocalContentSuggestionSettings(settings) {
        result := ComCall(10, this, "ptr", settings, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} queryText 
     * @returns {HRESULT} 
     */
    SetQuery(queryText) {
        if(queryText is String) {
            pin := HSTRING.Create(queryText)
            queryText := pin.Value
        }
        queryText := queryText is Win32Handle ? NumGet(queryText, "ptr") : queryText

        result := ComCall(11, this, "ptr", queryText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} queryText 
     * @param {HSTRING} language_ 
     * @returns {HRESULT} 
     */
    SetQueryWithLanguage(queryText, language_) {
        if(queryText is String) {
            pin := HSTRING.Create(queryText)
            queryText := pin.Value
        }
        queryText := queryText is Win32Handle ? NumGet(queryText, "ptr") : queryText
        if(language_ is String) {
            pin := HSTRING.Create(language_)
            language_ := pin.Value
        }
        language_ := language_ is Win32Handle ? NumGet(language_, "ptr") : language_

        result := ComCall(12, this, "ptr", queryText, "ptr", language_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} queryText 
     * @param {HSTRING} language_ 
     * @param {SearchQueryLinguisticDetails} linguisticDetails 
     * @returns {HRESULT} 
     */
    SetQueryWithSearchQueryLinguisticDetails(queryText, language_, linguisticDetails) {
        if(queryText is String) {
            pin := HSTRING.Create(queryText)
            queryText := pin.Value
        }
        queryText := queryText is Win32Handle ? NumGet(queryText, "ptr") : queryText
        if(language_ is String) {
            pin := HSTRING.Create(language_)
            language_ := pin.Value
        }
        language_ := language_ is Win32Handle ? NumGet(language_, "ptr") : language_

        result := ComCall(13, this, "ptr", queryText, "ptr", language_, "ptr", linguisticDetails, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IObservableVector<SearchSuggestion>} 
     */
    get_Suggestions() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IObservableVector(SearchSuggestion, value)
    }

    /**
     * 
     * @param {HSTRING} queryText 
     * @returns {HRESULT} 
     */
    AddToHistory(queryText) {
        if(queryText is String) {
            pin := HSTRING.Create(queryText)
            queryText := pin.Value
        }
        queryText := queryText is Win32Handle ? NumGet(queryText, "ptr") : queryText

        result := ComCall(15, this, "ptr", queryText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} queryText 
     * @param {HSTRING} language_ 
     * @returns {HRESULT} 
     */
    AddToHistoryWithLanguage(queryText, language_) {
        if(queryText is String) {
            pin := HSTRING.Create(queryText)
            queryText := pin.Value
        }
        queryText := queryText is Win32Handle ? NumGet(queryText, "ptr") : queryText
        if(language_ is String) {
            pin := HSTRING.Create(language_)
            language_ := pin.Value
        }
        language_ := language_ is Win32Handle ? NumGet(language_, "ptr") : language_

        result := ComCall(16, this, "ptr", queryText, "ptr", language_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearHistory() {
        result := ComCall(17, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<SearchSuggestionManager, SearchSuggestionsRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SuggestionsRequested(handler) {
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
    remove_SuggestionsRequested(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(19, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<SearchSuggestionManager, RequestingFocusOnKeyboardInputEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RequestingFocusOnKeyboardInput(handler) {
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
    remove_RequestingFocusOnKeyboardInput(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(21, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
