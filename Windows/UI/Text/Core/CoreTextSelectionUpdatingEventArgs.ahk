#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreTextSelectionUpdatingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [SelectionUpdating](coretexteditcontext_selectionupdating.md) event.
 * @remarks
 * An object of this type is passed as an argument to a handler for the [SelectionUpdating](coretexteditcontext_selectionupdating.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextselectionupdatingeventargs
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class CoreTextSelectionUpdatingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreTextSelectionUpdatingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreTextSelectionUpdatingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates the range of text that the text input server indicates should be selected. The server populates this property before raising the event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextselectionupdatingeventargs.selection
     * @type {CoreTextRange} 
     */
    Selection {
        get => this.get_Selection()
    }

    /**
     * Gets or sets a value that indicates the result of handling the [SelectionUpdating](coretexteditcontext_selectionupdating.md) event. The default value is **Succeeded** but if you can't action the operation as the text input server expects then before returning from the event handler set the property to the appropriate value to indicate what has happened.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextselectionupdatingeventargs.result
     * @type {Integer} 
     */
    Result {
        get => this.get_Result()
        set => this.put_Result(value)
    }

    /**
     * Gets a value that indicates whether the selection update operation is canceled.
     * @remarks
     * If the app defers the operation, it is possible for it to be canceled before the app responds to it. For this reason, you should read this property, only once, immediately before responding to a deferred operation. 
     * 
     * > [!NOTE]
     * > The "getter" for the **IsCanceled** property notifies Windows that the app is beginning the deferred operation. You should consider reading this property as a required step before you perform the deferred operation. Use the pattern shown in the example when reading **IsCanceled**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextselectionupdatingeventargs.iscanceled
     * @type {Boolean} 
     */
    IsCanceled {
        get => this.get_IsCanceled()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {CoreTextRange} 
     */
    get_Selection() {
        if (!this.HasProp("__ICoreTextSelectionUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextSelectionUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextSelectionUpdatingEventArgs := ICoreTextSelectionUpdatingEventArgs(outPtr)
        }

        return this.__ICoreTextSelectionUpdatingEventArgs.get_Selection()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Result() {
        if (!this.HasProp("__ICoreTextSelectionUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextSelectionUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextSelectionUpdatingEventArgs := ICoreTextSelectionUpdatingEventArgs(outPtr)
        }

        return this.__ICoreTextSelectionUpdatingEventArgs.get_Result()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Result(value) {
        if (!this.HasProp("__ICoreTextSelectionUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextSelectionUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextSelectionUpdatingEventArgs := ICoreTextSelectionUpdatingEventArgs(outPtr)
        }

        return this.__ICoreTextSelectionUpdatingEventArgs.put_Result(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCanceled() {
        if (!this.HasProp("__ICoreTextSelectionUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextSelectionUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextSelectionUpdatingEventArgs := ICoreTextSelectionUpdatingEventArgs(outPtr)
        }

        return this.__ICoreTextSelectionUpdatingEventArgs.get_IsCanceled()
    }

    /**
     * Requests that the selection update operation be delayed. Call this method if your text input control is hosted on a worker thread rather than on the UI thread.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextselectionupdatingeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__ICoreTextSelectionUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextSelectionUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextSelectionUpdatingEventArgs := ICoreTextSelectionUpdatingEventArgs(outPtr)
        }

        return this.__ICoreTextSelectionUpdatingEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
