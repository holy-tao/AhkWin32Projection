#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Values used to indicate the reason for the text changing in the [AutoSuggestBox](autosuggestbox.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestionboxtextchangereason
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class AutoSuggestionBoxTextChangeReason extends Win32Enum{

    /**
     * The user edited the text.
     * @type {Integer (Int32)}
     */
    static UserInput => 0

    /**
     * The text was changed via code.
     * @type {Integer (Int32)}
     */
    static ProgrammaticChange => 1

    /**
     * The user selected one of the items in the auto-suggestion box.
     * @type {Integer (Int32)}
     */
    static SuggestionChosen => 2
}
