#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISearchPaneSuggestionsRequestedEventArgs.ahk
#Include .\ISearchPaneQueryChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for a [SuggestionsRequested](searchpane_suggestionsrequested.md) event that is associated with a [SearchPane](searchpane.md) object.
 * @remarks
 * > [!IMPORTANT]
 * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
 * >
 * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
 * 
 * This object is passed to an app's [SuggestionsRequested](searchpane_suggestionsrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpanesuggestionsrequestedeventargs
 * @namespace Windows.ApplicationModel.Search
 * @version WindowsRuntime 1.4
 */
class SearchPaneSuggestionsRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISearchPaneSuggestionsRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISearchPaneSuggestionsRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets an object that stores suggestions and information about the request.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * The search pane can display 5 suggestions, at most. Additionally, each separator you use takes the place of a suggestion and lowers the number of suggestions that you can display.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpanesuggestionsrequestedeventargs.request
     * @type {SearchPaneSuggestionsRequest} 
     */
    Request {
        get => this.get_Request()
    }

    /**
     * Gets the text that the app should provide suggestions for and that was in the search box when the [SuggestionsRequested](searchpane_suggestionsrequested.md) event occurred.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * Generally, this is the current text in the search box, but if the user types quickly or the app processes slowly, it may not be.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpanesuggestionsrequestedeventargs.querytext
     * @type {HSTRING} 
     */
    QueryText {
        get => this.get_QueryText()
    }

    /**
     * Gets the Internet Engineering Task Force (IETF) language tag (BCP 47 standard) that identifies the language currently associated with the user's text input device.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpanesuggestionsrequestedeventargs.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
    }

    /**
     * Gets an object that provides linguistic information about query text that the user is entering through an Input Method Editor (IME).
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpanesuggestionsrequestedeventargs.linguisticdetails
     * @type {SearchPaneQueryLinguisticDetails} 
     */
    LinguisticDetails {
        get => this.get_LinguisticDetails()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SearchPaneSuggestionsRequest} 
     */
    get_Request() {
        if (!this.HasProp("__ISearchPaneSuggestionsRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISearchPaneSuggestionsRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPaneSuggestionsRequestedEventArgs := ISearchPaneSuggestionsRequestedEventArgs(outPtr)
        }

        return this.__ISearchPaneSuggestionsRequestedEventArgs.get_Request()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_QueryText() {
        if (!this.HasProp("__ISearchPaneQueryChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISearchPaneQueryChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPaneQueryChangedEventArgs := ISearchPaneQueryChangedEventArgs(outPtr)
        }

        return this.__ISearchPaneQueryChangedEventArgs.get_QueryText()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        if (!this.HasProp("__ISearchPaneQueryChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISearchPaneQueryChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPaneQueryChangedEventArgs := ISearchPaneQueryChangedEventArgs(outPtr)
        }

        return this.__ISearchPaneQueryChangedEventArgs.get_Language()
    }

    /**
     * 
     * @returns {SearchPaneQueryLinguisticDetails} 
     */
    get_LinguisticDetails() {
        if (!this.HasProp("__ISearchPaneQueryChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISearchPaneQueryChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPaneQueryChangedEventArgs := ISearchPaneQueryChangedEventArgs(outPtr)
        }

        return this.__ISearchPaneQueryChangedEventArgs.get_LinguisticDetails()
    }

;@endregion Instance Methods
}
