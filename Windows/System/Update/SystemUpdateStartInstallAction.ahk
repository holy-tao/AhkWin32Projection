#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * 
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatestartinstallaction
 * @namespace Windows.System.Update
 * @version WindowsRuntime 1.4
 */
class SystemUpdateStartInstallAction extends Win32Enum{

    /**
     * Download, and install.  Wait for interactive reboot to install or automatic reboot window if reboots are required.
     * @type {Integer (Int32)}
     */
    static UpToReboot => 0

    /**
     * Download, and install.  If reboots are required reboot automatically as sson as they are required
     * @type {Integer (Int32)}
     */
    static AllowReboot => 1
}
