#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Specifies various options for adding a resource package to an app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.addresourcepackageoptions
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class AddResourcePackageOptions extends Win32BitflagEnum{

    /**
     * Downloads the specific package requested.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Restarts the application when resource packages are successfully added.
     * @type {Integer (UInt32)}
     */
    static ForceTargetAppShutdown => 1

    /**
     * Downloads all package updates if they are available.
     * @type {Integer (UInt32)}
     */
    static ApplyUpdateIfAvailable => 2
}
