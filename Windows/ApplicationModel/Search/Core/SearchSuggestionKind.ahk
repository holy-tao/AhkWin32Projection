#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of a [SearchSuggestion](searchsuggestion.md).
 * @remarks
 * Use result suggestions instead of query suggestions only to display high-confidence results that take the user directly to the item instead of to a view that shows search results.
 * 
 * Suggested results include an image and optional detail text to display with the suggestion in the search pane. The image signals to the user that they are seeing results and not query suggestions. If an image for the result doesn't exist, you can use a generic image or icon that represents the result or result type.
 * 
 * Handle the [SuggestionsRequested](searchsuggestionmanager_suggestionsrequested.md) event to provide result suggestions.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.core.searchsuggestionkind
 * @namespace Windows.ApplicationModel.Search.Core
 * @version WindowsRuntime 1.4
 */
class SearchSuggestionKind extends Win32Enum{

    /**
     * The suggestion is a query suggestion.
     * @type {Integer (Int32)}
     */
    static Query => 0

    /**
     * The suggestion is a result suggestion.
     * @type {Integer (Int32)}
     */
    static Result => 1

    /**
     * Represents a separator between search suggestions that's useful for grouping.
     * @type {Integer (Int32)}
     */
    static Separator => 2
}
