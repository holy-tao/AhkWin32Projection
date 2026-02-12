#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreTextTextUpdatingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [TextUpdating](coretexteditcontext_textupdating.md) event.
 * @remarks
 * An object of this type is passed as an argument to a handler for the [TextUpdating](coretexteditcontext_textupdating.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretexttextupdatingeventargs
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class CoreTextTextUpdatingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreTextTextUpdatingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreTextTextUpdatingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates the range of text that the text input server needs to modify. The server populates this property before raising the event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretexttextupdatingeventargs.range
     * @type {CoreTextRange} 
     */
    Range {
        get => this.get_Range()
    }

    /**
     * Gets the text that the text input server is requesting to be set into the modified range. The server populates this property before raising the event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretexttextupdatingeventargs.text
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
    }

    /**
     * Gets a value that indicates the range of text that the text input server indicates should be selected. The server populates this property before raising the event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretexttextupdatingeventargs.newselection
     * @type {CoreTextRange} 
     */
    NewSelection {
        get => this.get_NewSelection()
    }

    /**
     * Gets a [Language](../windows.globalization/language.md) object representing the current input language.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretexttextupdatingeventargs.inputlanguage
     * @type {Language} 
     */
    InputLanguage {
        get => this.get_InputLanguage()
    }

    /**
     * Gets or sets a value that indicates the result of handling the [TextUpdating](coretexteditcontext_textupdating.md) event. The default value is **Succeeded** but if you can't action the operation as the text input server expects then before returning from the event handler set the property to the appropriate value to indicate what has happened.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretexttextupdatingeventargs.result
     * @type {Integer} 
     */
    Result {
        get => this.get_Result()
        set => this.put_Result(value)
    }

    /**
     * Gets a value that indicates whether the text update operation is canceled.
     * @remarks
     * If the app defers the operation, it is possible for it to be canceled before the app responds to it. For this reason, you should read this property, only once, immediately before responding to a deferred operation. 
     * 
     * > [!NOTE]
     * > The "getter" for the **IsCanceled** property notifies Windows that the app is beginning the deferred operation. You should consider reading this property as a required step before you perform the deferred operation. Use the pattern shown in the example when reading **IsCanceled**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretexttextupdatingeventargs.iscanceled
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
        if (!this.HasProp("__ICoreTextTextUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextTextUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextTextUpdatingEventArgs := ICoreTextTextUpdatingEventArgs(outPtr)
        }

        return this.__ICoreTextTextUpdatingEventArgs.get_Range()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        if (!this.HasProp("__ICoreTextTextUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextTextUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextTextUpdatingEventArgs := ICoreTextTextUpdatingEventArgs(outPtr)
        }

        return this.__ICoreTextTextUpdatingEventArgs.get_Text()
    }

    /**
     * 
     * @returns {CoreTextRange} 
     */
    get_NewSelection() {
        if (!this.HasProp("__ICoreTextTextUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextTextUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextTextUpdatingEventArgs := ICoreTextTextUpdatingEventArgs(outPtr)
        }

        return this.__ICoreTextTextUpdatingEventArgs.get_NewSelection()
    }

    /**
     * 
     * @returns {Language} 
     */
    get_InputLanguage() {
        if (!this.HasProp("__ICoreTextTextUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextTextUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextTextUpdatingEventArgs := ICoreTextTextUpdatingEventArgs(outPtr)
        }

        return this.__ICoreTextTextUpdatingEventArgs.get_InputLanguage()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Result() {
        if (!this.HasProp("__ICoreTextTextUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextTextUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextTextUpdatingEventArgs := ICoreTextTextUpdatingEventArgs(outPtr)
        }

        return this.__ICoreTextTextUpdatingEventArgs.get_Result()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Result(value) {
        if (!this.HasProp("__ICoreTextTextUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextTextUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextTextUpdatingEventArgs := ICoreTextTextUpdatingEventArgs(outPtr)
        }

        return this.__ICoreTextTextUpdatingEventArgs.put_Result(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCanceled() {
        if (!this.HasProp("__ICoreTextTextUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextTextUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextTextUpdatingEventArgs := ICoreTextTextUpdatingEventArgs(outPtr)
        }

        return this.__ICoreTextTextUpdatingEventArgs.get_IsCanceled()
    }

    /**
     * Requests that the text update operation be delayed. Call this method if your text input control is hosted on a worker thread rather than on the UI thread.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretexttextupdatingeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__ICoreTextTextUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextTextUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextTextUpdatingEventArgs := ICoreTextTextUpdatingEventArgs(outPtr)
        }

        return this.__ICoreTextTextUpdatingEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
