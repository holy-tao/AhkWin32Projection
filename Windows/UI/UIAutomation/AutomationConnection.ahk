#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAutomationConnection.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to the connection details of a UI Automation connection.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.automationconnection
 * @namespace Windows.UI.UIAutomation
 * @version WindowsRuntime 1.4
 */
class AutomationConnection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAutomationConnection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAutomationConnection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets whether the connection is to a UI Automation provider that is not hosted natively on the user's local machine.
     * @remarks
     * For UIA, a remote system is any UI that is not hosted natively on the user's local machine but instead resides either in a container or on a different machine accessed via network.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.automationconnection.isremotesystem
     * @type {Boolean} 
     */
    IsRemoteSystem {
        get => this.get_IsRemoteSystem()
    }

    /**
     * Gets the [AppUserModelId (AUMID)](/windows/win32/shell/appids) of the UI Automation provider.
     * @remarks
     * An AppUserModelId is used to associate processes, files, and windows with a particular application.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.automationconnection.appusermodelid
     * @type {HSTRING} 
     */
    AppUserModelId {
        get => this.get_AppUserModelId()
    }

    /**
     * Gets the filename of the UI Automation provider's executable.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.automationconnection.executablefilename
     * @type {HSTRING} 
     */
    ExecutableFileName {
        get => this.get_ExecutableFileName()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRemoteSystem() {
        if (!this.HasProp("__IAutomationConnection")) {
            if ((queryResult := this.QueryInterface(IAutomationConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationConnection := IAutomationConnection(outPtr)
        }

        return this.__IAutomationConnection.get_IsRemoteSystem()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppUserModelId() {
        if (!this.HasProp("__IAutomationConnection")) {
            if ((queryResult := this.QueryInterface(IAutomationConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationConnection := IAutomationConnection(outPtr)
        }

        return this.__IAutomationConnection.get_AppUserModelId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExecutableFileName() {
        if (!this.HasProp("__IAutomationConnection")) {
            if ((queryResult := this.QueryInterface(IAutomationConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationConnection := IAutomationConnection(outPtr)
        }

        return this.__IAutomationConnection.get_ExecutableFileName()
    }

;@endregion Instance Methods
}
