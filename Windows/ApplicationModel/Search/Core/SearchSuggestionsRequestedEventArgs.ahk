#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISearchSuggestionsRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [SuggestionsRequested](searchsuggestionmanager_suggestionsrequested.md) event.
 * @remarks
 * This object is passed to an app's [SuggestionsRequested](searchsuggestionmanager_suggestionsrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.core.searchsuggestionsrequestedeventargs
 * @namespace Windows.ApplicationModel.Search.Core
 * @version WindowsRuntime 1.4
 */
class SearchSuggestionsRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISearchSuggestionsRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISearchSuggestionsRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The text that the app should provide suggestions for and that was in the search box when the [SuggestionsRequested](searchsuggestionmanager_suggestionsrequested.md) event was raised.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.core.searchsuggestionsrequestedeventargs.querytext
     * @type {HSTRING} 
     */
    QueryText {
        get => this.get_QueryText()
    }

    /**
     * Gets the Internet Engineering Task Force (IETF) language tag (BCP 47 standard) that identifies the language currently associated with the user's text input device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.core.searchsuggestionsrequestedeventargs.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
    }

    /**
     * Gets an object that provides linguistic information about query text that the user is entering through an Input Method Editor (IME).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.core.searchsuggestionsrequestedeventargs.linguisticdetails
     * @type {SearchQueryLinguisticDetails} 
     */
    LinguisticDetails {
        get => this.get_LinguisticDetails()
    }

    /**
     * Gets an object that stores suggestions and information about the request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.core.searchsuggestionsrequestedeventargs.request
     * @type {SearchSuggestionsRequest} 
     */
    Request {
        get => this.get_Request()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_QueryText() {
        if (!this.HasProp("__ISearchSuggestionsRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionsRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionsRequestedEventArgs := ISearchSuggestionsRequestedEventArgs(outPtr)
        }

        return this.__ISearchSuggestionsRequestedEventArgs.get_QueryText()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        if (!this.HasProp("__ISearchSuggestionsRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionsRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionsRequestedEventArgs := ISearchSuggestionsRequestedEventArgs(outPtr)
        }

        return this.__ISearchSuggestionsRequestedEventArgs.get_Language()
    }

    /**
     * 
     * @returns {SearchQueryLinguisticDetails} 
     */
    get_LinguisticDetails() {
        if (!this.HasProp("__ISearchSuggestionsRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionsRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionsRequestedEventArgs := ISearchSuggestionsRequestedEventArgs(outPtr)
        }

        return this.__ISearchSuggestionsRequestedEventArgs.get_LinguisticDetails()
    }

    /**
     * 
     * @returns {SearchSuggestionsRequest} 
     */
    get_Request() {
        if (!this.HasProp("__ISearchSuggestionsRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionsRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionsRequestedEventArgs := ISearchSuggestionsRequestedEventArgs(outPtr)
        }

        return this.__ISearchSuggestionsRequestedEventArgs.get_Request()
    }

;@endregion Instance Methods
}
