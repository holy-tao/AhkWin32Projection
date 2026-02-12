#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContentDialogButtonClickEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the button click events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialogbuttonclickeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ContentDialogButtonClickEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContentDialogButtonClickEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContentDialogButtonClickEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that can cancel the button click. A **true** value for Cancel cancels the default behavior.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialogbuttonclickeventargs.cancel
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
     * @returns {Boolean} 
     */
    get_Cancel() {
        if (!this.HasProp("__IContentDialogButtonClickEventArgs")) {
            if ((queryResult := this.QueryInterface(IContentDialogButtonClickEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialogButtonClickEventArgs := IContentDialogButtonClickEventArgs(outPtr)
        }

        return this.__IContentDialogButtonClickEventArgs.get_Cancel()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Cancel(value) {
        if (!this.HasProp("__IContentDialogButtonClickEventArgs")) {
            if ((queryResult := this.QueryInterface(IContentDialogButtonClickEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialogButtonClickEventArgs := IContentDialogButtonClickEventArgs(outPtr)
        }

        return this.__IContentDialogButtonClickEventArgs.put_Cancel(value)
    }

    /**
     * Gets a [ContentDialogButtonClickDeferral](contentdialogbuttonclickdeferral.md) that the app can use to respond asynchronously to a button click event.
     * @returns {ContentDialogButtonClickDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialogbuttonclickeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IContentDialogButtonClickEventArgs")) {
            if ((queryResult := this.QueryInterface(IContentDialogButtonClickEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialogButtonClickEventArgs := IContentDialogButtonClickEventArgs(outPtr)
        }

        return this.__IContentDialogButtonClickEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
