#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreTextSelectionRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents information about a [SelectionRequested](coretexteditcontext_selectionrequested.md) event.
 * @remarks
 * An object of this type can be obtained from the [CoreTextSelectionRequestedEventArgs.Request](coretextselectionrequestedeventargs_request.md) property inside a handler for the [CoreTextEditContext.SelectionRequested](coretexteditcontext_selectionrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextselectionrequest
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class CoreTextSelectionRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreTextSelectionRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreTextSelectionRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the selection range that the text input server is requesting. The application should set the current range of selection before returning from the event handler.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextselectionrequest.selection
     * @type {CoreTextRange} 
     */
    Selection {
        get => this.get_Selection()
        set => this.put_Selection(value)
    }

    /**
     * Gets a value that indicates whether the selection request operation is canceled.
     * @remarks
     * If the app defers the operation, it is possible for it to be canceled before the app responds to it. For this reason, you should read this property, only once, immediately before responding to a deferred operation. 
     * 
     * > [!NOTE]
     * > The "getter" for the **IsCanceled** property notifies Windows that the app is beginning the deferred operation. You should consider reading this property as a required step before you perform the deferred operation. Use the pattern shown in the example when reading **IsCanceled**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextselectionrequest.iscanceled
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
        if (!this.HasProp("__ICoreTextSelectionRequest")) {
            if ((queryResult := this.QueryInterface(ICoreTextSelectionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextSelectionRequest := ICoreTextSelectionRequest(outPtr)
        }

        return this.__ICoreTextSelectionRequest.get_Selection()
    }

    /**
     * 
     * @param {CoreTextRange} value 
     * @returns {HRESULT} 
     */
    put_Selection(value) {
        if (!this.HasProp("__ICoreTextSelectionRequest")) {
            if ((queryResult := this.QueryInterface(ICoreTextSelectionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextSelectionRequest := ICoreTextSelectionRequest(outPtr)
        }

        return this.__ICoreTextSelectionRequest.put_Selection(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCanceled() {
        if (!this.HasProp("__ICoreTextSelectionRequest")) {
            if ((queryResult := this.QueryInterface(ICoreTextSelectionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextSelectionRequest := ICoreTextSelectionRequest(outPtr)
        }

        return this.__ICoreTextSelectionRequest.get_IsCanceled()
    }

    /**
     * Requests that the selection request operation be delayed. Call this method if your text input control is hosted on a worker thread rather than on the UI thread.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextselectionrequest.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__ICoreTextSelectionRequest")) {
            if ((queryResult := this.QueryInterface(ICoreTextSelectionRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextSelectionRequest := ICoreTextSelectionRequest(outPtr)
        }

        return this.__ICoreTextSelectionRequest.GetDeferral()
    }

;@endregion Instance Methods
}
