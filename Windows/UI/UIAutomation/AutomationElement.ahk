#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAutomationElement.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to a UI object that supports the [IUIAutomationElement](/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement) interface.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.automationelement
 * @namespace Windows.UI.UIAutomation
 * @version WindowsRuntime 1.4
 */
class AutomationElement extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAutomationElement

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAutomationElement.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets whether the element belongs to a UI Automation provider that is not hosted natively on the user's local machine.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.automationelement.isremotesystem
     * @type {Boolean} 
     */
    IsRemoteSystem {
        get => this.get_IsRemoteSystem()
    }

    /**
     * Gets the [AppUserModelId (AUMID)](/windows/win32/shell/appids) of the application that the element belongs to.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.automationelement.appusermodelid
     * @type {HSTRING} 
     */
    AppUserModelId {
        get => this.get_AppUserModelId()
    }

    /**
     * Gets the filename of the UI Automation provider's executable that the element belongs to.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.uiautomation.automationelement.executablefilename
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
        if (!this.HasProp("__IAutomationElement")) {
            if ((queryResult := this.QueryInterface(IAutomationElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationElement := IAutomationElement(outPtr)
        }

        return this.__IAutomationElement.get_IsRemoteSystem()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppUserModelId() {
        if (!this.HasProp("__IAutomationElement")) {
            if ((queryResult := this.QueryInterface(IAutomationElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationElement := IAutomationElement(outPtr)
        }

        return this.__IAutomationElement.get_AppUserModelId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExecutableFileName() {
        if (!this.HasProp("__IAutomationElement")) {
            if ((queryResult := this.QueryInterface(IAutomationElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationElement := IAutomationElement(outPtr)
        }

        return this.__IAutomationElement.get_ExecutableFileName()
    }

;@endregion Instance Methods
}
