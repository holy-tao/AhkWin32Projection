#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISearchPaneSuggestionsRequest.ahk
#Include ..\..\..\Guid.ahk

/**
 * Stores suggestions and information about the request for suggestions.
 * @remarks
 * > [!IMPORTANT]
 * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
 * >
 * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
 * 
 * If your app provides its own suggestions to display in the search pane, use the [SearchPaneSuggestionsRequest.SearchSuggestionCollection](searchpanesuggestionsrequest_searchsuggestioncollection.md) property to add your app's suggestions to the collection of suggestions to display.
 * 
 * The search pane can display 5 suggestions, at most. Additionally, each separator you use takes the place of a suggestion and lowers the number of suggestions that you can display.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpanesuggestionsrequest
 * @namespace Windows.ApplicationModel.Search
 * @version WindowsRuntime 1.4
 */
class SearchPaneSuggestionsRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISearchPaneSuggestionsRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISearchPaneSuggestionsRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Indicates whether the request for suggestions to display is canceled.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * A request for search pane suggestions is valid if it is still tied to the most recent [suggestionsrequested](searchpane_suggestionsrequested.md) event; that is, if the user has not changed the search query.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpanesuggestionsrequest.iscanceled
     * @type {Boolean} 
     */
    IsCanceled {
        get => this.get_IsCanceled()
    }

    /**
     * Gets the suggestions to display in the search pane for the current query. Apps provide suggestions to display by appending them to this [SearchSuggestionCollection](searchsuggestioncollection.md) object.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * The search pane can display 5 suggestions, at most. Additionally, each separator you use takes the place of a suggestion and lowers the number of suggestions that you can display.
     * 
     * Use the [SearchSuggestionCollection](searchsuggestioncollection.md) object to append app-provided suggestions and search separators to display in the search pane.
     * 
     * When the request for suggestions is completed, either by returning from the [suggestionsrequested](searchpane_suggestionsrequested.md) event handler or by calling [searchPaneSuggestionsRequestDeferral.complete](searchpanesuggestionsrequestdeferral_complete_1807836922.md), the search pane displays the suggestions in the [searchSuggestionCollection](searchsuggestioncollection.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpanesuggestionsrequest.searchsuggestioncollection
     * @type {SearchSuggestionCollection} 
     */
    SearchSuggestionCollection {
        get => this.get_SearchSuggestionCollection()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCanceled() {
        if (!this.HasProp("__ISearchPaneSuggestionsRequest")) {
            if ((queryResult := this.QueryInterface(ISearchPaneSuggestionsRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPaneSuggestionsRequest := ISearchPaneSuggestionsRequest(outPtr)
        }

        return this.__ISearchPaneSuggestionsRequest.get_IsCanceled()
    }

    /**
     * 
     * @returns {SearchSuggestionCollection} 
     */
    get_SearchSuggestionCollection() {
        if (!this.HasProp("__ISearchPaneSuggestionsRequest")) {
            if ((queryResult := this.QueryInterface(ISearchPaneSuggestionsRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPaneSuggestionsRequest := ISearchPaneSuggestionsRequest(outPtr)
        }

        return this.__ISearchPaneSuggestionsRequest.get_SearchSuggestionCollection()
    }

    /**
     * Retrieves an object that lets an app respond to a request for suggestions asynchronously.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * Your app should respond asynchronously to a request for search suggestions if fulfilling the request will take a significant amount of time, such as fetching suggestions from a web service.
     * 
     * Use the [searchPaneSuggestionsRequestDeferral.complete](searchpanesuggestionsrequestdeferral_complete_1807836922.md) method to signal when your app has fulfilled the request.
     * @returns {SearchPaneSuggestionsRequestDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpanesuggestionsrequest.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__ISearchPaneSuggestionsRequest")) {
            if ((queryResult := this.QueryInterface(ISearchPaneSuggestionsRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPaneSuggestionsRequest := ISearchPaneSuggestionsRequest(outPtr)
        }

        return this.__ISearchPaneSuggestionsRequest.GetDeferral()
    }

;@endregion Instance Methods
}
