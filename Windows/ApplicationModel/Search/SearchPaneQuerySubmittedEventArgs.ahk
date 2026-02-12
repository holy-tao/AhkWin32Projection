#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISearchPaneQuerySubmittedEventArgs.ahk
#Include .\ISearchPaneQuerySubmittedEventArgsWithLinguisticDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for a [QuerySubmitted](searchpane_querysubmitted.md) event that is associated with a [SearchPane](searchpane.md) instance.
 * @remarks
 * > [!IMPORTANT]
 * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
 * >
 * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
 * 
 * This object is passed to an app's [QuerySubmitted](searchpane_querysubmitted.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpanequerysubmittedeventargs
 * @namespace Windows.ApplicationModel.Search
 * @version WindowsRuntime 1.4
 */
class SearchPaneQuerySubmittedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISearchPaneQuerySubmittedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISearchPaneQuerySubmittedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the text that was submitted through the search pane.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpanequerysubmittedeventargs.querytext
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
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpanequerysubmittedeventargs.language
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
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpanequerysubmittedeventargs.linguisticdetails
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
     * @returns {HSTRING} 
     */
    get_QueryText() {
        if (!this.HasProp("__ISearchPaneQuerySubmittedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISearchPaneQuerySubmittedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPaneQuerySubmittedEventArgs := ISearchPaneQuerySubmittedEventArgs(outPtr)
        }

        return this.__ISearchPaneQuerySubmittedEventArgs.get_QueryText()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        if (!this.HasProp("__ISearchPaneQuerySubmittedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISearchPaneQuerySubmittedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPaneQuerySubmittedEventArgs := ISearchPaneQuerySubmittedEventArgs(outPtr)
        }

        return this.__ISearchPaneQuerySubmittedEventArgs.get_Language()
    }

    /**
     * 
     * @returns {SearchPaneQueryLinguisticDetails} 
     */
    get_LinguisticDetails() {
        if (!this.HasProp("__ISearchPaneQuerySubmittedEventArgsWithLinguisticDetails")) {
            if ((queryResult := this.QueryInterface(ISearchPaneQuerySubmittedEventArgsWithLinguisticDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPaneQuerySubmittedEventArgsWithLinguisticDetails := ISearchPaneQuerySubmittedEventArgsWithLinguisticDetails(outPtr)
        }

        return this.__ISearchPaneQuerySubmittedEventArgsWithLinguisticDetails.get_LinguisticDetails()
    }

;@endregion Instance Methods
}
