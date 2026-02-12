#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContentDialogClosedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [Closed](contentdialog_closed.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialogclosedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ContentDialogClosedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContentDialogClosedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContentDialogClosedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [ContentDialogResult](contentdialogresult.md) of the button click event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentdialogclosedeventargs.result
     * @type {Integer} 
     */
    Result {
        get => this.get_Result()
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
        if (!this.HasProp("__IContentDialogClosedEventArgs")) {
            if ((queryResult := this.QueryInterface(IContentDialogClosedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentDialogClosedEventArgs := IContentDialogClosedEventArgs(outPtr)
        }

        return this.__IContentDialogClosedEventArgs.get_Result()
    }

;@endregion Instance Methods
}
