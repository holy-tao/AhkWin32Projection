#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreTextFormatUpdatingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [FormatUpdating](coretexteditcontext_formatupdating.md) event.
 * @remarks
 * An object of this type is passed as an argument to a handler for the [FormatUpdating](coretexteditcontext_formatupdating.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextformatupdatingeventargs
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class CoreTextFormatUpdatingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreTextFormatUpdatingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreTextFormatUpdatingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates the range of text that the text input server needs to format. The server populates this property before raising the event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextformatupdatingeventargs.range
     * @type {CoreTextRange} 
     */
    Range {
        get => this.get_Range()
    }

    /**
     * Gets a value that represents the text color to be applied to the text range. The text input server populates this property before raising the event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextformatupdatingeventargs.textcolor
     * @type {IReference<Integer>} 
     */
    TextColor {
        get => this.get_TextColor()
    }

    /**
     * Gets a value that represents the background color to be applied to the text range. The text input server populates this property before raising the event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextformatupdatingeventargs.backgroundcolor
     * @type {IReference<Integer>} 
     */
    BackgroundColor {
        get => this.get_BackgroundColor()
    }

    /**
     * Gets a value that represents the underline color to be applied to the text range. The text input server populates this property before raising the event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextformatupdatingeventargs.underlinecolor
     * @type {IReference<Integer>} 
     */
    UnderlineColor {
        get => this.get_UnderlineColor()
    }

    /**
     * Gets a value that represents the underline type to be applied to the text range. The text input server populates this property before raising the event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextformatupdatingeventargs.underlinetype
     * @type {IReference<Integer>} 
     */
    UnderlineType {
        get => this.get_UnderlineType()
    }

    /**
     * Gets a value that indicates the reason that the text input server needs to apply formatting to this range of text. The server populates this property before raising the event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextformatupdatingeventargs.reason
     * @type {Integer} 
     */
    Reason {
        get => this.get_Reason()
    }

    /**
     * Gets or sets a value that indicates the result of handling the [FormatUpdating](coretexteditcontext_formatupdating.md) event. The default value is **Succeeded** but if you can't action the operation as the text input server expects then before returning from the event handler set the property to the appropriate value to indicate what has happened.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextformatupdatingeventargs.result
     * @type {Integer} 
     */
    Result {
        get => this.get_Result()
        set => this.put_Result(value)
    }

    /**
     * Gets a value that indicates whether the format update operation is canceled.
     * @remarks
     * If the app defers the operation, it is possible for it to be canceled before the app responds to it. For this reason, you should read this property, only once, immediately before responding to a deferred operation. 
     * 
     * > [!NOTE]
     * > The "getter" for the **IsCanceled** property notifies Windows that the app is beginning the deferred operation. You should consider reading this property as a required step before you perform the deferred operation. Use the pattern shown in the example when reading **IsCanceled**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextformatupdatingeventargs.iscanceled
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
        if (!this.HasProp("__ICoreTextFormatUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextFormatUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextFormatUpdatingEventArgs := ICoreTextFormatUpdatingEventArgs(outPtr)
        }

        return this.__ICoreTextFormatUpdatingEventArgs.get_Range()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_TextColor() {
        if (!this.HasProp("__ICoreTextFormatUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextFormatUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextFormatUpdatingEventArgs := ICoreTextFormatUpdatingEventArgs(outPtr)
        }

        return this.__ICoreTextFormatUpdatingEventArgs.get_TextColor()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_BackgroundColor() {
        if (!this.HasProp("__ICoreTextFormatUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextFormatUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextFormatUpdatingEventArgs := ICoreTextFormatUpdatingEventArgs(outPtr)
        }

        return this.__ICoreTextFormatUpdatingEventArgs.get_BackgroundColor()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_UnderlineColor() {
        if (!this.HasProp("__ICoreTextFormatUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextFormatUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextFormatUpdatingEventArgs := ICoreTextFormatUpdatingEventArgs(outPtr)
        }

        return this.__ICoreTextFormatUpdatingEventArgs.get_UnderlineColor()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_UnderlineType() {
        if (!this.HasProp("__ICoreTextFormatUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextFormatUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextFormatUpdatingEventArgs := ICoreTextFormatUpdatingEventArgs(outPtr)
        }

        return this.__ICoreTextFormatUpdatingEventArgs.get_UnderlineType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Reason() {
        if (!this.HasProp("__ICoreTextFormatUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextFormatUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextFormatUpdatingEventArgs := ICoreTextFormatUpdatingEventArgs(outPtr)
        }

        return this.__ICoreTextFormatUpdatingEventArgs.get_Reason()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Result() {
        if (!this.HasProp("__ICoreTextFormatUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextFormatUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextFormatUpdatingEventArgs := ICoreTextFormatUpdatingEventArgs(outPtr)
        }

        return this.__ICoreTextFormatUpdatingEventArgs.get_Result()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Result(value) {
        if (!this.HasProp("__ICoreTextFormatUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextFormatUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextFormatUpdatingEventArgs := ICoreTextFormatUpdatingEventArgs(outPtr)
        }

        return this.__ICoreTextFormatUpdatingEventArgs.put_Result(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCanceled() {
        if (!this.HasProp("__ICoreTextFormatUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextFormatUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextFormatUpdatingEventArgs := ICoreTextFormatUpdatingEventArgs(outPtr)
        }

        return this.__ICoreTextFormatUpdatingEventArgs.get_IsCanceled()
    }

    /**
     * Requests that the format update operation be delayed. Call this method if your text input control is hosted on a worker thread rather than on the UI thread.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextformatupdatingeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__ICoreTextFormatUpdatingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextFormatUpdatingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextFormatUpdatingEventArgs := ICoreTextFormatUpdatingEventArgs(outPtr)
        }

        return this.__ICoreTextFormatUpdatingEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
