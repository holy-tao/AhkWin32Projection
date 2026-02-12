#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Struct.ahk

/**
 * Gets the installation progress of installing a resource package or an app package.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageinstallprogress
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class PackageInstallProgress extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The percent of the package that has been installed.
     * @type {Integer}
     */
    PercentComplete {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
