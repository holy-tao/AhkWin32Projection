#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISearchSuggestion.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Enables access to the search suggestions that the [SearchSuggestionManager](searchsuggestionmanager.md) provides.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.core.searchsuggestion
 * @namespace Windows.ApplicationModel.Search.Core
 * @version WindowsRuntime 1.4
 */
class SearchSuggestion extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISearchSuggestion

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISearchSuggestion.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the type of suggestion.
     * @remarks
     * If the suggestion was supplied by the system, it has a [SearchSuggestionKind](searchsuggestionkind.md) of **Query**. If the suggestion was supplied by the application, in response to a [SuggestionsRequested](searchsuggestionmanager_suggestionsrequested.md) event, the kind is determined by the method of [SearchSuggestionCollection](../windows.applicationmodel.search/searchsuggestioncollection.md) that was used to add the suggestion.
     * 
     * | SearchSuggestionCollection method | SearchSuggestionKind |
     * |---|---|
     * | [AppendQuerySuggestion](../windows.applicationmodel.search/searchsuggestioncollection_appendquerysuggestion_1406009690.md) | **Query** |
     * | [AppendQuerySuggestions](../windows.applicationmodel.search/searchsuggestioncollection_appendquerysuggestions_81953608.md) | **Query** |
     * | [AppendResultSuggestion](../windows.applicationmodel.search/searchsuggestioncollection_appendresultsuggestion_603544202.md) | **Result** |
     * | [AppendSearchSeparator](../windows.applicationmodel.search/searchsuggestioncollection_appendsearchseparator_842802100.md) | **Separator** |
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.core.searchsuggestion.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the localized text of the suggestion for display in the search suggestions UI.
     * @remarks
     * This property is set for all kinds of suggestions, including **Separator**.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.core.searchsuggestion.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
    }

    /**
     * Gets the value that was passed to the *tag* parameter of the [AppendResultSuggestion](../windows.applicationmodel.search/searchsuggestioncollection_appendresultsuggestion_603544202.md) method.
     * @remarks
     * The Tag property is an opaque value that the app uses to identify the result suggestions that it has added when the user selects a suggestion in the UI.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.core.searchsuggestion.tag
     * @type {HSTRING} 
     */
    Tag {
        get => this.get_Tag()
    }

    /**
     * Gets the value that was passed to the *detailText* parameter of the [AppendResultSuggestion](../windows.applicationmodel.search/searchsuggestioncollection_appendresultsuggestion_603544202.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.core.searchsuggestion.detailtext
     * @type {HSTRING} 
     */
    DetailText {
        get => this.get_DetailText()
    }

    /**
     * Gets the value that was passed to the *image* parameter of the [AppendResultSuggestion](../windows.applicationmodel.search/searchsuggestioncollection_appendresultsuggestion_603544202.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.core.searchsuggestion.image
     * @type {IRandomAccessStreamReference} 
     */
    Image {
        get => this.get_Image()
    }

    /**
     * Gets the value that was passed to the *imageAlternateText* parameter of the [AppendResultSuggestion](../windows.applicationmodel.search/searchsuggestioncollection_appendresultsuggestion_603544202.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.core.searchsuggestion.imagealternatetext
     * @type {HSTRING} 
     */
    ImageAlternateText {
        get => this.get_ImageAlternateText()
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
    get_Kind() {
        if (!this.HasProp("__ISearchSuggestion")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestion := ISearchSuggestion(outPtr)
        }

        return this.__ISearchSuggestion.get_Kind()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__ISearchSuggestion")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestion := ISearchSuggestion(outPtr)
        }

        return this.__ISearchSuggestion.get_Text()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Tag() {
        if (!this.HasProp("__ISearchSuggestion")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestion := ISearchSuggestion(outPtr)
        }

        return this.__ISearchSuggestion.get_Tag()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DetailText() {
        if (!this.HasProp("__ISearchSuggestion")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestion := ISearchSuggestion(outPtr)
        }

        return this.__ISearchSuggestion.get_DetailText()
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Image() {
        if (!this.HasProp("__ISearchSuggestion")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestion := ISearchSuggestion(outPtr)
        }

        return this.__ISearchSuggestion.get_Image()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ImageAlternateText() {
        if (!this.HasProp("__ISearchSuggestion")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestion := ISearchSuggestion(outPtr)
        }

        return this.__ISearchSuggestion.get_ImageAlternateText()
    }

;@endregion Instance Methods
}
