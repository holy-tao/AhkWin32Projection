#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITextControlCuttingToClipboardEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the **CuttingToClipboard** event.
 * @remarks
 * If you perform any action in the handler for a CuttingToClipboard event, set the **Handled** property to **true**; otherwise, the default cut action is performed.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textcontrolcuttingtoclipboardeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TextControlCuttingToClipboardEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextControlCuttingToClipboardEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextControlCuttingToClipboardEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that marks the routed event as handled. A **true** value for Handled prevents most handlers along the event route from handling the same event again.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textcontrolcuttingtoclipboardeventargs.handled
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
        if (!this.HasProp("__ITextControlCuttingToClipboardEventArgs")) {
            if ((queryResult := this.QueryInterface(ITextControlCuttingToClipboardEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextControlCuttingToClipboardEventArgs := ITextControlCuttingToClipboardEventArgs(outPtr)
        }

        return this.__ITextControlCuttingToClipboardEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__ITextControlCuttingToClipboardEventArgs")) {
            if ((queryResult := this.QueryInterface(ITextControlCuttingToClipboardEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextControlCuttingToClipboardEventArgs := ITextControlCuttingToClipboardEventArgs(outPtr)
        }

        return this.__ITextControlCuttingToClipboardEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}
