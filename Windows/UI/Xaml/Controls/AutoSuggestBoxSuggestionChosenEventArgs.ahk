#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IAutoSuggestBoxSuggestionChosenEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [SuggestionChosen](autosuggestbox_suggestionchosen.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestboxsuggestionchoseneventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class AutoSuggestBoxSuggestionChosenEventArgs extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAutoSuggestBoxSuggestionChosenEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAutoSuggestBoxSuggestionChosenEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a reference to the selected item.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestboxsuggestionchoseneventargs.selecteditem
     * @type {IInspectable} 
     */
    SelectedItem {
        get => this.get_SelectedItem()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [AutoSuggestBoxSuggestionChosenEventArgs](autosuggestboxsuggestionchoseneventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AutoSuggestBoxSuggestionChosenEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_SelectedItem() {
        if (!this.HasProp("__IAutoSuggestBoxSuggestionChosenEventArgs")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBoxSuggestionChosenEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBoxSuggestionChosenEventArgs := IAutoSuggestBoxSuggestionChosenEventArgs(outPtr)
        }

        return this.__IAutoSuggestBoxSuggestionChosenEventArgs.get_SelectedItem()
    }

;@endregion Instance Methods
}
