#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContentDialogClosingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the closing event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialogclosingeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ContentDialogClosingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContentDialogClosingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContentDialogClosingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [ContentDialogResult](contentdialogresult.md) of the closing event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialogclosingeventargs.result
     * @type {Integer} 
     */
    Result {
        get => this.get_Result()
    }

    /**
     * Gets or sets a value that can cancel the closing of the dialog.. A **true** value for [Cancel](contentdialogbuttonclickeventargs_cancel.md) cancels the default behavior.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialogclosingeventargs.cancel
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
    get_Result() {
        if (!this.HasProp("__IContentDialogClosingEventArgs")) {
            if ((queryResult := this.QueryInterface(IContentDialogClosingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialogClosingEventArgs := IContentDialogClosingEventArgs(outPtr)
        }

        return this.__IContentDialogClosingEventArgs.get_Result()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Cancel() {
        if (!this.HasProp("__IContentDialogClosingEventArgs")) {
            if ((queryResult := this.QueryInterface(IContentDialogClosingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialogClosingEventArgs := IContentDialogClosingEventArgs(outPtr)
        }

        return this.__IContentDialogClosingEventArgs.get_Cancel()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Cancel(value) {
        if (!this.HasProp("__IContentDialogClosingEventArgs")) {
            if ((queryResult := this.QueryInterface(IContentDialogClosingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialogClosingEventArgs := IContentDialogClosingEventArgs(outPtr)
        }

        return this.__IContentDialogClosingEventArgs.put_Cancel(value)
    }

    /**
     * Gets a [ContentDialogClosingDeferral](contentdialogclosingdeferral.md) that the app can use to respond asynchronously to the closing event.
     * @returns {ContentDialogClosingDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialogclosingeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IContentDialogClosingEventArgs")) {
            if ((queryResult := this.QueryInterface(IContentDialogClosingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialogClosingEventArgs := IContentDialogClosingEventArgs(outPtr)
        }

        return this.__IContentDialogClosingEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
