#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISettingsPaneCommandsRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!NOTE]
  * > SettingsPaneCommandsRequestedEventArgs is deprecated, and might not work on all versions of Windows 10. Instead of using a [SettingsPane](settingspane.md), integrate settings options into the app experience. For more info, see [Guidelines for app settings](/windows/uwp/app-settings/guidelines-for-app-settings).
  * 
  * Contains arguments that are available from the event object during the [CommandsRequested](settingspane_commandsrequested.md) event.
 * @remarks
 * This class object is obtained from the event object during the [CommandsRequested](settingspane_commandsrequested.md) event.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.settingspanecommandsrequestedeventargs
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class SettingsPaneCommandsRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISettingsPaneCommandsRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISettingsPaneCommandsRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * > [!NOTE]
     * > [SettingsPaneCommandsRequestedEventArgs](settingspanecommandsrequestedeventargs.md) is deprecated, and might not work on all versions of Windows 10. Instead of using a [SettingsPane](settingspane.md), integrate settings options into the app experience. For more info, see [Guidelines for app settings](/windows/uwp/app-settings/guidelines-for-app-settings).
     * 
     * An instance of [SettingsPaneCommandsRequest](settingspanecommandsrequest.md) that is made available during the [CommandsRequested](settingspane_commandsrequested.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.settingspanecommandsrequestedeventargs.request
     * @type {SettingsPaneCommandsRequest} 
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
     * @returns {SettingsPaneCommandsRequest} 
     */
    get_Request() {
        if (!this.HasProp("__ISettingsPaneCommandsRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISettingsPaneCommandsRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISettingsPaneCommandsRequestedEventArgs := ISettingsPaneCommandsRequestedEventArgs(outPtr)
        }

        return this.__ISettingsPaneCommandsRequestedEventArgs.get_Request()
    }

;@endregion Instance Methods
}
