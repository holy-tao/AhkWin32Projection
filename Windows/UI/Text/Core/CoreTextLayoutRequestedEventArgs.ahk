#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreTextLayoutRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [LayoutRequested](coretexteditcontext_layoutrequested.md) event.
 * @remarks
 * An object of this type is passed as an argument to a handler for the [LayoutRequested](coretexteditcontext_layoutrequested.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextlayoutrequestedeventargs
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class CoreTextLayoutRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreTextLayoutRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreTextLayoutRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets information about a [LayoutRequested](coretexteditcontext_layoutrequested.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextlayoutrequestedeventargs.request
     * @type {CoreTextLayoutRequest} 
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
     * @returns {CoreTextLayoutRequest} 
     */
    get_Request() {
        if (!this.HasProp("__ICoreTextLayoutRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextLayoutRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextLayoutRequestedEventArgs := ICoreTextLayoutRequestedEventArgs(outPtr)
        }

        return this.__ICoreTextLayoutRequestedEventArgs.get_Request()
    }

;@endregion Instance Methods
}
