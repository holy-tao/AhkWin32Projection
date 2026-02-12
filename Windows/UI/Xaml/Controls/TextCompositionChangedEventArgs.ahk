#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITextCompositionChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [TextCompositionChanged](textbox_textcompositionchanged.md) event on [TextBox](textbox.md) and [RichEditBox](richeditbox.md).
 * @remarks
 * For more info, see the [TextBox.TextCompositionChanged](textbox_textcompositionchanged.md) and [RichEditBox.TextCompositionChanged](richeditbox_textcompositionchanged.md) events.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textcompositionchangedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TextCompositionChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextCompositionChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextCompositionChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the starting location of the text that the user is composing with an Input Method Editor (IME).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textcompositionchangedeventargs.startindex
     * @type {Integer} 
     */
    StartIndex {
        get => this.get_StartIndex()
    }

    /**
     * Gets the length of the portion of the text that the user is composing with an Input Method Editor (IME).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textcompositionchangedeventargs.length
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StartIndex() {
        if (!this.HasProp("__ITextCompositionChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITextCompositionChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextCompositionChangedEventArgs := ITextCompositionChangedEventArgs(outPtr)
        }

        return this.__ITextCompositionChangedEventArgs.get_StartIndex()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Length() {
        if (!this.HasProp("__ITextCompositionChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITextCompositionChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextCompositionChangedEventArgs := ITextCompositionChangedEventArgs(outPtr)
        }

        return this.__ITextCompositionChangedEventArgs.get_Length()
    }

;@endregion Instance Methods
}
