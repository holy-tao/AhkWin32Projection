#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the values for specifying a preferred view for the input pane.
 * @remarks
 * Primary view refers to either of the [CoreInputViewKind.Keyboard](https://github.com/MicrosoftDocs/winrt-api/blob/docs/windows.ui.viewmanagement.core/coreinputviewkind.md#-field-keyboard1) or [CoreInputViewKind.Handwriting](https://github.com/MicrosoftDocs/winrt-api/blob/docs/windows.ui.viewmanagement.core/coreinputviewkind.md#-field-handwriting2) views, while CoreInputView can be any of the values from [CoreInputViewKind](coreinputviewkind.md).
 * 
 * Pass this parameter in the [TryShow(CoreInputViewKind)](coreinputview_tryshow_154132369.md) method to specify the preferred input view.
 * 
 * This allows apps to build specific experiences around certain input views, if that view is available.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputviewkind
 * @namespace Windows.UI.ViewManagement.Core
 * @version WindowsRuntime 1.4
 */
class CoreInputViewKind extends Win32Enum{

    /**
     * Show the default input pane view.
     * 
     * Behaves exactly like [TryShow](coreinputview_tryshow_1077566544.md) or [TryShowPrimaryView](coreinputview_tryshowprimaryview_1925215151.md).
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Show the software keyboard view.
     * @type {Integer (Int32)}
     */
    static Keyboard => 1

    /**
     * Show the handwriting pane view. If it is not available, it will show the software keyboard.
     * @type {Integer (Int32)}
     */
    static Handwriting => 2

    /**
     * Show the emoji pane view. If it is not available, it will show the emoji view of the software keyboard.
     * @type {Integer (Int32)}
     */
    static Emoji => 3

    /**
     * Show the emoji pane with symbols view enabled. If it is not available, it will show the emoji view of the software keyboard.
     * @type {Integer (Int32)}
     */
    static Symbols => 4

    /**
     * Show the clipboard history pane view.
     * @type {Integer (Int32)}
     */
    static Clipboard => 5

    /**
     * Show the dictation pane view.
     * @type {Integer (Int32)}
     */
    static Dictation => 6

    /**
     * Show the gamepad keyboard view.
     * @type {Integer (Int32)}
     */
    static Gamepad => 7
}
