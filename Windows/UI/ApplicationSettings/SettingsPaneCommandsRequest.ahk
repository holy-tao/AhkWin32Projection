#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISettingsPaneCommandsRequest.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!NOTE]
  * > SettingsPaneCommandsRequest is deprecated, and might not work on all versions of Windows 10. Instead of using a [SettingsPane](settingspane.md), integrate settings options into the app experience. For more info, see [Guidelines for app settings](/windows/uwp/app-settings/guidelines-for-app-settings).
  * 
  * Contains properties that are only available during the [CommandsRequested](settingspane_commandsrequested.md) event.
 * @remarks
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.settingspanecommandsrequest
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class SettingsPaneCommandsRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISettingsPaneCommandsRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISettingsPaneCommandsRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * > [!NOTE]
     * > [SettingsPaneCommandsRequest](settingspanecommandsrequest.md) is deprecated, and might not work on all versions of Windows 10. Instead of using a [SettingsPane](settingspane.md), integrate settings options into the app experience. For more info, see [Guidelines for app settings](/windows/uwp/app-settings/guidelines-for-app-settings).
     * 
     * A vector that is available during the [CommandsRequested](settingspane_commandsrequested.md) event. Append [SettingsCommand](settingscommand.md) objects to it to make them available to the [SettingsPane](settingspane.md)UI.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.settingspanecommandsrequest.applicationcommands
     * @type {IVector<SettingsCommand>} 
     */
    ApplicationCommands {
        get => this.get_ApplicationCommands()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<SettingsCommand>} 
     */
    get_ApplicationCommands() {
        if (!this.HasProp("__ISettingsPaneCommandsRequest")) {
            if ((queryResult := this.QueryInterface(ISettingsPaneCommandsRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISettingsPaneCommandsRequest := ISettingsPaneCommandsRequest(outPtr)
        }

        return this.__ISettingsPaneCommandsRequest.get_ApplicationCommands()
    }

;@endregion Instance Methods
}
