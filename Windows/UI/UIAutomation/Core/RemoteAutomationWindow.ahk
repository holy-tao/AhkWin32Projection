#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteAutomationWindow.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a window for a remote application (one that isn’t running on the local machine).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.remoteautomationwindow
 * @namespace Windows.UI.UIAutomation.Core
 * @version WindowsRuntime 1.4
 */
class RemoteAutomationWindow extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteAutomationWindow

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteAutomationWindow.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a UI Automation (UIA) provider object.
     * @remarks
     * This UIA provider should be returned as part of tree navigation of the local window’s tree wherever the Remote Desktop client wants to embed remote system UI.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.remoteautomationwindow.automationprovider
     * @type {IInspectable} 
     */
    AutomationProvider {
        get => this.get_AutomationProvider()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_AutomationProvider() {
        if (!this.HasProp("__IRemoteAutomationWindow")) {
            if ((queryResult := this.QueryInterface(IRemoteAutomationWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteAutomationWindow := IRemoteAutomationWindow(outPtr)
        }

        return this.__IRemoteAutomationWindow.get_AutomationProvider()
    }

    /**
     * Asynchronously unregisters the [Windows.UI.UIAutomation.Core.RemoteAutomationWindow](remoteautomationwindow.md).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.core.remoteautomationwindow.unregisterasync
     */
    UnregisterAsync() {
        if (!this.HasProp("__IRemoteAutomationWindow")) {
            if ((queryResult := this.QueryInterface(IRemoteAutomationWindow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteAutomationWindow := IRemoteAutomationWindow(outPtr)
        }

        return this.__IRemoteAutomationWindow.UnregisterAsync()
    }

;@endregion Instance Methods
}
