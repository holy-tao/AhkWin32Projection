#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITextControlCopyingToClipboardEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the **CopyingToClipboard** event.
 * @remarks
 * If you perform any action in the handler for a CopyingToClipboard event, set the **Handled** property to **true**; otherwise, the default copy action is performed.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textcontrolcopyingtoclipboardeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TextControlCopyingToClipboardEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextControlCopyingToClipboardEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextControlCopyingToClipboardEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that marks the routed event as handled. A **true** value for Handled prevents most handlers along the event route from handling the same event again.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textcontrolcopyingtoclipboardeventargs.handled
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
        if (!this.HasProp("__ITextControlCopyingToClipboardEventArgs")) {
            if ((queryResult := this.QueryInterface(ITextControlCopyingToClipboardEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextControlCopyingToClipboardEventArgs := ITextControlCopyingToClipboardEventArgs(outPtr)
        }

        return this.__ITextControlCopyingToClipboardEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__ITextControlCopyingToClipboardEventArgs")) {
            if ((queryResult := this.QueryInterface(ITextControlCopyingToClipboardEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextControlCopyingToClipboardEventArgs := ITextControlCopyingToClipboardEventArgs(outPtr)
        }

        return this.__ITextControlCopyingToClipboardEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}
