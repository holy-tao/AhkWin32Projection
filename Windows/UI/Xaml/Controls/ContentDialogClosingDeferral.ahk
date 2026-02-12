#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContentDialogClosingDeferral.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a deferral that can be used by an app to respond asynchronously to the closing event of the [ContentDialog](contentdialog.md).
 * @remarks
 * You can get an instance of this class by calling [ContentDialogClosingEventArgs.GetDeferral](contentdialogclosingeventargs_getdeferral_254836512.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialogclosingdeferral
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ContentDialogClosingDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContentDialogClosingDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContentDialogClosingDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Notifies the system that the app has finished processing the closing event.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialogclosingdeferral.complete
     */
    Complete() {
        if (!this.HasProp("__IContentDialogClosingDeferral")) {
            if ((queryResult := this.QueryInterface(IContentDialogClosingDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialogClosingDeferral := IContentDialogClosingDeferral(outPtr)
        }

        return this.__IContentDialogClosingDeferral.Complete()
    }

;@endregion Instance Methods
}
