#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreTextSelectionRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [SelectionRequested](coretexteditcontext_selectionrequested.md) event.
 * @remarks
 * An object of this type is passed as an argument to a handler for the [SelectionRequested](coretexteditcontext_selectionrequested.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextselectionrequestedeventargs
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class CoreTextSelectionRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreTextSelectionRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreTextSelectionRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets information about a [SelectionRequested](coretexteditcontext_selectionrequested.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextselectionrequestedeventargs.request
     * @type {CoreTextSelectionRequest} 
     */
    Request {
        get => this.get_Request()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {CoreTextSelectionRequest} 
     */
    get_Request() {
        if (!this.HasProp("__ICoreTextSelectionRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextSelectionRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextSelectionRequestedEventArgs := ICoreTextSelectionRequestedEventArgs(outPtr)
        }

        return this.__ICoreTextSelectionRequestedEventArgs.get_Request()
    }

;@endregion Instance Methods
}
