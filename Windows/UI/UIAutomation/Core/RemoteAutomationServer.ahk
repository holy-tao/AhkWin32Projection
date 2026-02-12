#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteAutomationServerStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a UI Automation provider session for establishing the server (remote) side of a connection between a local client and a remote provider.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.remoteautomationserver
 * @namespace Windows.UI.UIAutomation.Core
 * @version WindowsRuntime 1.4
 */
class RemoteAutomationServer extends IInspectable {
;@region Static Methods
    /**
     * Initiates the server (remote) side of a connection between a local client and a remote provider.
     * @remarks
     * The server session can be initialized 'lazily'—when the remote client app first detects an attempt to access its UI (for example, receives the WM_GETOBJECT window message or the [AutomationProviderRequested](../windows.ui.core/corewindow_automationproviderrequested.md) event), it can send a protocol-appropriate message to the server, which invokes this method.
     * 
     * It doesn't matter which side is ready to connect first. Each side of the connection will wait (with a timeout) for the other to complete the connection.
     * @param {Guid} sessionId The unique identifier for the session.
     * 
     * This should be the same identifer as the corresponding client session was initialized with.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.remoteautomationserver.reportsession
     */
    static ReportSession(sessionId) {
        if (!RemoteAutomationServer.HasProp("__IRemoteAutomationServerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.UIAutomation.Core.RemoteAutomationServer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteAutomationServerStatics.IID)
            RemoteAutomationServer.__IRemoteAutomationServerStatics := IRemoteAutomationServerStatics(factoryPtr)
        }

        return RemoteAutomationServer.__IRemoteAutomationServerStatics.ReportSession(sessionId)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
