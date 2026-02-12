#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITextBoxTextChangingEventArgs.ahk
#Include .\ITextBoxTextChangingEventArgs2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [TextBox.TextChanging](textbox_textchanging.md) event.
 * @remarks
 * An instance of this class is passed as a parameter to the [TextChanging](textbox_textchanging.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textboxtextchangingeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TextBoxTextChangingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextBoxTextChangingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextBoxTextChangingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether the event occurred due to a change in the text content.
     * @remarks
     * This event is fired for a format or content change. The IsContentChanging property helps to distinguish when text content is changing.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textboxtextchangingeventargs.iscontentchanging
     * @type {Boolean} 
     */
    IsContentChanging {
        get => this.get_IsContentChanging()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsContentChanging() {
        if (!this.HasProp("__ITextBoxTextChangingEventArgs2")) {
            if ((queryResult := this.QueryInterface(ITextBoxTextChangingEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBoxTextChangingEventArgs2 := ITextBoxTextChangingEventArgs2(outPtr)
        }

        return this.__ITextBoxTextChangingEventArgs2.get_IsContentChanging()
    }

;@endregion Instance Methods
}
