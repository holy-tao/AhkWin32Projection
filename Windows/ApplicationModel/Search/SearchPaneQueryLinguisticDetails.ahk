#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISearchPaneQueryLinguisticDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about query text that the user enters through an Input Method Editor (IME).
 * @remarks
 * > [!IMPORTANT]
 * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
 * >
 * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
 * 
 * An app retrieves this object through the [searchPaneQueryChangedEventArgs.LinguisticDetails](searchpanequerychangedeventargs_linguisticdetails.md) property while handling a [QueryChanged](searchpane_querychanged.md) event or through the [SearchPaneSuggestionsRequestedEventArgs.LinguisticDetails](searchpanesuggestionsrequestedeventargs_linguisticdetails.md) property while handling a [SuggestionsRequested](searchpane_suggestionsrequested.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpanequerylinguisticdetails
 * @namespace Windows.ApplicationModel.Search
 * @version WindowsRuntime 1.4
 */
class SearchPaneQueryLinguisticDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISearchPaneQueryLinguisticDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISearchPaneQueryLinguisticDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a list of the text alternatives for the current query text. These alternatives account for uncomposed text the user is entering in an IME.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpanequerylinguisticdetails.querytextalternatives
     * @type {IVectorView<HSTRING>} 
     */
    QueryTextAlternatives {
        get => this.get_QueryTextAlternatives()
    }

    /**
     * Gets the starting location of the text that the user is composing with an Input Method Editor (IME).
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpanequerylinguisticdetails.querytextcompositionstart
     * @type {Integer} 
     */
    QueryTextCompositionStart {
        get => this.get_QueryTextCompositionStart()
    }

    /**
     * Gets the length of the portion of the query text that the user is composing with an Input Method Editor (IME).
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpanequerylinguisticdetails.querytextcompositionlength
     * @type {Integer} 
     */
    QueryTextCompositionLength {
        get => this.get_QueryTextCompositionLength()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_QueryTextAlternatives() {
        if (!this.HasProp("__ISearchPaneQueryLinguisticDetails")) {
            if ((queryResult := this.QueryInterface(ISearchPaneQueryLinguisticDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPaneQueryLinguisticDetails := ISearchPaneQueryLinguisticDetails(outPtr)
        }

        return this.__ISearchPaneQueryLinguisticDetails.get_QueryTextAlternatives()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_QueryTextCompositionStart() {
        if (!this.HasProp("__ISearchPaneQueryLinguisticDetails")) {
            if ((queryResult := this.QueryInterface(ISearchPaneQueryLinguisticDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPaneQueryLinguisticDetails := ISearchPaneQueryLinguisticDetails(outPtr)
        }

        return this.__ISearchPaneQueryLinguisticDetails.get_QueryTextCompositionStart()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_QueryTextCompositionLength() {
        if (!this.HasProp("__ISearchPaneQueryLinguisticDetails")) {
            if ((queryResult := this.QueryInterface(ISearchPaneQueryLinguisticDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPaneQueryLinguisticDetails := ISearchPaneQueryLinguisticDetails(outPtr)
        }

        return this.__ISearchPaneQueryLinguisticDetails.get_QueryTextCompositionLength()
    }

;@endregion Instance Methods
}
