#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISearchSuggestionCollection.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a collection of search suggestions to be displayed in the search pane in response to a [suggestionsrequested](searchpane_suggestionsrequested.md) event.
 * @remarks
 * > [!IMPORTANT]
 * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
 * >
 * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
 * 
 * The search pane can display 5 suggestions, at most. Additionally, each separator you use takes the place of a suggestion and lowers the number of suggestions that you can display.
 * 
 * An app retrieves this object through the [SearchPaneSuggestionsRequest.searchSuggestionCollection](searchpanesuggestionsrequest_searchsuggestioncollection.md) property while handling a [SuggestionsRequested](searchpane_suggestionsrequested.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchsuggestioncollection
 * @namespace Windows.ApplicationModel.Search
 * @version WindowsRuntime 1.4
 */
class SearchSuggestionCollection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISearchSuggestionCollection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISearchSuggestionCollection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The number of suggestions in the collection.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * The search pane can display 5 suggestions, at most. Additionally, each separator you use takes the place of a suggestion and lowers the number of suggestions that you can display.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchsuggestioncollection.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__ISearchSuggestionCollection")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionCollection := ISearchSuggestionCollection(outPtr)
        }

        return this.__ISearchSuggestionCollection.get_Size()
    }

    /**
     * Appends a query suggestion to the list of search suggestions for the search pane.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * A query suggestion is a suggestion that the user can select as his or her query.
     * 
     * The search pane can display 5 suggestions, at most. Additionally, each separator you use takes the place of a suggestion and lowers the number of suggestions that you can display.
     * @param {HSTRING} text The text of the query suggestion.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchsuggestioncollection.appendquerysuggestion
     */
    AppendQuerySuggestion(text) {
        if (!this.HasProp("__ISearchSuggestionCollection")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionCollection := ISearchSuggestionCollection(outPtr)
        }

        return this.__ISearchSuggestionCollection.AppendQuerySuggestion(text)
    }

    /**
     * Appends a list of query suggestions to the list of search suggestions for the search pane.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * A query suggestion is a suggestion that the user can select as his or her query.
     * 
     * The search pane can display 5 suggestions, at most. Additionally, each separator you use takes the place of a suggestion and lowers the number of suggestions that you can display.
     * @param {IIterable<HSTRING>} suggestions The list of query suggestions.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchsuggestioncollection.appendquerysuggestions
     */
    AppendQuerySuggestions(suggestions) {
        if (!this.HasProp("__ISearchSuggestionCollection")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionCollection := ISearchSuggestionCollection(outPtr)
        }

        return this.__ISearchSuggestionCollection.AppendQuerySuggestions(suggestions)
    }

    /**
     * Appends a suggested search result to the list of suggestions to display in the search pane.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * You should use result suggestions instead of query suggestions only to display high-confidence results that take the user directly to the item instead of to a view that shows search results.
     * 
     * Suggested results include an image and optional detail text to display with the suggestion in the search pane. The image signals to the user that they are seeing results and not query suggestions. If an image for the result doesn't exist, you can use a generic image or icon that represents the result or result type.
     * 
     * You must listen for and handle the [ResultSuggestionChosen](searchpane_resultsuggestionchosen.md) event if you want to provide result suggestions.
     * 
     * The search pane can display 5 suggestions, at most. Additionally, each separator you use takes the place of a suggestion and lowers the number of suggestions that you can display.
     * @param {HSTRING} text The text of the suggested result.
     * @param {HSTRING} detailText The detail text for the suggested result.
     * @param {HSTRING} tag The unique tag that identifies this suggested result.
     * 
     * If this suggested result is selected by the user, a [ResultSuggestionChosen](searchpane_resultsuggestionchosen.md) event occurs. When the app handles this event, it can get the tag of the chosen result suggestion from the [SearchPaneResultSuggestionChosenEventArgs.Tag](searchpaneresultsuggestionchoseneventargs_tag.md) property.
     * @param {IRandomAccessStreamReference} image_ The image to accompany the results suggestion. The image should be 40 x 40. Windows will scale or crop smaller or larger images.
     * @param {HSTRING} imageAlternateText The alternate text for the image.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchsuggestioncollection.appendresultsuggestion
     */
    AppendResultSuggestion(text, detailText, tag, image_, imageAlternateText) {
        if (!this.HasProp("__ISearchSuggestionCollection")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionCollection := ISearchSuggestionCollection(outPtr)
        }

        return this.__ISearchSuggestionCollection.AppendResultSuggestion(text, detailText, tag, image_, imageAlternateText)
    }

    /**
     * Appends a text label that is used to separate groups of suggestions in the search pane.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * The search pane can display 5 suggestions, at most. Additionally, each separator you use takes the place of a suggestion and decreases the number of suggestions that you can display.
     * @param {HSTRING} label The text to use as a separator. This text should be descriptive of any suggestions that are appended after it.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchsuggestioncollection.appendsearchseparator
     */
    AppendSearchSeparator(label) {
        if (!this.HasProp("__ISearchSuggestionCollection")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionCollection := ISearchSuggestionCollection(outPtr)
        }

        return this.__ISearchSuggestionCollection.AppendSearchSeparator(label)
    }

;@endregion Instance Methods
}
