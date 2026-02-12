#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteAutomationConnectionRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [ConnectionRequested](remoteautomationclientsession_connectionrequested.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.remoteautomationconnectionrequestedeventargs
 * @namespace Windows.UI.UIAutomation.Core
 * @version WindowsRuntime 1.4
 */
class RemoteAutomationConnectionRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteAutomationConnectionRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteAutomationConnectionRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the full pipe path to be shared with the remote session.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.remoteautomationconnectionrequestedeventargs.localpipename
     * @type {HSTRING} 
     */
    LocalPipeName {
        get => this.get_LocalPipeName()
    }

    /**
     * Gets the unique process identifier of the remote application to connect to.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.remoteautomationconnectionrequestedeventargs.remoteprocessid
     * @type {Integer} 
     */
    RemoteProcessId {
        get => this.get_RemoteProcessId()
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
        if (!this.HasProp("__IRemoteAutomationConnectionRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRemoteAutomationConnectionRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteAutomationConnectionRequestedEventArgs := IRemoteAutomationConnectionRequestedEventArgs(outPtr)
        }

        return this.__IRemoteAutomationConnectionRequestedEventArgs.get_LocalPipeName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RemoteProcessId() {
        if (!this.HasProp("__IRemoteAutomationConnectionRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRemoteAutomationConnectionRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteAutomationConnectionRequestedEventArgs := IRemoteAutomationConnectionRequestedEventArgs(outPtr)
        }

        return this.__IRemoteAutomationConnectionRequestedEventArgs.get_RemoteProcessId()
    }

;@endregion Instance Methods
}
