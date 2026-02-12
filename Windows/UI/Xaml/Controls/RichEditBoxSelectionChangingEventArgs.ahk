#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRichEditBoxSelectionChangingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [RichEditBox.SelectionChanging](richeditbox_selectionchanging.md) event.
 * @remarks
 * An instance of this class is passed as a parameter to the [SelectionChanging](richeditbox_selectionchanging.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditboxselectionchangingeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class RichEditBoxSelectionChangingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRichEditBoxSelectionChangingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRichEditBoxSelectionChangingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the starting index of the text selection.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditboxselectionchangingeventargs.selectionstart
     * @type {Integer} 
     */
    SelectionStart {
        get => this.get_SelectionStart()
    }

    /**
     * Gets the length of the text selection.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditboxselectionchangingeventargs.selectionlength
     * @type {Integer} 
     */
    SelectionLength {
        get => this.get_SelectionLength()
    }

    /**
     * Gets or sets a value that indicates whether the selection operation should be canceled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.richeditboxselectionchangingeventargs.cancel
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
     * @returns {Integer} 
     */
    get_SelectionStart() {
        if (!this.HasProp("__IRichEditBoxSelectionChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(IRichEditBoxSelectionChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBoxSelectionChangingEventArgs := IRichEditBoxSelectionChangingEventArgs(outPtr)
        }

        return this.__IRichEditBoxSelectionChangingEventArgs.get_SelectionStart()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectionLength() {
        if (!this.HasProp("__IRichEditBoxSelectionChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(IRichEditBoxSelectionChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBoxSelectionChangingEventArgs := IRichEditBoxSelectionChangingEventArgs(outPtr)
        }

        return this.__IRichEditBoxSelectionChangingEventArgs.get_SelectionLength()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Cancel() {
        if (!this.HasProp("__IRichEditBoxSelectionChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(IRichEditBoxSelectionChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBoxSelectionChangingEventArgs := IRichEditBoxSelectionChangingEventArgs(outPtr)
        }

        return this.__IRichEditBoxSelectionChangingEventArgs.get_Cancel()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Cancel(value) {
        if (!this.HasProp("__IRichEditBoxSelectionChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(IRichEditBoxSelectionChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRichEditBoxSelectionChangingEventArgs := IRichEditBoxSelectionChangingEventArgs(outPtr)
        }

        return this.__IRichEditBoxSelectionChangingEventArgs.put_Cancel(value)
    }

;@endregion Instance Methods
}
