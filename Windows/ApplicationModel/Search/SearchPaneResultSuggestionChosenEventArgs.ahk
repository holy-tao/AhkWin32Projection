#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISearchPaneResultSuggestionChosenEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for a [ResultSuggestionChosen](searchpane_resultsuggestionchosen.md) event that is associated with a [SearchPane](searchpane.md) object.
 * @remarks
 * > [!IMPORTANT]
 * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
 * >
 * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
 * 
 * This object is passed to an app's [ResultSuggestionChosen](searchpane_resultsuggestionchosen.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpaneresultsuggestionchoseneventargs
 * @namespace Windows.ApplicationModel.Search
 * @version WindowsRuntime 1.4
 */
class SearchPaneResultSuggestionChosenEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISearchPaneResultSuggestionChosenEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISearchPaneResultSuggestionChosenEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the tag for the suggested result that the user selected.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * The value of this tag is set by the app when it appends the suggested result to a [searchSuggestionCollection](searchsuggestioncollection.md).
     * 
     * You can use this property to display the view for the result the user selected.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpaneresultsuggestionchoseneventargs.tag
     * @type {HSTRING} 
     */
    Tag {
        get => this.get_Tag()
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
    get_Tag() {
        if (!this.HasProp("__ISearchPaneResultSuggestionChosenEventArgs")) {
            if ((queryResult := this.QueryInterface(ISearchPaneResultSuggestionChosenEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPaneResultSuggestionChosenEventArgs := ISearchPaneResultSuggestionChosenEventArgs(outPtr)
        }

        return this.__ISearchPaneResultSuggestionChosenEventArgs.get_Tag()
    }

;@endregion Instance Methods
}
