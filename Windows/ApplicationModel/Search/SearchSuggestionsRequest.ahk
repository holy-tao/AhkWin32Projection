#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISearchSuggestionsRequest.ahk
#Include ..\..\..\Guid.ahk

/**
 * Stores suggestions and information about the request for suggestions.
 * @remarks
 * > [!IMPORTANT]
 * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
 * >
 * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
 * 
 * If your app provides its own suggestions to display in the search pane or in-app search box, use the [SearchSuggestionCollection](searchsuggestionsrequest_searchsuggestioncollection.md) property to add your app's suggestions to the collection of suggestions to display.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchsuggestionsrequest
 * @namespace Windows.ApplicationModel.Search
 * @version WindowsRuntime 1.4
 */
class SearchSuggestionsRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISearchSuggestionsRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISearchSuggestionsRequest.IID

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
     * A request for search pane or in-app search box suggestions is valid if it's still tied to the most recent [SuggestionsRequested](../windows.ui.xaml.controls/searchbox_suggestionsrequested.md) event, which means that the user hasn't changed the search query.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchsuggestionsrequest.iscanceled
     * @type {Boolean} 
     */
    IsCanceled {
        get => this.get_IsCanceled()
    }

    /**
     * Gets the suggestions to display in the search pane or in-app search box for the current query. Apps provide suggestions to display by appending them to this [SearchSuggestionCollection](searchsuggestioncollection.md) object.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * Use the [SearchSuggestionCollection](searchsuggestioncollection.md) object to append app-provided suggestions and search separators to display in the search pane or in-app search box.
     * 
     * When the request for suggestions is completed, either by returning from the [SuggestionsRequested](../windows.ui.xaml.controls/searchbox_suggestionsrequested.md) event handler or by calling [Complete](searchsuggestionsrequestdeferral_complete_1807836922.md), the search pane or in-app search box displays the suggestions in the [SearchSuggestionCollection](searchsuggestioncollection.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchsuggestionsrequest.searchsuggestioncollection
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
        if (!this.HasProp("__ISearchSuggestionsRequest")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionsRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionsRequest := ISearchSuggestionsRequest(outPtr)
        }

        return this.__ISearchSuggestionsRequest.get_IsCanceled()
    }

    /**
     * 
     * @returns {SearchSuggestionCollection} 
     */
    get_SearchSuggestionCollection() {
        if (!this.HasProp("__ISearchSuggestionsRequest")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionsRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionsRequest := ISearchSuggestionsRequest(outPtr)
        }

        return this.__ISearchSuggestionsRequest.get_SearchSuggestionCollection()
    }

    /**
     * Gets an object that lets an app respond to a request for suggestions asynchronously.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * Your app should respond asynchronously to a request for search suggestions if fulfilling the request will take a significant amount of time, such as fetching suggestions from a web service.
     * 
     * Call the [Complete](searchsuggestionsrequestdeferral_complete_1807836922.md) method to signal when your app has fulfilled the request.
     * @returns {SearchSuggestionsRequestDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchsuggestionsrequest.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__ISearchSuggestionsRequest")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionsRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionsRequest := ISearchSuggestionsRequest(outPtr)
        }

        return this.__ISearchSuggestionsRequest.GetDeferral()
    }

;@endregion Instance Methods
}
