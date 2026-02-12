#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteAutomationDisconnectedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [RemoteAutomationClientSession.Disconnected](remoteautomationclientsession_disconnected.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.remoteautomationdisconnectedeventargs
 * @namespace Windows.UI.UIAutomation.Core
 * @version WindowsRuntime 1.4
 */
class RemoteAutomationDisconnectedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteAutomationDisconnectedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteAutomationDisconnectedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the full pipe path to a remote provider that is to be closed.
     * @remarks
     * Multiple clients can exist on the local machine and each can establish a unique connection with the remote provider, with each having a different pipe name.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.remoteautomationdisconnectedeventargs.localpipename
     * @type {HSTRING} 
     */
    LocalPipeName {
        get => this.get_LocalPipeName()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LocalPipeName() {
        if (!this.HasProp("__IRemoteAutomationDisconnectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRemoteAutomationDisconnectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteAutomationDisconnectedEventArgs := IRemoteAutomationDisconnectedEventArgs(outPtr)
        }

        return this.__IRemoteAutomationDisconnectedEventArgs.get_LocalPipeName()
    }

;@endregion Instance Methods
}
