#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IAutoSuggestBoxQuerySubmittedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [AutoSuggestBox.QuerySubmitted](autosuggestbox_querysubmitted.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestboxquerysubmittedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class AutoSuggestBoxQuerySubmittedEventArgs extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAutoSuggestBoxQuerySubmittedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAutoSuggestBoxQuerySubmittedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the query text of the current search.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestboxquerysubmittedeventargs.querytext
     * @type {HSTRING} 
     */
    QueryText {
        get => this.get_QueryText()
    }

    /**
     * Gets the suggested result that the user chose.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestboxquerysubmittedeventargs.chosensuggestion
     * @type {IInspectable} 
     */
    ChosenSuggestion {
        get => this.get_ChosenSuggestion()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [AutoSuggestBoxQuerySubmittedEventArgs](autosuggestboxquerysubmittedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AutoSuggestBoxQuerySubmittedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_QueryText() {
        if (!this.HasProp("__IAutoSuggestBoxQuerySubmittedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBoxQuerySubmittedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBoxQuerySubmittedEventArgs := IAutoSuggestBoxQuerySubmittedEventArgs(outPtr)
        }

        return this.__IAutoSuggestBoxQuerySubmittedEventArgs.get_QueryText()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_ChosenSuggestion() {
        if (!this.HasProp("__IAutoSuggestBoxQuerySubmittedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBoxQuerySubmittedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBoxQuerySubmittedEventArgs := IAutoSuggestBoxQuerySubmittedEventArgs(outPtr)
        }

        return this.__IAutoSuggestBoxQuerySubmittedEventArgs.get_ChosenSuggestion()
    }

;@endregion Instance Methods
}
