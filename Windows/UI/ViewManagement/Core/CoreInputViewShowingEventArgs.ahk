#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreInputViewShowingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains event data for the [PrimaryViewShowing](coreinputview_primaryviewshowing.md) event.
 * @remarks
 * Primary view refers to either of the [CoreInputViewKind.Keyboard](https://github.com/MicrosoftDocs/winrt-api/blob/docs/windows.ui.viewmanagement.core/coreinputviewkind.md#-field-keyboard1) or [CoreInputViewKind.Handwriting](https://github.com/MicrosoftDocs/winrt-api/blob/docs/windows.ui.viewmanagement.core/coreinputviewkind.md#-field-handwriting2) views, while CoreInputView can be any of the values from [CoreInputViewKind](coreinputviewkind.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputviewshowingeventargs
 * @namespace Windows.UI.ViewManagement.Core
 * @version WindowsRuntime 1.4
 */
class CoreInputViewShowingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreInputViewShowingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreInputViewShowingEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Attempts to cancel the [PrimaryViewShowing](coreinputview_primaryviewshowing.md) event of the input pane associated with the [CoreInputView](coreinputview.md) pane (if input pane is visible).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputviewshowingeventargs.trycancel
     */
    TryCancel() {
        if (!this.HasProp("__ICoreInputViewShowingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreInputViewShowingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputViewShowingEventArgs := ICoreInputViewShowingEventArgs(outPtr)
        }

        return this.__ICoreInputViewShowingEventArgs.TryCancel()
    }

;@endregion Instance Methods
}
