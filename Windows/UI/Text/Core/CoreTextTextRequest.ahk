#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreTextTextRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents information about a [TextRequested](coretexteditcontext_textrequested.md) event.
 * @remarks
 * An object of this type can be obtained from the [CoreTextTextRequestedEventArgs.Request](coretexttextrequestedeventargs_request.md) property inside a handler for the [CoreTextEditContext.TextRequested](coretexteditcontext_textrequested.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretexttextrequest
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class CoreTextTextRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreTextTextRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreTextTextRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates the range of text being requested by the text input server. The server populates this property before raising the event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretexttextrequest.range
     * @type {CoreTextRange} 
     */
    Range {
        get => this.get_Range()
    }

    /**
     * Gets or sets the text that the text input server is requesting. The application should set the text being requested before returning from the event handler.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretexttextrequest.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

    /**
     * Gets a value that indicates whether the text request operation is canceled.
     * @remarks
     * If the app defers the operation, it is possible for it to be canceled before the app responds to it. For this reason, you should read this property, only once, immediately before responding to a deferred operation. 
     * 
     * > [!NOTE]
     * > The "getter" for the **IsCanceled** property notifies Windows that the app is beginning the deferred operation. You should consider reading this property as a required step before you perform the deferred operation. Use the pattern shown in the example when reading **IsCanceled**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretexttextrequest.iscanceled
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
    get_Range() {
        if (!this.HasProp("__ICoreTextTextRequest")) {
            if ((queryResult := this.QueryInterface(ICoreTextTextRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextTextRequest := ICoreTextTextRequest(outPtr)
        }

        return this.__ICoreTextTextRequest.get_Range()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__ICoreTextTextRequest")) {
            if ((queryResult := this.QueryInterface(ICoreTextTextRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextTextRequest := ICoreTextTextRequest(outPtr)
        }

        return this.__ICoreTextTextRequest.get_Text()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Text(value) {
        if (!this.HasProp("__ICoreTextTextRequest")) {
            if ((queryResult := this.QueryInterface(ICoreTextTextRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextTextRequest := ICoreTextTextRequest(outPtr)
        }

        return this.__ICoreTextTextRequest.put_Text(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCanceled() {
        if (!this.HasProp("__ICoreTextTextRequest")) {
            if ((queryResult := this.QueryInterface(ICoreTextTextRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextTextRequest := ICoreTextTextRequest(outPtr)
        }

        return this.__ICoreTextTextRequest.get_IsCanceled()
    }

    /**
     * Requests that the text request operation be delayed. Call this method if your text input control is hosted on a worker thread rather than on the UI thread.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretexttextrequest.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__ICoreTextTextRequest")) {
            if ((queryResult := this.QueryInterface(ICoreTextTextRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextTextRequest := ICoreTextTextRequest(outPtr)
        }

        return this.__ICoreTextTextRequest.GetDeferral()
    }

;@endregion Instance Methods
}
