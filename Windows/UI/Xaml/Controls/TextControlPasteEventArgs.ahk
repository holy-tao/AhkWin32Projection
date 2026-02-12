#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITextControlPasteEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the text control **Paste** event.
 * @remarks
 * For more info, see the [Paste](textbox_paste.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textcontrolpasteeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TextControlPasteEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextControlPasteEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextControlPasteEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that marks the routed event as handled. A **true** value for Handled prevents most handlers along the event route from handling the same event again.
     * @remarks
     * For more info, see the [Paste](textbox_paste.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textcontrolpasteeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
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
    get_Handled() {
        if (!this.HasProp("__ITextControlPasteEventArgs")) {
            if ((queryResult := this.QueryInterface(ITextControlPasteEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextControlPasteEventArgs := ITextControlPasteEventArgs(outPtr)
        }

        return this.__ITextControlPasteEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__ITextControlPasteEventArgs")) {
            if ((queryResult := this.QueryInterface(ITextControlPasteEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextControlPasteEventArgs := ITextControlPasteEventArgs(outPtr)
        }

        return this.__ITextControlPasteEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}
