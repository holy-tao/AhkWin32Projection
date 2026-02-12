#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IShareWindowCommandEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event arguments passed when the [ShareWindowCommandSource.CommandRequested](sharewindowcommandsource_commandrequested.md) and [ShareWindowCommandSource.CommandInvoked](sharewindowcommandsource_commandinvoked.md) events are raised.
 * @remarks
 * [IShareWindowCommandEventArgsInterop](/windows/win32/api/sharewindowcommandsourceinterop/nn-sharewindowcommandsourceinterop-isharewindowcommandeventargsinterop) is a native interoperation interface that allows getting a window identifier (a window handle) from a [ShareWindowCommandEventArgs](/uwp/api/windows.ui.shell.sharewindowcommandeventargs) object.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.sharewindowcommandeventargs
 * @namespace Windows.UI.Shell
 * @version WindowsRuntime 1.4
 */
class ShareWindowCommandEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IShareWindowCommandEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IShareWindowCommandEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the window identifier associated with the window sharing command. Your communications app can use this identifier to capture window contents, and share in an app-specific way.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.sharewindowcommandeventargs.windowid
     * @type {WindowId} 
     */
    WindowId {
        get => this.get_WindowId()
    }

    /**
     * Gets or sets the window sharing command.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.shell.sharewindowcommandeventargs.command
     * @type {Integer} 
     */
    Command {
        get => this.get_Command()
        set => this.put_Command(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {WindowId} 
     */
    get_WindowId() {
        if (!this.HasProp("__IShareWindowCommandEventArgs")) {
            if ((queryResult := this.QueryInterface(IShareWindowCommandEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareWindowCommandEventArgs := IShareWindowCommandEventArgs(outPtr)
        }

        return this.__IShareWindowCommandEventArgs.get_WindowId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Command() {
        if (!this.HasProp("__IShareWindowCommandEventArgs")) {
            if ((queryResult := this.QueryInterface(IShareWindowCommandEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareWindowCommandEventArgs := IShareWindowCommandEventArgs(outPtr)
        }

        return this.__IShareWindowCommandEventArgs.get_Command()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Command(value) {
        if (!this.HasProp("__IShareWindowCommandEventArgs")) {
            if ((queryResult := this.QueryInterface(IShareWindowCommandEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareWindowCommandEventArgs := IShareWindowCommandEventArgs(outPtr)
        }

        return this.__IShareWindowCommandEventArgs.put_Command(value)
    }

;@endregion Instance Methods
}
