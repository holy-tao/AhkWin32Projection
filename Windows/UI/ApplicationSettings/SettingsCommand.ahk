#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\Popups\IUICommand.ahk
#Include .\ISettingsCommandFactory.ahk
#Include .\ISettingsCommandStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!NOTE]
  * > [SettingsPane](settingspane.md) is deprecated, and might not work on all versions of Windows 10. Instead of using a [SettingsPane](settingspane.md), integrate settings options into the app experience. For more info, see [Guidelines for app settings](/windows/uwp/app-settings/guidelines-for-app-settings).
  * 
  * Creates a settings command object that represents a settings entry. This settings command can be appended to the [ApplicationCommands](settingspanecommandsrequest_applicationcommands.md) vector.
 * @remarks
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.settingscommand
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class SettingsCommand extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUICommand

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUICommand.IID

    /**
     * Gets the command for a web account in the account settings pane.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.settingscommand.accountscommand
     * @type {SettingsCommand} 
     */
    static AccountsCommand {
        get => SettingsCommand.get_AccountsCommand()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new settings command.
     * @param {IInspectable} settingsCommandId The ID of the command.
     * @param {HSTRING} label The label for the command, which is displayed in the settings pane.
     * @param {UICommandInvokedHandler} handler The event handler that is called when the user selects this command in the settings pane.
     * @returns {SettingsCommand} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.settingscommand.#ctor
     */
    static CreateSettingsCommand(settingsCommandId, label, handler) {
        if (!SettingsCommand.HasProp("__ISettingsCommandFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.ApplicationSettings.SettingsCommand")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISettingsCommandFactory.IID)
            SettingsCommand.__ISettingsCommandFactory := ISettingsCommandFactory(factoryPtr)
        }

        return SettingsCommand.__ISettingsCommandFactory.CreateSettingsCommand(settingsCommandId, label, handler)
    }

    /**
     * 
     * @returns {SettingsCommand} 
     */
    static get_AccountsCommand() {
        if (!SettingsCommand.HasProp("__ISettingsCommandStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ApplicationSettings.SettingsCommand")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISettingsCommandStatics.IID)
            SettingsCommand.__ISettingsCommandStatics := ISettingsCommandStatics(factoryPtr)
        }

        return SettingsCommand.__ISettingsCommandStatics.get_AccountsCommand()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the label for the command.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.settingscommand.label
     * @type {HSTRING} 
     */
    Label {
        get => this.get_Label()
        set => this.put_Label(value)
    }

    /**
     * Gets or sets the handler for the event that is raised when the user selects the command.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.settingscommand.invoked
     * @type {UICommandInvokedHandler} 
     */
    Invoked {
        get => this.get_Invoked()
        set => this.put_Invoked(value)
    }

    /**
     * Gets or sets the command ID.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.settingscommand.id
     * @type {IInspectable} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
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
    get_Label() {
        if (!this.HasProp("__IUICommand")) {
            if ((queryResult := this.QueryInterface(IUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUICommand := IUICommand(outPtr)
        }

        return this.__IUICommand.get_Label()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Label(value) {
        if (!this.HasProp("__IUICommand")) {
            if ((queryResult := this.QueryInterface(IUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUICommand := IUICommand(outPtr)
        }

        return this.__IUICommand.put_Label(value)
    }

    /**
     * 
     * @returns {UICommandInvokedHandler} 
     */
    get_Invoked() {
        if (!this.HasProp("__IUICommand")) {
            if ((queryResult := this.QueryInterface(IUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUICommand := IUICommand(outPtr)
        }

        return this.__IUICommand.get_Invoked()
    }

    /**
     * 
     * @param {UICommandInvokedHandler} value 
     * @returns {HRESULT} 
     */
    put_Invoked(value) {
        if (!this.HasProp("__IUICommand")) {
            if ((queryResult := this.QueryInterface(IUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUICommand := IUICommand(outPtr)
        }

        return this.__IUICommand.put_Invoked(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Id() {
        if (!this.HasProp("__IUICommand")) {
            if ((queryResult := this.QueryInterface(IUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUICommand := IUICommand(outPtr)
        }

        return this.__IUICommand.get_Id()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Id(value) {
        if (!this.HasProp("__IUICommand")) {
            if ((queryResult := this.QueryInterface(IUICommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUICommand := IUICommand(outPtr)
        }

        return this.__IUICommand.put_Id(value)
    }

;@endregion Instance Methods
}
