#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISearchBoxSuggestionsRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [SearchBox.SuggestionsRequested](searchbox_suggestionsrequested.md) event.
 * @remarks
 * > [!IMPORTANT]
 * > Although [SearchBox](searchbox_searchbox_1221375020.md) is implemented in the Universal device family, it is not fully functional on mobile devices. Use [AutoSuggestBox](autosuggestbox.md) for your universal search experience. See [SearchBox deprecated in favor of AutoSuggestBox](/windows/uwp/porting/w8x-to-uwp-porting-xaml-and-ui#searchbox-deprecated-in-favor-of-autosuggestbox).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.searchboxsuggestionsrequestedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class SearchBoxSuggestionsRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISearchBoxSuggestionsRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISearchBoxSuggestionsRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the query text of the current search.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.searchboxsuggestionsrequestedeventargs.querytext
     * @type {HSTRING} 
     */
    QueryText {
        get => this.get_QueryText()
    }

    /**
     * Gets the Internet Engineering Task Force (IETF) language tag (BCP 47 standard) that identifies the language currently associated with the user's text input device.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.searchboxsuggestionsrequestedeventargs.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
    }

    /**
     * Gets information about query text that the user enters through an Input Method Editor (IME).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.searchboxsuggestionsrequestedeventargs.linguisticdetails
     * @type {SearchQueryLinguisticDetails} 
     */
    LinguisticDetails {
        get => this.get_LinguisticDetails()
    }

    /**
     * Gets the object that stores the suggestions and information about this request.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.searchboxsuggestionsrequestedeventargs.request
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
        if (!this.HasProp("__ISearchBoxSuggestionsRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISearchBoxSuggestionsRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBoxSuggestionsRequestedEventArgs := ISearchBoxSuggestionsRequestedEventArgs(outPtr)
        }

        return this.__ISearchBoxSuggestionsRequestedEventArgs.get_QueryText()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        if (!this.HasProp("__ISearchBoxSuggestionsRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISearchBoxSuggestionsRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBoxSuggestionsRequestedEventArgs := ISearchBoxSuggestionsRequestedEventArgs(outPtr)
        }

        return this.__ISearchBoxSuggestionsRequestedEventArgs.get_Language()
    }

    /**
     * 
     * @returns {SearchQueryLinguisticDetails} 
     */
    get_LinguisticDetails() {
        if (!this.HasProp("__ISearchBoxSuggestionsRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISearchBoxSuggestionsRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBoxSuggestionsRequestedEventArgs := ISearchBoxSuggestionsRequestedEventArgs(outPtr)
        }

        return this.__ISearchBoxSuggestionsRequestedEventArgs.get_LinguisticDetails()
    }

    /**
     * 
     * @returns {SearchSuggestionsRequest} 
     */
    get_Request() {
        if (!this.HasProp("__ISearchBoxSuggestionsRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISearchBoxSuggestionsRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBoxSuggestionsRequestedEventArgs := ISearchBoxSuggestionsRequestedEventArgs(outPtr)
        }

        return this.__ISearchBoxSuggestionsRequestedEventArgs.get_Request()
    }

;@endregion Instance Methods
}
