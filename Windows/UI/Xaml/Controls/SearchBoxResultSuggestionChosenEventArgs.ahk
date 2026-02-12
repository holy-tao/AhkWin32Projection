#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISearchBoxResultSuggestionChosenEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [SearchBox.ResultSuggestionChosen](searchbox_resultsuggestionchosen.md) event.
 * @remarks
 * > [!IMPORTANT]
 * > Although [SearchBox](searchbox_searchbox_1221375020.md) is implemented in the Universal device family, it is not fully functional on mobile devices. Use [AutoSuggestBox](autosuggestbox.md) for your universal search experience. See [SearchBox deprecated in favor of AutoSuggestBox](/windows/uwp/porting/w8x-to-uwp-porting-xaml-and-ui#searchbox-deprecated-in-favor-of-autosuggestbox).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.searchboxresultsuggestionchoseneventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class SearchBoxResultSuggestionChosenEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISearchBoxResultSuggestionChosenEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISearchBoxResultSuggestionChosenEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The app-defined tag for the suggested result that the user selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.searchboxresultsuggestionchoseneventargs.tag
     * @type {HSTRING} 
     */
    Tag {
        get => this.get_Tag()
    }

    /**
     * Gets any modifier keys that are pressed when the user presses enter to pick a search result.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.searchboxresultsuggestionchoseneventargs.keymodifiers
     * @type {Integer} 
     */
    KeyModifiers {
        get => this.get_KeyModifiers()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [SearchBoxResultSuggestionChosenEventArgs](searchboxresultsuggestionchoseneventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SearchBoxResultSuggestionChosenEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Tag() {
        if (!this.HasProp("__ISearchBoxResultSuggestionChosenEventArgs")) {
            if ((queryResult := this.QueryInterface(ISearchBoxResultSuggestionChosenEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBoxResultSuggestionChosenEventArgs := ISearchBoxResultSuggestionChosenEventArgs(outPtr)
        }

        return this.__ISearchBoxResultSuggestionChosenEventArgs.get_Tag()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_KeyModifiers() {
        if (!this.HasProp("__ISearchBoxResultSuggestionChosenEventArgs")) {
            if ((queryResult := this.QueryInterface(ISearchBoxResultSuggestionChosenEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBoxResultSuggestionChosenEventArgs := ISearchBoxResultSuggestionChosenEventArgs(outPtr)
        }

        return this.__ISearchBoxResultSuggestionChosenEventArgs.get_KeyModifiers()
    }

;@endregion Instance Methods
}
