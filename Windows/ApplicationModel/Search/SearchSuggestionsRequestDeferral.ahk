#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISearchSuggestionsRequestDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enables the app to signal when it has finished populating a [SearchSuggestionCollection](searchsuggestioncollection.md) object while handling the [SuggestionsRequested](../windows.ui.xaml.controls/searchbox_suggestionsrequested.md) event. Use a deferral if and only if your app needs to respond to a request for suggestions asynchronously.
 * @remarks
 * > [!IMPORTANT]
 * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
 * >
 * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
 * 
 * Your app should respond asynchronously to a request for suggestions if fulfilling the request will take a significant amount of time, such as fetching suggestions from a web service.
 * 
 * Use the [Complete](searchsuggestionsrequestdeferral_complete_1807836922.md) method to signal when your app has fulfilled the request. Retrieve this object by calling the [GetDeferral](searchsuggestionsrequest_getdeferral_254836512.md) method while handling the [SuggestionsRequested](../windows.ui.xaml.controls/searchbox_suggestionsrequested.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchsuggestionsrequestdeferral
 * @namespace Windows.ApplicationModel.Search
 * @version WindowsRuntime 1.4
 */
class SearchSuggestionsRequestDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISearchSuggestionsRequestDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISearchSuggestionsRequestDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Signals that the app has finished populating a [SearchSuggestionCollection](searchsuggestioncollection.md) object while handling the [SuggestionsRequested](../windows.ui.xaml.controls/searchbox_suggestionsrequested.md) event.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchsuggestionsrequestdeferral.complete
     */
    Complete() {
        if (!this.HasProp("__ISearchSuggestionsRequestDeferral")) {
            if ((queryResult := this.QueryInterface(ISearchSuggestionsRequestDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchSuggestionsRequestDeferral := ISearchSuggestionsRequestDeferral(outPtr)
        }

        return this.__ISearchSuggestionsRequestDeferral.Complete()
    }

;@endregion Instance Methods
}
