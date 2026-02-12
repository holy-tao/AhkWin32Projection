#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreTextTextRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [TextRequested](coretexteditcontext_textrequested.md) event.
 * @remarks
 * An object of this type is passed as an argument to a handler for the [TextRequested](coretexteditcontext_textrequested.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretexttextrequestedeventargs
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class CoreTextTextRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreTextTextRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreTextTextRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets information about a [TextRequested](coretexteditcontext_textrequested.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretexttextrequestedeventargs.request
     * @type {CoreTextTextRequest} 
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
     * @returns {CoreTextTextRequest} 
     */
    get_Request() {
        if (!this.HasProp("__ICoreTextTextRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextTextRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextTextRequestedEventArgs := ICoreTextTextRequestedEventArgs(outPtr)
        }

        return this.__ICoreTextTextRequestedEventArgs.get_Request()
    }

;@endregion Instance Methods
}
