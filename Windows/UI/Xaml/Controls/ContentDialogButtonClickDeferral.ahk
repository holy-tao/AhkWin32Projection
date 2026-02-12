#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContentDialogButtonClickDeferral.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a deferral that can be used by an app to respond asynchronously to a button click event.
 * @remarks
 * You can get an instance of this class by calling [ContentDialogButtonClickEventArgs.GetDeferral](contentdialogbuttonclickeventargs_getdeferral_254836512.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialogbuttonclickdeferral
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ContentDialogButtonClickDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContentDialogButtonClickDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContentDialogButtonClickDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Notifies the system that the app has finished processing the button click event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialogbuttonclickdeferral.complete
     */
    Complete() {
        if (!this.HasProp("__IContentDialogButtonClickDeferral")) {
            if ((queryResult := this.QueryInterface(IContentDialogButtonClickDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialogButtonClickDeferral := IContentDialogButtonClickDeferral(outPtr)
        }

        return this.__IContentDialogButtonClickDeferral.Complete()
    }

;@endregion Instance Methods
}
