#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISettingsPane.ahk
#Include .\ISettingsPaneStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\SettingsPane.ahk
#Include .\SettingsPaneCommandsRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * > [!NOTE]
  * > SettingsPane is deprecated, and might not work on all versions of Windows 10. Instead of using a SettingsPane, integrate settings options into the app experience. For more info, see [Guidelines for app settings](/windows/uwp/app-settings/guidelines-for-app-settings).
  * 
  * A static class that enables the app to control the Settings Charm pane. The app can add or remove commands, receive a notification when the user opens the pane, or open the pane programmatically.
 * @remarks
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.settingspane
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class SettingsPane extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISettingsPane

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISettingsPane.IID

    /**
     * > [!NOTE]
     * > [SettingsPane](settingspane.md) is deprecated, and might not work on all versions of Windows 10. Instead of using a [SettingsPane](settingspane.md), integrate settings options into the app experience. For more info, see [Guidelines for app settings](/windows/uwp/app-settings/guidelines-for-app-settings).
     * 
     * Gets a value indicating whether the Settings charm appears on the left or right edge of the screen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.settingspane.edge
     * @type {Integer} 
     */
    static Edge {
        get => SettingsPane.get_Edge()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * > [!NOTE]
     * > [SettingsPane](settingspane.md) is deprecated, and might not work on all versions of Windows 10. Instead of using a [SettingsPane](settingspane.md), integrate settings options into the app experience. For more info, see [Guidelines for app settings](/windows/uwp/app-settings/guidelines-for-app-settings).
     * 
     * Gets a [SettingsPane](settingspane.md) object that is associated with the current app view (that is, with [CoreWindow](../windows.ui.core/corewindow.md)).
     * @remarks
     * If you're creating an app with XAML, you should override OnWindowCreated in App.xaml.cs/vb/cpp to register the [CommandsRequested](settingspane_commandsrequested.md) event there.
     * @returns {SettingsPane} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.settingspane.getforcurrentview
     */
    static GetForCurrentView() {
        if (!SettingsPane.HasProp("__ISettingsPaneStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ApplicationSettings.SettingsPane")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISettingsPaneStatics.IID)
            SettingsPane.__ISettingsPaneStatics := ISettingsPaneStatics(factoryPtr)
        }

        return SettingsPane.__ISettingsPaneStatics.GetForCurrentView()
    }

    /**
     * > [!NOTE]
     * > [SettingsPane](settingspane.md) is deprecated, and might not work on all versions of Windows 10. Instead of using a [SettingsPane](settingspane.md), integrate settings options into the app experience. For more info, see [Guidelines for app settings](/windows/uwp/app-settings/guidelines-for-app-settings).
     * 
     * Displays the Settings Charm pane to the user.
     * @remarks
     * The Show method raises an exception if one of the following is true:
     * 
     * + It is called from a snapped app.
     * + It is called when the current app does not have focus.
     * + It is called when the pane is already displayed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.applicationsettings.settingspane.show
     */
    static Show() {
        if (!SettingsPane.HasProp("__ISettingsPaneStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ApplicationSettings.SettingsPane")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISettingsPaneStatics.IID)
            SettingsPane.__ISettingsPaneStatics := ISettingsPaneStatics(factoryPtr)
        }

        return SettingsPane.__ISettingsPaneStatics.Show()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_Edge() {
        if (!SettingsPane.HasProp("__ISettingsPaneStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ApplicationSettings.SettingsPane")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISettingsPaneStatics.IID)
            SettingsPane.__ISettingsPaneStatics := ISettingsPaneStatics(factoryPtr)
        }

        return SettingsPane.__ISettingsPaneStatics.get_Edge()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCommandsRequestedToken")) {
            this.remove_CommandsRequested(this.__OnCommandsRequestedToken)
            this.__OnCommandsRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<SettingsPane, SettingsPaneCommandsRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CommandsRequested(handler) {
        if (!this.HasProp("__ISettingsPane")) {
            if ((queryResult := this.QueryInterface(ISettingsPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISettingsPane := ISettingsPane(outPtr)
        }

        return this.__ISettingsPane.add_CommandsRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_CommandsRequested(cookie) {
        if (!this.HasProp("__ISettingsPane")) {
            if ((queryResult := this.QueryInterface(ISettingsPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISettingsPane := ISettingsPane(outPtr)
        }

        return this.__ISettingsPane.remove_CommandsRequested(cookie)
    }

;@endregion Instance Methods
}
