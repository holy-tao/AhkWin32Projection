#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines the types of toasts that can be shown by the system during and after app installation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallationtoastnotificationmode
 * @namespace Windows.ApplicationModel.Store.Preview.InstallControl
 * @version WindowsRuntime 1.4
 */
class AppInstallationToastNotificationMode extends Win32Enum{

    /**
     * The operating system chooses the appropriate toast.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * A toast with a popup.
     * @type {Integer (Int32)}
     */
    static Toast => 1

    /**
     * A toast without a popup.
     * @type {Integer (Int32)}
     */
    static ToastWithoutPopup => 2

    /**
     * No toast.
     * @type {Integer (Int32)}
     */
    static NoToast => 3
}
