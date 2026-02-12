#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISearchSuggestionManager.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\SearchSuggestionManager.ahk
#Include .\SearchSuggestionsRequestedEventArgs.ahk
#Include .\RequestingFocusOnKeyboardInputEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Manages access to search suggestions for the in-app [SearchBox](../windows.ui.xaml.controls/searchbox.md) control.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.core.searchsuggestionmanager
 * @namespace Windows.ApplicationModel.Search.Core
 * @version WindowsRuntime 1.4
 */
class SearchSuggestionManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISearchSuggestionManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISearchSuggestionManager.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Indicates whether the user's previous searches with the app are automatically tracked and used to provide suggestions.
     * @remarks
     * Set the SearchHistoryEnabled property to **false** to opt out of automatic suggestions, so your app can optionally provide its own suggestions instead. If you decide to have your app track its own search history, you should also give the user some control over their history through the Settings charm, like the ability to clear the history.
     * 
     * Changing the value of the SearchHistoryEnabled property doesn't immediately update the suggestions in the [Suggestions](searchsuggestionmanager_suggestions.md) property. Call [SetQuery](searchsuggestionmanager_setquery_1931070342.md) to update the [Suggestions](searchsuggestionmanager_suggestions.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.core.searchsuggestionmanager.searchhistoryenabled
     * @type {Boolean} 
     */
    SearchHistoryEnabled {
        get => this.get_SearchHistoryEnabled()
        set => this.put_SearchHistoryEnabled(value)
    }

    /**
     * Identifies the context of the search and is used to store the user's search history with the app.
     * @remarks
     * The search history context string is used as a secondary key for storing search history. The primary key is the AppId. An app can use the search history context string to store different search histories based on the context of the application.
     * 
     * Changing the value of the SearchHistoryContext property doesn't immediately update the suggestions in the [Suggestions](searchsuggestionmanager_suggestions.md) property. Call [SetQuery](searchsuggestionmanager_setquery_1931070342.md) to update the [Suggestions](searchsuggestionmanager_suggestions.md) property.
     * 
     * If you don't set this property, Windows assumes that all searches in your app occur in the same context.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.core.searchsuggestionmanager.searchhistorycontext
     * @type {HSTRING} 
     */
    SearchHistoryContext {
        get => this.get_SearchHistoryContext()
        set => this.put_SearchHistoryContext(value)
    }

    /**
     * Gets the search suggestions for the current search query.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.core.searchsuggestionmanager.suggestions
     * @type {IObservableVector<SearchSuggestion>} 
     */
    Suggestions {
        get => this.get_Suggestions()
    }

    /**
     * Raised when the user's query text changes and the app needs to provide new suggestions to display in the search box.
     * @remarks
     * Suggestions can come from three sources: search history, local files, or from a source specified by the app. Suggestions are grouped by their source and display in the following order in the search pane: search history, local files, and then app-specified sources.
     * 
     * If your app participates in the Search contract and you want your app to display suggestions from sources that you specify, you must register a handler to respond when this event fires. In your SuggestionsRequested event handler, respond by obtaining suggestions and populating the [SearchSuggestionCollection](../windows.applicationmodel.search/searchsuggestioncollection.md) based on the user's [QueryText](searchsuggestionsrequestedeventargs_querytext.md).
     * 
     * > [!NOTE]
     * > If you want to respond to this event asynchronously, you must get a deferral from the [Request](searchsuggestionsrequestedeventargs_request.md) property.
     * 
     * Suggestions can't be provided for an empty search box, so this event isn't raised when the user updates the search box to be empty.
     * @type {TypedEventHandler<SearchSuggestionManager, SearchSuggestionsRequestedEventArgs>}
    */
    OnSuggestionsRequested {
        get {
            if(!this.HasProp("__OnSuggestionsRequested")){
                this.__OnSuggestionsRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7e7f3cdf-80d9-5646-8743-ec1e38645d68}"),
                    SearchSuggestionManager,
                    SearchSuggestionsRequestedEventArgs
                )
                this.__OnSuggestionsRequestedToken := this.add_SuggestionsRequested(this.__OnSuggestionsRequested.iface)
            }
            return this.__OnSuggestionsRequested
        }
    }

    /**
     * Raised when the user presses a key that initiates type-to-search.
     * @remarks
     * The app's UI handles this event by setting focus to the search box control so that subsequent keystrokes result in entering a search query.
     * @type {TypedEventHandler<SearchSuggestionManager, RequestingFocusOnKeyboardInputEventArgs>}
    */
    OnRequestingFocusOnKeyboardInput {
        get {
            if(!this.HasProp("__OnRequestingFocusOnKeyboardInput")){
                this.__OnRequestingFocusOnKeyboardInput := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{bb198760-4739-5559-80e6-f0e1af5355fd}"),
                    SearchSuggestionManager,
                    RequestingFocusOnKeyboardInputEventArgs
                )
                this.__OnRequestingFocusOnKeyboardInputToken := this.add_RequestingFocusOnKeyboardInput(this.__OnRequestingFocusOnKeyboardInput.iface)
            }
            return this.__OnRequestingFocusOnKeyboardInput
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [SearchSuggestionManager](searchsuggestionmanager.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Search.Core.SearchSuggestionManager")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSuggestionsRequestedToken")) {
            this.remove_SuggestionsRequested(this.__OnSuggestionsRequestedToken)
            this.__OnSuggestionsRequested.iface.Dispose()
        }

        if(this.HasProp("__OnRequestingFocusOnKeyboardInputToken")) {
            this.remove_RequestingFocusOnKeyboardInput(this.__OnRequestingFocusOnKeyboardInputToken)
            this.__OnRequestingFocusOnKeyboardInput.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SearchHistoryEnabled() {
        if (!this.HasProp("__ISearchSuggestionManager")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionManager := ISearchSuggestionManager(outPtr)
        }

        return this.__ISearchSuggestionManager.get_SearchHistoryEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SearchHistoryEnabled(value) {
        if (!this.HasProp("__ISearchSuggestionManager")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionManager := ISearchSuggestionManager(outPtr)
        }

        return this.__ISearchSuggestionManager.put_SearchHistoryEnabled(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SearchHistoryContext() {
        if (!this.HasProp("__ISearchSuggestionManager")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionManager := ISearchSuggestionManager(outPtr)
        }

        return this.__ISearchSuggestionManager.get_SearchHistoryContext()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SearchHistoryContext(value) {
        if (!this.HasProp("__ISearchSuggestionManager")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionManager := ISearchSuggestionManager(outPtr)
        }

        return this.__ISearchSuggestionManager.put_SearchHistoryContext(value)
    }

    /**
     * Specifies whether suggestions based on local files are added automatically to the [Suggestions](searchsuggestionmanager_suggestions.md) collection, and defines the criteria that Windows uses to locate and filter these suggestions.
     * @remarks
     * When local content suggestions are enabled, Windows provides search suggestions from the user's local files as the user enters query text. For example, a picture application can configure local content suggestions so that search suggestions come only from a particular kind of image file that is stored in the user's picture library.
     * 
     * Changing the value of the SetLocalContentSuggestionSettings property doesn't immediately update the suggestions in the [Suggestions](searchsuggestionmanager_suggestions.md) property. Call [SetQuery](searchsuggestionmanager_setquery_1931070342.md) to update the [Suggestions](searchsuggestionmanager_suggestions.md) property.
     * @param {LocalContentSuggestionSettings} settings The new settings for local content suggestions.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.core.searchsuggestionmanager.setlocalcontentsuggestionsettings
     */
    SetLocalContentSuggestionSettings(settings) {
        if (!this.HasProp("__ISearchSuggestionManager")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionManager := ISearchSuggestionManager(outPtr)
        }

        return this.__ISearchSuggestionManager.SetLocalContentSuggestionSettings(settings)
    }

    /**
     * Assigns the current search query.
     * @remarks
     * The [SearchBox](../windows.ui.xaml.controls/searchbox.md) control calls the [SetQuery](searchsuggestionmanager_setquery_1931070342.md) method when the query text changes.
     * @param {HSTRING} queryText The query.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.core.searchsuggestionmanager.setquery
     */
    SetQuery(queryText) {
        if (!this.HasProp("__ISearchSuggestionManager")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionManager := ISearchSuggestionManager(outPtr)
        }

        return this.__ISearchSuggestionManager.SetQuery(queryText)
    }

    /**
     * Assigns the current search query with the specified input language.
     * @remarks
     * The [SearchBox](../windows.ui.xaml.controls/searchbox.md) control calls the [SetQuery](searchsuggestionmanager_setquery_1931070342.md) method when the query text changes.
     * @param {HSTRING} queryText The query.
     * @param {HSTRING} language_ The input language.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.core.searchsuggestionmanager.setquery
     */
    SetQueryWithLanguage(queryText, language_) {
        if (!this.HasProp("__ISearchSuggestionManager")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionManager := ISearchSuggestionManager(outPtr)
        }

        return this.__ISearchSuggestionManager.SetQueryWithLanguage(queryText, language_)
    }

    /**
     * Assigns the current search query with the specified input language and Input Method Editor (IME) info.
     * @remarks
     * The [SearchBox](../windows.ui.xaml.controls/searchbox.md) control calls the SetQuery method when the query text changes.
     * @param {HSTRING} queryText The query.
     * @param {HSTRING} language_ The input language.
     * @param {SearchQueryLinguisticDetails} linguisticDetails Info about the query text that the user enters through an Input Method Editor (IME).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.core.searchsuggestionmanager.setquery
     */
    SetQueryWithSearchQueryLinguisticDetails(queryText, language_, linguisticDetails) {
        if (!this.HasProp("__ISearchSuggestionManager")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionManager := ISearchSuggestionManager(outPtr)
        }

        return this.__ISearchSuggestionManager.SetQueryWithSearchQueryLinguisticDetails(queryText, language_, linguisticDetails)
    }

    /**
     * 
     * @returns {IObservableVector<SearchSuggestion>} 
     */
    get_Suggestions() {
        if (!this.HasProp("__ISearchSuggestionManager")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionManager := ISearchSuggestionManager(outPtr)
        }

        return this.__ISearchSuggestionManager.get_Suggestions()
    }

    /**
     * Stores the specified query in the search history.
     * @remarks
     * The [SearchBox](../windows.ui.xaml.controls/searchbox.md) control calls the [AddToHistory](searchsuggestionmanager_addtohistory_2021265072.md) method when the query entry is committed, to add it to the current history context.
     * 
     * Calling the [AddToHistory](searchsuggestionmanager_addtohistory_2021265072.md) method doesn't immediately update the suggestions in the [Suggestions](searchsuggestionmanager_suggestions.md) property. Call [SetQuery](searchsuggestionmanager_setquery_1931070342.md) to update the [Suggestions](searchsuggestionmanager_suggestions.md) property.
     * @param {HSTRING} queryText The query.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.core.searchsuggestionmanager.addtohistory
     */
    AddToHistory(queryText) {
        if (!this.HasProp("__ISearchSuggestionManager")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionManager := ISearchSuggestionManager(outPtr)
        }

        return this.__ISearchSuggestionManager.AddToHistory(queryText)
    }

    /**
     * Stores the specified query and input language in the search history.
     * @remarks
     * The [SearchBox](../windows.ui.xaml.controls/searchbox.md) control calls the AddToHistory method when the query entry is committed, to add it to the current history context.
     * 
     * Calling the AddToHistory method doesn't immediately update the suggestions in the [Suggestions](searchsuggestionmanager_suggestions.md) property. Call [SetQuery](searchsuggestionmanager_setquery_1931070342.md) to update the [Suggestions](searchsuggestionmanager_suggestions.md) property.
     * @param {HSTRING} queryText The query.
     * @param {HSTRING} language_ The input language. The input language ensures that the query string is displayed in the search history for the correct language.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.core.searchsuggestionmanager.addtohistory
     */
    AddToHistoryWithLanguage(queryText, language_) {
        if (!this.HasProp("__ISearchSuggestionManager")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionManager := ISearchSuggestionManager(outPtr)
        }

        return this.__ISearchSuggestionManager.AddToHistoryWithLanguage(queryText, language_)
    }

    /**
     * Clears all search history contexts for the current app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.core.searchsuggestionmanager.clearhistory
     */
    ClearHistory() {
        if (!this.HasProp("__ISearchSuggestionManager")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionManager := ISearchSuggestionManager(outPtr)
        }

        return this.__ISearchSuggestionManager.ClearHistory()
    }

    /**
     * 
     * @param {TypedEventHandler<SearchSuggestionManager, SearchSuggestionsRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SuggestionsRequested(handler) {
        if (!this.HasProp("__ISearchSuggestionManager")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionManager := ISearchSuggestionManager(outPtr)
        }

        return this.__ISearchSuggestionManager.add_SuggestionsRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SuggestionsRequested(token) {
        if (!this.HasProp("__ISearchSuggestionManager")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionManager := ISearchSuggestionManager(outPtr)
        }

        return this.__ISearchSuggestionManager.remove_SuggestionsRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SearchSuggestionManager, RequestingFocusOnKeyboardInputEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RequestingFocusOnKeyboardInput(handler) {
        if (!this.HasProp("__ISearchSuggestionManager")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionManager := ISearchSuggestionManager(outPtr)
        }

        return this.__ISearchSuggestionManager.add_RequestingFocusOnKeyboardInput(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RequestingFocusOnKeyboardInput(token) {
        if (!this.HasProp("__ISearchSuggestionManager")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionManager := ISearchSuggestionManager(outPtr)
        }

        return this.__ISearchSuggestionManager.remove_RequestingFocusOnKeyboardInput(token)
    }

;@endregion Instance Methods
}
