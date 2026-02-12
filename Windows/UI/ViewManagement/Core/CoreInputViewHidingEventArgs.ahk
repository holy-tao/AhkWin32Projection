#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreInputViewHidingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains event data for the [PrimaryViewHiding](coreinputview_primaryviewhiding.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputviewhidingeventargs
 * @namespace Windows.UI.ViewManagement.Core
 * @version WindowsRuntime 1.4
 */
class CoreInputViewHidingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreInputViewHidingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreInputViewHidingEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Attempts to cancel the [PrimaryViewHiding](coreinputview_primaryviewhiding.md) event of the input pane associated with the [CoreInputView](coreinputview.md) (if input pane is visible).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.core.coreinputviewhidingeventargs.trycancel
     */
    TryCancel() {
        if (!this.HasProp("__ICoreInputViewHidingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreInputViewHidingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInputViewHidingEventArgs := ICoreInputViewHidingEventArgs(outPtr)
        }

        return this.__ICoreInputViewHidingEventArgs.TryCancel()
    }

;@endregion Instance Methods
}
