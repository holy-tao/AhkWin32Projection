#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISearchQueryLinguisticDetails.ahk
#Include .\ISearchQueryLinguisticDetailsFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about query text that the user enters through an Input Method Editor (IME).
 * @remarks
 * > [!IMPORTANT]
 * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
 * >
 * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
 * 
 * Get this object through the [LinguisticDetails](../windows.ui.xaml.controls/searchboxquerychangedeventargs_linguisticdetails.md) property while handling a [QueryChanged](../windows.ui.xaml.controls/searchbox_querychanged.md) event or through the [LinguisticDetails](../windows.ui.xaml.controls/searchboxsuggestionsrequestedeventargs_linguisticdetails.md) property while handling a [SuggestionsRequested](../windows.ui.xaml.controls/searchbox_suggestionsrequested.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchquerylinguisticdetails
 * @namespace Windows.ApplicationModel.Search
 * @version WindowsRuntime 1.4
 */
class SearchQueryLinguisticDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISearchQueryLinguisticDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISearchQueryLinguisticDetails.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [SearchQueryLinguisticDetails](searchquerylinguisticdetails.md) class.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * @param {IIterable<HSTRING>} queryTextAlternatives A list of the text alternatives for the current query text.
     * @param {Integer} queryTextCompositionStart The starting location of the text that the user is composing with an Input Method Editor (IME).
     * @param {Integer} queryTextCompositionLength The length of the portion of the query text that the user is composing with an Input Method Editor (IME).
     * @returns {SearchQueryLinguisticDetails} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchquerylinguisticdetails.#ctor
     */
    static CreateInstance(queryTextAlternatives, queryTextCompositionStart, queryTextCompositionLength) {
        if (!SearchQueryLinguisticDetails.HasProp("__ISearchQueryLinguisticDetailsFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Search.SearchQueryLinguisticDetails")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISearchQueryLinguisticDetailsFactory.IID)
            SearchQueryLinguisticDetails.__ISearchQueryLinguisticDetailsFactory := ISearchQueryLinguisticDetailsFactory(factoryPtr)
        }

        return SearchQueryLinguisticDetails.__ISearchQueryLinguisticDetailsFactory.CreateInstance(queryTextAlternatives, queryTextCompositionStart, queryTextCompositionLength)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a list of the text alternatives for the current query text. These alternatives account for uncomposed text the user is entering in an IME.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchquerylinguisticdetails.querytextalternatives
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
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchquerylinguisticdetails.querytextcompositionstart
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
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchquerylinguisticdetails.querytextcompositionlength
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
        if (!this.HasProp("__ISearchQueryLinguisticDetails")) {
            if ((queryResult := this.QueryInterface(ISearchQueryLinguisticDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchQueryLinguisticDetails := ISearchQueryLinguisticDetails(outPtr)
        }

        return this.__ISearchQueryLinguisticDetails.get_QueryTextAlternatives()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_QueryTextCompositionStart() {
        if (!this.HasProp("__ISearchQueryLinguisticDetails")) {
            if ((queryResult := this.QueryInterface(ISearchQueryLinguisticDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchQueryLinguisticDetails := ISearchQueryLinguisticDetails(outPtr)
        }

        return this.__ISearchQueryLinguisticDetails.get_QueryTextCompositionStart()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_QueryTextCompositionLength() {
        if (!this.HasProp("__ISearchQueryLinguisticDetails")) {
            if ((queryResult := this.QueryInterface(ISearchQueryLinguisticDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchQueryLinguisticDetails := ISearchQueryLinguisticDetails(outPtr)
        }

        return this.__ISearchQueryLinguisticDetails.get_QueryTextCompositionLength()
    }

;@endregion Instance Methods
}
