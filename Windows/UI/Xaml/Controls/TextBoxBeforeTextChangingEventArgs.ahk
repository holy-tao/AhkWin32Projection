#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITextBoxBeforeTextChangingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [TextBox.BeforeTextChanging](textbox_beforetextchanging.md) event.
 * @remarks
 * An instance of this class is passed as a parameter to the [BeforeTextChanging](textbox_beforetextchanging.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textboxbeforetextchangingeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TextBoxBeforeTextChangingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextBoxBeforeTextChangingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextBoxBeforeTextChangingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the new text that is entered into the text box.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textboxbeforetextchangingeventargs.newtext
     * @type {HSTRING} 
     */
    NewText {
        get => this.get_NewText()
    }

    /**
     * Gets or sets a value that indicates whether to cancel the text changes.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textboxbeforetextchangingeventargs.cancel
     * @type {Boolean} 
     */
    Cancel {
        get => this.get_Cancel()
        set => this.put_Cancel(value)
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
    get_NewText() {
        if (!this.HasProp("__ITextBoxBeforeTextChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(ITextBoxBeforeTextChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBoxBeforeTextChangingEventArgs := ITextBoxBeforeTextChangingEventArgs(outPtr)
        }

        return this.__ITextBoxBeforeTextChangingEventArgs.get_NewText()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Cancel() {
        if (!this.HasProp("__ITextBoxBeforeTextChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(ITextBoxBeforeTextChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBoxBeforeTextChangingEventArgs := ITextBoxBeforeTextChangingEventArgs(outPtr)
        }

        return this.__ITextBoxBeforeTextChangingEventArgs.get_Cancel()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Cancel(value) {
        if (!this.HasProp("__ITextBoxBeforeTextChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(ITextBoxBeforeTextChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBoxBeforeTextChangingEventArgs := ITextBoxBeforeTextChangingEventArgs(outPtr)
        }

        return this.__ITextBoxBeforeTextChangingEventArgs.put_Cancel(value)
    }

;@endregion Instance Methods
}
